*** Settings ***
Resource  ../import.resource
Suite Setup  connect transfer history db
Suite Teardown  disconnect from database

*** Test Cases ***
TC_TRANSFER_001 - Successful - transfer money to the recipient's Bank account within daily limit
  ${response}  send post request to transfer money
  ...  ${bank_account.amount}
  ...  ${bank_account.sending_account}
  ...  ${bank_account.receiving_account}
  ...  ${bank_account.receiving_bank_code}
  status should be  200  ${response}
  success response body should return transfer information  ${response}
  validate response message, response data and transfer db data  ${response}  SUCCESS

TC_TRANSFER_002 - Successful - transfer money to the recipient's PromptPay mobile within daily limit
  ${response}  send post request to transfer money
  ...  ${promptpay_mobile.amount}
  ...  ${promptpay_mobile.sending_account}
  ...  ${promptpay_mobile.receiving_account}
  ...  ${promptpay_mobile.receiving_bank_code}
  status should be  200  ${response}
  success response body should return transfer information  ${response}
  validate response message, response data and transfer db data  ${response}  SUCCESS

TC_TRANSFER_003 - Successful - transfer money to the recipient's PromptPay nationalID within daily limit.
  ${response}  send post request to transfer money
  ...  ${promptpay_national_id.amount}
  ...  ${promptpay_national_id.sending_account}
  ...  ${promptpay_national_id.receiving_account}
  ...  ${promptpay_national_id.receiving_bank_code}
  status should be  200  ${response}
  success response body should return transfer information  ${response}
  validate response message, response data and transfer db data  ${response}  SUCCESS