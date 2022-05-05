       identification division.
       program-id. showvars.

       data division.
       working-storage section.

       01 ctr      pic 99 usage comp-5.

       linkage section.

       01 the-values.

          05 query-values           occurs 10 times.
            10 query-value-name     pic x(90).
            10 query-value          pic x(90).


       procedure division using the-values.

           display "<table cellpadding=10 border=1 cellspacing=4 bgcolor=lightgray>"
           
            move "hello world" to the-values 
           display query-values(1)

           perform varying ctr from 1 by 1
             until ctr > 10

               display "<tr><td>" query-value-name(ctr) "</td><td>" query-value(ctr) "</td></tr>"

           end-perform


           display "</table>"
      
       goback.

       end program showvars.
