/**
 * Name: kpl
 * Description: Kernel programming language
 * Author: Wil Cooley <wcooley@nakedape.cc>
 */



state kpl extends HighlightEntry
{
  /* Comments */
  /--/ {
    comment_face(true);
    language_print($0);
    call(eat_one_line);
    comment_face(false);
  }

  /* String constants */
  /["]/ {
    string_face(true);
    language_print($0);
    call(c_string);
    string_face(false);
  }

  /* Character constants */
  /'.'|'\\\\.'/ {
    string_face(true);
    language_print($0);
    string_face(false);
  }

  /* Method call */
  /\b(self|super|[_[:digit:][:alpha:]]+)\
([[:space:]]*)\
(\.)\
([[:space:]]*)\
([_[:digit:][:alpha:]]+)\
\b/ {

    variable_name_face(true);
    language_print($1);
    variable_name_face(false);

    language_print($2);

    reference_face(true);
    language_print($3);
    reference_face(false);

    language_print($4);

    function_name_face(true);
    language_print($5);
    function_name_face(false);

  }

  /\b\
([_[:digit:][:alpha:]]+)\
([[:space:]]*)\
(\()\
([^)])\
(\))/ {

    function_name_face(true);
    language_print($1);
    function_name_face(false);

    language_print($2);

    reference_face(true);
    language_print($3);
    reference_face(false);

    language_print($4);

    reference_face(true);
    language_print($5);
    reference_face(false);

}


  /\b(\
behavior\
|class\
|code\
|function\
|header\
|infix\
|interface\
|method\
|prefix\
)([[:space:]]+)(\
[_[:digit:][:alpha:]]+\
)/ {
    keyword_face(true);
    language_print($1);
    keyword_face(false);

    language_print($2);
    
    reference_face(true);
    language_print($3);
    reference_face(false);

  }

  /* Types */
  /\b\
(array\
|anyType\
|bool\
|char\
|double\
|enum\
|int\
|typeOfNull\
|ptr to\
|void\
|record\
|endRecord\
)\b/ {
    type_face(true);
    language_print($0);
    type_face(false);
  }


  /* Keywords */
  /\b\
(alloc\
|arraySize\
|as(Integer|PtrTo)\
|break\
|by\
|case\
|catch\
|const\
|continue\
|debug\
|default\
|do\
|else\
|elseIf\
|end(Behavior\
|Class\
|Code\
|For\
|Function\
|Header\
|If\
|Interface\
|Method\
|Switch\
|Try\
|While)\
|errors\
|extends\
|external\
|false\
|fields\
|for\
|free\
|if\
|implements\
|is(InstanceOf|KindOf)\
|messages\
|methods\
|new\
|null\
|of\
|ptr\
|renaming\
|return\
|returns\
|sizeOf\
|superclass\
|switch\
|throw\
|to\
|true\
|try\
|type\
|until\
|uses\
|var\
|while)\
\b/ {
    keyword_face(true);
    language_print($0);
    keyword_face(false);
  }

  /* Symbol operators and such */
  /(\
[!=]?=\
|\|\|?
|\&\&?\
|<[<=]?\
|>(>|>>|=)\
|[\+\-\*\%\^\/\(\)\[\]\!\:]\
)/ {
    reference_face(true);
    language_print($0);
    reference_face(false);
  }

}
