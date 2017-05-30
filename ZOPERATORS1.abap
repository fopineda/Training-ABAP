*&---------------------------------------------------------------------*
*& Report  ZOPERATORS1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZOPERATORS1.


DATA num1 TYPE I VALUE 20.
DATA num2 TYPE I VALUE 21.
IF num1 < num2.
  WRITE: 'num1 is less than num2'.
  ENDIF.

NEW-LINE.
WRITE 'Control write statement: it hit the end of the script'.

*&--------------------------END OF SCRIPT -----------------------------*