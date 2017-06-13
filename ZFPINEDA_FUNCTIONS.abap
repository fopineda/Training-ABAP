*&---------------------------------------------------------------------*
*& Report  ZFPINEDA_FUNCTIONS
*&
*&---------------------------------------------------------------------*
*& Program will take in an integer value and convert into it's text value by using the SPELL_AMOUNT function.
*& 
*&
*& NUMBER: Integer value to be converted into text.
*&
*& By: Felipe Pineda <Felipe.Pineda@ibm.com> <fpineda@cs.unc.edu> <fopineda95@gmail.com>
*&---------------------------------------------------------------------*

REPORT  ZFPINEDA_FUNCTIONS.

PARAMETER: NUMBER TYPE I OBLIGATORY.

INITIALIZATION.
DATA text LIKE SPELL.

AT SELECTION-SCREEN.
* Validation for integer value.
IF NOT number >= 0.
    MESSAGE 'Value must be positive' TYPE 'E'.
ENDIF.

END-OF-SELECTION.
* Calling the function
* EXPORTING: assigns this program's data to the functions parameters and then exports them out for the function to run.
* IMPORTING: once the functions has ran, the program will import the returned value and assign it to a predefined variable.
* Right side do not change those are the parameters.
* Left side do change since those will be your values.
* Missing EXCEPTIONS and TABLES at the moment.
CALL FUNCTION 'SPELL_AMOUNT'
      EXPORTING
          AMOUNT = number
      IMPORTING
          IN_WORDS = text.


IF SY-SUBRC = 0.
    WRITE:  number, '->',text-word.
ELSE.
    MESSAGE 'Could not convert' TYPE 'E'.
ENDIF.


*&-----------------------------END OF SCRIPT -----------------------*