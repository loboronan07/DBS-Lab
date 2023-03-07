set serveroutput on;

declare 
    doi date;
    dor date;
    daysbtw number;
    fine number;

begin   
    doi := &dateofissue;
    dor := &dateofreturn;
    daysbtw := dor-doi;

    fine := 0;
    if daysbtw > 30 then 
        fine := fine + (daysbtw-30) * 5;
        daysbtw := 30;
    end if;
    
    if daysbtw > 15 then
        fine := fine + (daysbtw-15) * 2;
        daysbtw := 15;
    end if;
    
    if daysbtw > 7 then 
        fine := fine + (daysbtw-7) * 1;
    end if;
    
    dbms_output.put_line('Fine: ' || to_char(fine));

end;
/