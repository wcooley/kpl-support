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

  /* Upper-case Constants */
  /\b([[:upper:]][[:digit:][:upper:]_]*)\b/ {
    reference_face(true);
    language_print($0);
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
)\
([[:space:]]+)\
([[:alnum:]]+)\
\b/ {
    keyword_face(true);
    language_print($1);
    keyword_face(false);

    language_print($2);

    function_name_face(true);
    language_print($3);
    function_name_face(false);
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

  /* Built-in operator sorts of things */
  /\b(alloc\
|arraySize\
|asInteger\
|PtrTo\
|false\
|isInstanceOf\
|isKindOf\
|new\
|null\
|self\
|sizeOf\
|super\
|true\
)\b/ {
    builtin_face(true);
    language_print($0);
    builtin_face(false);
  }

  /* Keywords */
  /\b\
(\
break\
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
|fields\
|for\
|free\
|if\
|implements\
|messages\
|methods\
|of\
|ptr\
|renaming\
|return\
|returns\
|superclass\
|switch\
|throw\
|to\
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

}
