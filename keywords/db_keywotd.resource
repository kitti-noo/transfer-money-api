*** Settings ***
Resource  ../import.resource

*** Keywords ***
connect transfer history db
  connect to database
  ...  ${transfer_history_db.module_name}
  ...  ${transfer_history_db.db_name}
  ...  ${transfer_history_db.user}
  ...  ${transfer_history_db.password}
  ...  ${transfer_history_db.host}
  ...  ${transfer_history_db.port}

select transfer information from transfer history db with transfer_ref_id
  [Arguments]  ${transfer_ref_id}
  ${output}  query  SELECT * FROM transfer_history WHERE transfer_ref_id ='${transfer_ref_id}'
  [Return]  ${output}

