*&---------------------------------------------------------------------*
*& Report  ZDECISIONS1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZDECISIONS1.

DATA string1 TYPE STRING VALUE 'Hello'.
DATA string2 TYPE STRING VALUE 'Hello World'.
DATA string3 TYPE STRING VALUE 'llo'.
DATA string4 TYPE STRING VALUE 'Word'.
DATA num1 TYPE I VALUE 8.
num1 = num1 + num1.


* If Statement
write '------------ If Statement ------------'.
NEW-LINE.
IF string1 CO string2.
    write 'entered if'.
ENDIF.

NEW-LINE.

* If-Else Statement
write '----------- if-else Statement -----------'.
NEW-LINE.
IF num1 IS INITIAL.
    write 'entered if'.
ELSE.
    write 'entered else'.
ENDIF.


*&-------------------------END OF SCRIPT ------------------------------*