*&---------------------------------------------------------------------*
*& Report  ZSCREENS001
*&
*&---------------------------------------------------------------------*
*& EVEN: Prints out the first X amount of even integers.
*& ODD: Prints out the first X amount of odd integers.
*& TEN: Prints out the first X amount of intergers starting at zero, incrementing by one.
*&
*& By: Felipe Pineda <Felipe.Pineda@ibm.com> <fpineda@cs.unc.edu> <fopineda95@gmail.com>
*&---------------------------------------------------------------------*

REPORT  ZSCREENS001.

PARAMETERS: EVEN TYPE I OBLIGATORY,
            ODD TYPE I OBLIGATORY,
            TEN TYPE I OBLIGATORY.

INITIALIZATION.
DATA even_num TYPE I VALUE 2.
DATA odd_num TYPE I VALUE 1.
DATA number TYPE I VALUE 0.


AT SELECTION-SCREEN.
IF NOT EVEN >= 0.
    MESSAGE 'Value must be positive' TYPE 'E'.
ENDIF.
IF NOT ODD >= 0.
    MESSAGE 'Value must be positive' TYPE 'E'.
ENDIF.
IF NOT TEN >= 0.
    MESSAGE 'Value must be positive' TYPE 'E'.
ENDIF.

END-OF-SELECTION.
write: 'You chose: ', EVEN, ODD, TEN.
NEW-LINE.
* First X even
write: 'First', EVEN, 'even numbers!'.
NEW-LINE.
Do EVEN times.
    write: 'even number', even_num.
    NEW-LINE.
    even_num = even_num + 2.
ENDDO.

* First X odd
write: 'First', ODD, 'odd numbers!'.
NEW-LINE.
Do ODD times.
    write: 'odd number', odd_num.
    NEW-LINE.
    odd_num = odd_num  + 2.
ENDDO.


* First X integers starting at zero
write: 'First', TEN, 'numbers starting at zero!'.
NEW-LINE.
Do TEN times.
    write: 'number', number.
    NEW-LINE.
    number = number + 1.
ENDDO.

*&---------------------------END OF SCRIPT---------------------------------*