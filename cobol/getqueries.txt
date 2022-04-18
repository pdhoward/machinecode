identification division.
       program-id. getquery.

       environment division.

              input-output section.
       file-control.
           select webinput assign to keyboard.


       data division.
       file section.
       fd webinput.
          01 postchunk       pic x(1024).

       working-storage section.

       78 name-count      value 34.
       01 name-index      pic 99 usage comp-5.
       01 value-string    pic x(256).
       01 environment-names.
          02 name-strings.
             03 filler    pic x(20) value 'AUTH_TYPE'.
             03 filler    pic x(20) value 'CONTENT_LENGTH'.
             03 filler    pic x(20) value 'CONTENT_TYPE'.
             03 filler    pic x(20) value 'DOCUMENT_ROOT'.
             03 filler    pic x(20) value 'GATEWAY_INTERFACE'.
             03 filler    pic x(20) value 'HTTP_ACCEPT'.
             03 filler    pic x(20) value 'HTTP_ACCEPT_CHARSET'.
             03 filler    pic x(20) value 'HTTP_ACCEPT_ENCODING'.
             03 filler    pic x(20) value 'HTTP_ACCEPT_LANGUAGE'.
             03 filler    pic x(20) value 'HTTP_COOKIE'.
             03 filler    pic x(20) value 'HTTP_CONNECTION'.
             03 filler    pic x(20) value 'HTTP_HOST'.
             03 filler    pic x(20) value 'HTTP_REFERER'.
             03 filler    pic x(20) value 'HTTP_USER_AGENT'.
             03 filler    pic x(20) value 'LIB_PATH'.
             03 filler    pic x(20) value 'PATH'.
             03 filler    pic x(20) value 'PATH_INFO'.
             03 filler    pic x(20) value 'PATH_TRANSLATED'.
             03 filler    pic x(20) value 'QUERY_STRING'.
             03 filler    pic x(20) value 'REMOTE_ADDR'.
             03 filler    pic x(20) value 'REMOTE_HOST'.
             03 filler    pic x(20) value 'REMOTE_IDENT'.
             03 filler    pic x(20) value 'REMOTE_PORT'.
             03 filler    pic x(20) value 'REQUEST_METHOD'.
             03 filler    pic x(20) value 'REQUEST_URI'.
             03 filler    pic x(20) value 'SCRIPT_FILENAME'.
             03 filler    pic x(20) value 'SCRIPT_NAME'.
             03 filler    pic x(20) value 'SERVER_ADDR'.
             03 filler    pic x(20) value 'SERVER_ADMIN'.
             03 filler    pic x(20) value 'SERVER_NAME'.
             03 filler    pic x(20) value 'SERVER_PORT'.
             03 filler    pic x(20) value 'SERVER_PROTOCOL'.
             03 filler    pic x(20) value 'SERVER_SIGNATURE'.
             03 filler    pic x(20) value 'SERVER_SOFTWARE'.
          02 filler redefines name-strings.
             03 name-string   pic x(20) occurs name-count times.

       linkage section.

       01 the-query pic x(1600).  

       procedure division using the-query.


         perform varying name-index from 1 by 1
             until name-index > name-count
                 accept value-string from environment
                     name-string(name-index)
                 end-accept

                 if (name-string(name-index) = "PATH_INFO")
                    
                    move value-string to the-query

                 end-if   

         end-perform.

      
       goback.

       end program getquery.