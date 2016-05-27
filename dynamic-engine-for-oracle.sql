CREATE OR REPLACE PROCEDURE WXHP_do_sql_Block(sql_text     VARCHAR2, --paramed raw sql
                                              ip_bind_vars VARCHAR2, --json-formatted params
                                              out_msg  out VARCHAR2)
---执行DML,DDL
 IS
  source_cursor  INTEGER;
  rows_processed INTEGER;
  bind_vars      json;
BEGIN
 /* out_msg:='成功!';
  return;*/
  source_cursor := dbms_sql.open_cursor;
  --    sql_text:='truncate table ns_resource_state';
  dbms_sql.parse(source_cursor, replace(sql_text,chr(13)), dbms_sql.v7);
  bind_vars := json(replace(replace(replace(ip_bind_vars,chr(13)),chr(10),' '),chr(9),''));
  IF (bind_vars IS NOT NULL AND bind_vars.count > 0) THEN
    DECLARE
      keys json_list;
      vals json_list;
    BEGIN
      keys := bind_vars.get_keys();
      vals := bind_vars.get_values();
      FOR i IN 1 .. bind_vars.count
      LOOP
        begin
          dbms_sql.bind_variable(source_cursor,
          ':' || trim(both '"' from keys.get(i).to_char()) || '',
          case when vals.get(i).to_char()='null' then null else trim(both '"' from vals.get(i).to_char()) end);
        exception when others then
          null;
        end;
      END LOOP;
    END;
  END IF;


  -----run it!
  DECLARE
    vret        INT := 0;
    catchstring VARCHAR2(4000);
  BEGIN
    dbms_output.enable;
    --DBMS_OUTPUT.PUT(' ');
    rows_processed := dbms_sql.execute(source_cursor);
    commit;
    WHILE vret = 0
    LOOP
      dbms_output.get_line(catchstring, vret);
      IF vret = 0 THEN
        ---捕获成功
        IF out_msg IS NULL THEN
          ---第一次捕获
          out_msg := catchstring;
        ELSE
          out_msg := out_msg || chr(10) || catchstring;
        END IF;
      END IF;
    END LOOP;
    dbms_output.disable;
  END;
  ------------end of run! DBMS_OUTPUT.PUT_LINE();
  dbms_sql.close_cursor(source_cursor);
  if(trim(out_msg) is null )then
   out_msg:='影响行数:'||rows_processed;
  end if;
EXCEPTION
  WHEN OTHERS THEN
    rollback;
    dbms_sql.close_cursor(source_cursor);
    out_msg := SQLERRM||',text='||sql_text||',param='||ip_bind_vars;
END;
