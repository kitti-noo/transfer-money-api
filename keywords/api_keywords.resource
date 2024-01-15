*** Settings ***
Resource  ../import.resource

*** Keywords ***
send post request to transfer money
  [Arguments]  ${amount}  ${send_account}  ${receive_account}  ${receive_bank_code}
  ${amount}  Evaluate  "%.2f" % ${amount}
  ${headers}  create dictionary
  ...  Content-Type=application/json
  ${request_body}  create dictionary
  ...  amount=${amount}
  ...  sendingAccount=${send_account}
  ...  receivingAccount=${receive_account}
  ...  receivingBankCode=${receive_bank_code}
  ${response}  post  ${transfer_money_endpoint}  headers=${headers}  json=${request_body}
  [Return]  ${response}

success response body should return transfer information
  [Arguments]  ${res}
  ${actual_res}  set variable  ${res.json()}
  should not be empty  ${actual_res}[data]
  should not be equal  ${actual_res}[data][amount]  ${None}
  should not be empty  ${actual_res}[data][sendingAccountNo]
  should not be empty  ${actual_res}[data][receivingAccountNo]
  should not be empty  ${actual_res}[data][receivingBankCode]
  should not be empty  ${actual_res}[data][transactionDateTime]
  should not be empty  ${actual_res}[data][transferReferenceID]

validate response message, response data and transfer db data
  [Arguments]  ${res}  ${resp_message}
  ${actual_res}  set variable  ${res.json()}
  ${query_output}  select transfer information from transfer history db with transfer_ref_id  ${actual_res}[data][transferReferenceID]
  should be equal  ${actual_res}[data][sendingAccountNo]  ${query_output}[0][1]
  should be equal  ${actual_res}[data][receivingAccountNo]  ${query_output}[0][2]
  should be equal as numbers  ${actual_res}[data][amount]  ${query_output}[0][3]
  should be equal  ${resp_message}  ${query_output}[0][4]
