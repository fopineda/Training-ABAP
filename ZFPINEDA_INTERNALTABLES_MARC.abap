*&---------------------------------------------------------------------*
*& Report  ZFPINEDA_INTERNALTABLES_MARC
*&
*&---------------------------------------------------------------------*
*&
*&  Reads X (ENTRIES) amount of Material Numbers from the MARC table.
*&
*&  PLANT: Pay no attention to it.
*&  ENTRIES: X amount of entries you want read.
*&
*& By: Felipe Pineda <Felipe.Pineda@ibm.com> <fpineda@cs.unc.edu> <fopineda95@gmail.com>
*&---------------------------------------------------------------------*

REPORT  ZFPINEDA_INTERNALTABLES_MARC.


PARAMETERS: PLANT TYPE WERKS,   "Pay no attention to this part, this is for a later project"
            ENTRIES TYPE I OBLIGATORY.



INITIALIZATION.
* ------------- Internal table a that holds the Material Numbers from MARC table  ---------------
* Structure Internal Table a
TYPES: BEGIN OF TY_MARC,
       MATNR TYPE MATNR,
END OF TY_MARC.

* Create a table type
TYPES: TT_MARC TYPE STANDARD TABLE OF TY_MARC.

* Define the structure type
DATA: ST_MARC TYPE TY_MARC.

* Define Internal Table a
DATA: IT_MARC TYPE TT_MARC.

* Null value for PLANT
PLANT = 'NULL'.


AT SELECTION-SCREEN.
* Validation for PLANT (Nothing for now)

* Validation for ENTRIES
IF NOT ENTRIES >= 0.
    MESSAGE 'Value must be positive' TYPE 'E'.
ENDIF.



END-OF-SELECTION.
SELECT MATNR
       UP TO ENTRIES ROWS
       FROM MARC
       INTO TABLE IT_MARC.

IF sy-subrc = 0.
  loop at IT_MARC into ST_MARC.
    WRITE: ST_MARC-MATNR.
    NEW-LINE.
  ENDLOOP.
ELSE.
  WRITE 'Did not work!'.
ENDIF.

*&-----------------------------END OF SCRIPT -----------------------*