PRIVATE LAYAR,WARNA
STORE 0 TO NEED,NEED1,NEED2,NEED3,NEED4
SAVE SCREEN TO LAYAR
WARNA=SETCOLOR()

IF !FILE('MHSISWA.DBF')
POPERROR('DATABASE BELUM ADA. TIDAK ADA YANG PERLU DI-BACKUP')
RETURN
ENDIF

IF !FILE('DAFNILA.DBF')
POPERROR('DATABASE BELUM ADA. TIDAK ADA YANG PERLU DI-BACKUP')
RETURN
ENDIF

IF !FILE('ABSEN.DBF')
POPERROR('DATABASE BELUM ADA. TIDAK ADA YANG PERLU DI-BACKUP')
RETURN
ENDIF

IF !FILE('TPUMIBA.DBF')
POPERROR('DATABASE BELUM ADA. TIDAK ADA YANG PERLU DI-BACKUP')
RETURN
ENDIF

USE MHSISWA
NEED1=INT((RECSIZE()*LASTREC())+HEADER()+1)

USE DAFNILA
NEED2=INT((RECSIZE()*LASTREC())+HEADER()+1)

USE ABSEN
NEED3=INT((RECSIZE()*LASTREC())+HEADER()+1)

USE TPUMIBA
NEED4=INT((RECSIZE()*LASTREC())+HEADER()+1)

CLOSE ALL
NEED=NEED1+NEED2+NEED3+NEED4
IF DISKSPACE()
POPERROR('Sisa Media Penyimpan Tidak Cukup Untuk Membackup !')
SETCOLOR(WARNA)
REST SCRE FROM LAYAR
RETURN
ENDIF

PRIVATE BACK1,BACK2,BACK3,BACK4,BACK5,BACK6,BACK7,BACK8
PRIVATE PESAN,PESAN1,PESAN2,PESAN3,PILIH,TOMBOL,NILAIKU

BACK1='BACKSIS.CAD'
BACK2='BACKNIL.CAD'
BACK3='BACKABS.CAD'
BACK4='BACKTPU.CAD'

BACK5='BNTXSIS.CAD'
BACK6='BNTXNIL.CAD'
BACK7='BNTXABS.CAD'
BACK8='BNTXTPU.CAD'

atas = 01
bawah = 07
kiri = 15
kanan = 64

pesan1 = "Akan Membackup semua DataBase ? "
pesan3 = "Sembarang tombol : Terus, Escape : Batal"
pesan2 = REPLICATE(CHR(196),LEN(pesan3))

Box3D(atas, kiri, bawah, kanan)
Shadow(atas, kiri, bawah, kanan)

DO WHILE .T.
@ atas + 2, 40 - LEN(pesan1)/2 SAY pesan1
@ atas + 3, 40 - LEN(pesan2)/2 SAY pesan2
@ atas + 4, 40 - LEN(pesan3)/2 SAY pesan3

Tombol = INKEY(0)
IF Tombol = 27
Nilaiku = .F.
EXIT
ENDIF

BOX3D(09,05,15,74)
Shadow(09,05,15,74)

IF FILE('MHSISWA.DBF')
PESAN='Sedang Membuat Backup MHSISWA.DBF....'
@12,45-LEN(PESAN)/2 SAY PESAN
COPY FILE MHSISWA.DBF TO &BACK1
COPY FILE MHSISWA.NTX TO &BACK5
ENDIF

IF FILE('DAFNILA.DBF')
PESAN='Sedang Membuat Backup DAFNILA.DBF....'
@12,45-LEN(PESAN)/2 SAY PESAN
COPY FILE DAFNILA.DBF TO &BACK2
COPY FILE DAFNILA.NTX TO &BACK6
ENDIF

IF FILE('ABSEN.DBF')
PESAN='Sedang Membuat Backup ABSEN.DBF......'
@12,45-LEN(PESAN)/2 SAY PESAN
COPY FILE ABSEN.DBF TO &BACK3
COPY FILE ABSEN.NTX TO &BACK7
ENDIF

IF FILE('TPUMIBA.DBF')
PESAN='Sedang Membuat Backup TPUMIBA.DBF....'
@12,45-LEN(PESAN)/2 SAY PESAN
COPY FILE TPUMIBA.DBF TO &BACK4
COPY FILE TPUMIBA.NTX TO &BACK8
ENDIF

PESAN='Proses Mem-Backup DataBase selesai......'
@12,45-LEN(PESAN)/2 SAY PESAN
Exit
Close Data
ENDDO
SETCOLOR(WARNA)
REST SCRE FROM LAYAR
RETURN