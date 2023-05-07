       identification division.
       program-id. cow.

       environment division.

       data division.

       working-storage section.


       01 newline         pic x   value x'0a'.

       01 analyzed-query pic x(1600).  

       01 the-great-dispatch.

          03  routing-table            occurs 10 times.

            05   routing-pattern   pic x(999).
            05   routing-destiny   pic x(999).

                                                                               
       01 tester         pic x(1) value "n".  
       01 anyfound       pic x(1) value "n".
       01 ctr            pic 99 usage comp-5.

       01 the-values.

          05 query-values           occurs 10 times.
            10 query-value-name     pic x(90).
            10 query-value          pic x(90).

       procedure division.

       copy "config.cbl".

       perform web-header.

       call 'getquery' using analyzed-query.

       perform varying ctr from 1 by 1
             until ctr > 5

           call 'checkquery' using analyzed-query routing-pattern(ctr) tester the-values

           if (tester="y")

              *> display routing-pattern(ctr) "<hr>" 
              move "y" to anyfound
              call routing-destiny(ctr) using the-values

           end-if

       end-perform


       if (anyfound="n") perform bad-query-error.

       *> if (anyfound="y")  call 'showvars' using the-values.  

       goback.

 bad-query-error.

 display "<b>Cobol-on-Wheelchair error:</b> query pattern not found (<i>" function trim(analyzed-query) "</i>)".


 web-header.

       display
           "content-type: text/html; charset=utf-8"
           newline
       end-display.
      
end program cow