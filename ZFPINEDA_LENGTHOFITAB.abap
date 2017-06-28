*&---------------------------------------------------------------------*
*& Report  ZFPINEDA_LENGTHOFITAB
*&
*&---------------------------------------------------------------------*
*&
*&  Shows how to find the length of an internal table in terms of rows (great for looping).
*&
*&
*&
*&
*& By: Felipe Pineda <Felipe.Pineda@ibm.com> <fpineda@cs.unc.edu> <fopineda95@gmail.com>
*&---------------------------------------------------------------------*

REPORT  ZFPINEDA_LENGTHOFITAB.


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


SELECT bukrs belnr gjahr
    INTO TABLE it_bkpf
    UP TO 20 ROWS
    FROM bkpf.


WRITE: 'it_bkpf'. NEW-LINE.
LOOP AT it_bkpf INTO wa_bkpf.
  NEW-LINE.
  WRITE:  wa_bkpf-bukrs,
          wa_bkpf-belnr,
          wa_bkpf-gjahr.
ENDLOOP.

******************************
* length of an internal table (rows).
NEW-LINE.
DESCRIBE TABLE it_bkpf LINES SY-TFILL.
WRITE: 'Count:', SY-TFILL.
******************************
DO SY-TFILL TIMES.
  NEW-LINE.
  WRITE: SY-INDEX.
ENDDO.