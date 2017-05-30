*&---------------------------------------------------------------------*
*& Report  ZLOOPS1
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZLOOPS1.

* While Loop
DATA num_var TYPE I VALUE 0.
WHILE num_var < 10.
    write: 'Printing while cycle:', num_var.
    NEW-LINE.
    num_var = num_var + 1.

ENDWHILE.

 NEW-LINE.
 NEW-LINE.
 NEW-LINE.

* Do Loop
DATA num_var2 TYPE I value 8.
DATA num_var3 TYPE I value 0.
Do num_var2 times.
    write: 'Printing do cycle: ', num_var3.
    NEW-LINE.
    num_var3 = num_var3 + 1.
ENDDO.



*&------------------------END OF SCRIPT --------------------------------*