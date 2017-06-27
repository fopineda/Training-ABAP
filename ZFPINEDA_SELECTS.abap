*&---------------------------------------------------------------------*
*& Report  ZFPINEDA_SELECTS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  ZFPINEDA_SELECTS.



PARAMETERS: option TYPE C OBLIGATORY.

TYPES: BEGIN OF ty_bkpf,
  bukrs LIKE bkpf-bukrs,
  belnr LIKE bkpf-belnr,
  gjahr LIKE bkpf-gjahr,
END OF ty_bkpf.

* Internal table and its Work Area
DATA: it_bkpf TYPE STANDARD TABLE OF ty_bkpf,
       wa_bkpf TYPE ty_bkpf.



TYPES: BEGIN OF ty_bseg,
  bukrs     LIKE bseg-bukrs,
  belnr     LIKE bseg-belnr,
  gjahr     LIKE bseg-gjahr,
  buzei     LIKE bseg-buzei,
END OF ty_BSEG.

* Internal table and its Work Area
DATA: it_bseg TYPE STANDARD TABLE OF ty_bseg,
      wa_bseg TYPE ty_bseg.


* Creating internal table from a database table
DATA: it_ekko TYPE STANDARD TABLE OF ekko,
      wa_ekko TYPE ekko.
*--------------------------------------------------------------------------------------
* Select all fields of a SAP database table into in itab
SELECT *
  FROM ekko
  INTO TABLE it_ekko.

* Select directly into an internal table
SELECT bukrs belnr gjahr
    FROM bseg
    INTO TABLE it_bseg.
CLEAR it_bseg.

* Select for if fields are in different order or not all fields are specified
SELECT bukrs belnr gjahr
    FROM bseg
    INTO CORRESPONDING FIELDS OF TABLE it_bseg.
CLEAR it_bseg.

* Select ---> Endselect
SELECT bukrs belnr gjahr
    FROM bseg
    INTO wa_bseg.

    APPEND wa_bseg TO it_bseg.
ENDSELECT.
CLEAR it_bseg.



* FOR ALL ENTRIES
** Fills the initial internal table with entries for later
SELECT bukrs belnr gjahr
      UP TO 50 ROWS
      FROM bkpf
      INTO TABLE it_bkpf.

** Now to use the FOR ALL ENTRIES to retrieve the data which matches entries within a particular internal table
** Bascially so you can compare entries from two internal tables
SELECT bukrs belnr gjahr
    FROM bseg
    INTO TABLE it_bseg
    FOR ALL ENTRIES IN it_bkpf
    WHERE bukrs = it_bkpf-bukrs AND
          belnr = it_bkpf-belnr AND
          gjahr = it_bkpf-gjahr.
CLEAR it_bkpf.
CLEAR it_bseg.



* Select up to 1 row (if available)
SELECT *
    UP TO 1 ROWS
    FROM bseg
    INTO CORRESPONDING FIELDS OF TABLE it_bseg
    WHERE bukrs = wa_bseg-bukrs AND
          belnr = wa_bseg-belnr.

*&------------------END OF SCRIPT---------------------------------------*