*&---------------------------------------------------------------------*
*& Report  ZFPINEDA_SUBROUTINES
*&
*&---------------------------------------------------------------------*
*&
*&  Program that shows the use of a subroutine.
*&
*&
*&  By: Felipe Pineda <Felipe.Pineda@ibm.com> <fpineda@cs.unc.edu> <fopineda95@gmail.com>
*&
*&---------------------------------------------------------------------*

REPORT  ZFPINEDA_SUBROUTINES.

* Calls subroutine
PERFORM SubDisplay.

*&---------------------------------------------------------------------*
*&      Form  SubDisplay
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM SubDisplay.
    WRITE: 'My first subroutine.'.
    NEW-LINE.
    WRITE: 'This subroutine will run everytime I call SubDisplay.'.
ENDFORM.                    " SubDisplay


*&--------------------------- END OF SCRIPT ------------------------------------------*