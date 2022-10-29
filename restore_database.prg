PRIVATE LAYAR,WARNA
SAVE SCREEN TO LAYAR
WARNA=SETCOLOR()

IF !FILE('BACKSIS.CAD')
POPERROR('Backup DataBase Mahasiswa Belum ada. Tidak ada yang perlu di Restore !')
RETURN
ENDIF

IF !FILE('BACKNIL.CAD')
POPERROR('Backup DataBase Nilai Mahasiswa Belum Ada. Tidak ada yang perlu direstore !')
RETURN
ENDIF

IF !FILE('BACKABS.CAD')
POPERROR('Backup DataBase Absen Mahasiswa Belum Ada. Tidak ada yang perlu direstore !')
RETURN
ENDIF

IF !FILE('BACKTPU.CAD')
POPERROR('Backup DataBase Tanda Peserta Belum Ada. Tidak ada yang perlu direstore !')
RETURN
ENDIF

PRIVATE REST1,REST2,REST3,REST4, REST5,REST6,REST7,REST8
PRIVATE PESAN,PESAN1,PESAN2,PESAN3,PILIH,TOMBOL,NILAIKU

REST1='MHSISWA.DBF'
REST2='DAFNILA.DBF'
REST3='ABSEN.DBF'
REST4='TPUMIBA.DBF'

REST5='MHSISWA.NTX'
REST6='DAFNILA.NTX'
REST7='ABSEN.NTX'
REST8='TPUMIBA.NTX'

atas = 01
bawah = 07
kiri = 15
kanan = 64

pesan1 = "Akan Merestore semua DataBase ? "
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

IF FILE('BACKSIS.CAD')
PESAN='SEDANG ME-RESTORE MHSISWA.DBF.....'
@12,45-LEN(PESAN)/2 SAY PESAN
COPY FILE BACKSIS.CAD TO &REST1
COPY FILE BNTXSIS.CAD TO &REST5
ENDIF

IF FILE('BACKNIL.CAD')
PESAN='SEDANG ME-RESTORE DAFNILAI.DBF....'
@12,45-LEN(PESAN)/2 SAY PESAN
COPY FILE BACKNIL.CAD TO &REST2
COPY FILE BNTXNIL.CAD TO &REST6
ENDIF

IF FILE('BACKABS.CAD')
PESAN='SEDANG ME-RESTORE ABSEN.DBF.......'
@12,45-LEN(PESAN)/2 SAY PESAN
COPY FILE BACKABS.CAD TO &REST3
COPY FILE BNTXABS.CAD TO &REST7
ENDIF

IF FILE('BACKTPU.CAD')
PESAN='Sedang ME-RESTORE TPUMIBA.DBF.....'
@12,45-LEN(PESAN)/2 SAY PESAN
COPY FILE BACKTPU.CAD TO &REST4
COPY FILE BNTXTPU.CAD TO &REST8
ENDIF

PESAN='Proses Restore File DataBase Selesai.'
@12,45-LEN(PESAN)/2 SAY PESAN

Exit
Enddo
SETCOLOR(WARNA)
REST SCRE FROM LAYAR
RETURN