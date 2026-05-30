# Procedure: Processing Customer Refunds

### 1. Goal
To verify and process customer refund requests within the 30-day policy.

### 2. Checklist Before Starting
* [ ] Customer order number & email.
* [ ] Access to CRM & Payment Processor (Stripe/PayPal).

### 3. Step-by-Step Instructions

* **Step 1: Check Eligibility**
  * Find the order in CRM.
  * Verify the purchase was in the last **30 days**.
  * *If older than 30 days:* Deny the request using email template `REFUND_DENIED_EXPIRED`.

* **Step 2: Process in Payment Portal**
  * Search for the transaction ID.
  * Click **Issue Refund** (enter full or partial amount).
  * Copy the refund reference number.

* **Step 3: Update & Notify**
  * Add the reference number to the CRM ticket.
  * Close the ticket as **Resolved**.
  * Email the customer using template `REFUND_APPROVED_CONFIRMATION`.

### 4. How to Invoke this Procedure
To run this procedure, instruct the assistant with the following request:
* **To process customer refunds:**
  > "Please follow the procedure in `sample-sop.procedure.md` to process the refund request for order `{{ORDER_NUMBER}}`."
