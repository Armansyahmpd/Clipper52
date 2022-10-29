*************************************
* Sub program melihat isi file
* Clipper 5.2
* Programmer Name : Armansyah
* PC-TEST : IBM AT Ps/ValuePoint 486 SX
*************************************

Proc Struk
Private isi, buka, semu, kapasitas, periksa, war_vir, lay_vir
War_Vir= SETCOLOR()
SAVE SCREEN TO LAY_VIR

/* Membuka file Command.Com */
BUKA= FOPEN("C:\COMMAND.COM")
/* File Command.Com ini hanya kepunyaan Arman MS-DOS 6.22 dgn kapasitas
sebesar 54,645 Bytes */

/* Membaca pada baris ke-512 */
ISI= FREADSTR(BUKA, 512)
/* Tanya Ascii-nya berapa */
PERIKSA= ASC(RIGHT(ISI, 1))

KAPASITAS= FSEEK(BUKA, 0, 2)
/* 54645 adalah besar kapasitas file COMMAND.COM */
SEMU= TRANSFORM(KAPASITAS - 54645, "999,999 Byte")
FCLOSE(BUKA)
/* Kode Ascii-nya adl. 21 dibandingkan juga dgn kapasitas */
IF PERIKSA <> 21 .OR. KAPASITAS <> 54645
POPERROR("COMMAND.COM Berubah, " + ;
"File ini mungkin telah terjangkit Virus !!! " + ;
"Kapasitas Semu : " + SEMU)
ENDIF
SETCOLOR(WAR_VIR)
RESTORE SCREEN FROM LAY_VIR
RETURN
