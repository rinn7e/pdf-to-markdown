{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}

module Main (main) where

import Options.Applicative
import System.Directory (listDirectory, doesFileExist)
import System.FilePath (takeExtension, (</>), takeFileName)
import Data.List (sort)
import qualified Data.ByteString.Lazy as BL
import Control.Monad (forM_)
import qualified Data.Text as T
import qualified Data.Text.Encoding as E
import qualified Data.ByteString.Builder as BB
import Data.Maybe (fromMaybe)

data Options = Options
  { inputDir   :: FilePath
  , outputDir  :: FilePath
  , outputName :: Maybe String
  }

optionsParser :: Parser Options
optionsParser = Options
  <$> strOption
      ( long "input-dir"
     <> short 'i'
     <> metavar "DIR"
     <> help "Directory containing markdown files to merge" )
  <*> strOption
      ( long "output-dir"
     <> short 'o'
     <> metavar "DIR"
     <> help "Output directory for the merged file" )
  <*> optional (strOption
      ( long "name"
     <> short 'n'
     <> metavar "NAME"
     <> help "Explicit name for the output file (without .md)" ))

main :: IO ()
main = runMerger =<< execParser opts
  where
    opts = info (optionsParser <**> helper)
      ( fullDesc
     <> progDesc "Merge multiple markdown files into a single document"
     <> header "combine-md - A tool to merge markdown pages" )

runMerger :: Options -> IO ()
runMerger Options{..} = do
  files <- listDirectory inputDir
  let mdFiles = sort [ inputDir </> f | f <- files, takeExtension f == ".md" ]
  
  let fallbackName = takeFileName (T.unpack $ T.dropWhileEnd (== '/') $ T.pack inputDir)
  let name = fromMaybe fallbackName outputName
  let outputFile = outputDir </> (name ++ ".md")
  
  putStrLn $ "Merging " ++ show (length mdFiles) ++ " files into " ++ outputFile
  
  BL.writeFile outputFile ""
  
  forM_ (zip [1..] mdFiles) $ \(i, file) -> do
    content <- BL.readFile file
    let text = E.decodeUtf8 (BL.toStrict content)
    let cleaned = cleanText text
    let separator = if i == 1 then "" else "\n"
    let builder = BB.lazyByteString (BL.fromStrict $ E.encodeUtf8 $ T.pack separator)
               <> BB.lazyByteString (BL.fromStrict $ E.encodeUtf8 cleaned)
    BL.appendFile outputFile (BB.toLazyByteString builder)


  putStrLn "Successfully merged files."

cleanText :: T.Text -> T.Text
cleanText = T.unlines . stripBlank . filter (not . isPageMarker) . T.lines
  where
    isPageMarker l = 
      let trimmed = T.strip l
          inner = T.drop 18 $ T.dropEnd 4 trimmed
      in T.isPrefixOf "<p align=\"center\">" trimmed && T.isSuffixOf "</p>" trimmed && allIsDigit inner
    
    allIsDigit t = T.all (\c -> c `elem` ("០១២៣៤៥៦៧៨៩0123456789" :: String)) t && not (T.null t)

    stripBlank = dropWhile T.null . reverse . dropWhile T.null . reverse


