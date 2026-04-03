{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Lib
import Options.Applicative

-- | Parser for ImageFormat
imageFormatParser :: Parser ImageFormat
imageFormatParser = 
      flag' Jpeg (long "jpeg" <> help "Output as JPEG")
  <|> flag' Tiff (long "tiff" <> help "Output as TIFF")
  <|> flag' Png  (long "png"  <> help "Output as PNG (default)")
  <|> option (eitherReader parseFormat)
      ( long "format"
     <> short 'f'
     <> metavar "FORMAT"
     <> help "Output format: png, jpeg, or tiff"
     <> value Png
     <> showDefault
      )
  where
    parseFormat "png"  = Right Png
    parseFormat "jpeg" = Right Jpeg
    parseFormat "tiff" = Right Tiff
    parseFormat other  = Left $ "Unknown format: " ++ other

-- | Parser for PdfConverterOptions
optionsParser :: Parser PdfConverterOptions
optionsParser = PdfConverterOptions
  <$> strArgument
      ( metavar "INPUT_PDF_OR_DIR"
     <> help "Path to the input PDF file or directory containing PDF files"
      )
  <*> strOption
      ( long "output-dir"
     <> short 'o'
     <> metavar "DIR"
     <> help "Directory to save the output images"
     <> value "."
     <> showDefault
      )
  <*> optional (strOption
      ( long "prefix"
     <> short 'p'
     <> metavar "PREFIX"
     <> help "Prefix for the output image filenames (default: page)"
      ))
  <*> imageFormatParser
  <*> optional (option auto
      ( long "limit"
     <> short 'l'
     <> metavar "N"
     <> help "Limit the number of pages to process per PDF (starting from page 1)"
      ))

-- | Run the CLI
main :: IO ()
main = do
  options <- execParser optsWithHelp
  run options
  where
    optsWithHelp = info (optionsParser <**> helper)
      ( fullDesc
     <> progDesc "Convert one or more PDF files into images using pdftoppm"
     <> header "pdf-to-images - A PDF-to-Image converter in Haskell"
      )
