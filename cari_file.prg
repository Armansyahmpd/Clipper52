*------------------------------
* Created By : "Armansyah"
* 1996
*------------------------------
Parameters AAA, BBB, CCC
Local x, No, Chr13, Jawab, Laporan, Ada1, Ada2, Pjg1, Pjg2, Cari1, Nama1
Private Kata1, Kata2, Pesan1, Pesan2
Private xxx, Cari2, Nama2, Nama3:= {}
SetCursor(0)
AAA:= If(AAA= Nil, AAA, Upper(AAA))
If AAA= "?" .Or. AAA= "-?" .Or. AAA= "/?" .Or. ;
AAA= "H" .Or. AAA= "-H" .Or. AAA= "/H"
? "Aturan pakai : "
? " CariTeks <Ù"
? "Perintah : "
? " * Laporan : "
? " -L = Lihat"
? " -C = Cetak"
? " * Bentuk Huruf :"
? " -A = Acuhkan"
? " -S = Sama persis"
? "Contoh : "
? " CariTeks /L <Ù"
? " CariTeks /S Catatan a:\ws\*.bak <Ù"
? "Selamat mencoba. . ."
?
Quit
EndIf
No := PCount()
Chr13:= If(No <>
Jawab:= If(No > 0, AAA, "A")
Jawab:= StrTran(Jawab, "-", "")
Jawab:= StrTran(Jawab, "/", "")
Jawab:= Upper(Left(Jawab, 1))
Jawab:= If(Jawab $ "ASLC", Jawab, "A")
Cari1:= If(No > 1, BBB, Space(255))
Nama1:= If(No > 2, CCC, Space(255))
No := Len(Cari1)
Cari1:= If(No= 255, Cari1, Cari1 + Space(255 - No))
No := Len(Nama1)
Nama1:= Bintang(Nama1, "*")
Nama1:= If(No= 255, Nama1, Nama1 + Space(255 - No))
xxx := GetEnv("Temp")
xxx := If(Right(No, 1)= "\", xxx, xxx + "\")
xxx += "CariTeks.$$$"
Release AAA, BBB, CCC
Do While .T.
If Jawab= "L" .And. File(xxx)
MemoEdit(MemoRead(xxx), 0, 0, 24, 80, .F.)
Clear
Quit
ElseIf Jawab= "C" .And. File(xxx)
? "Siapkan kertas printer ? (Esc= Batal !)"
Do While ! (IsPrinter() .Or. InKey()= 27)
EndDo
If LastKey() != 27
Set Console Off
Set Device To Print
@ 1, 1 Say Chr(27) + Chr(69) && Tebal
Type &xxx To Printer
Eject
Set Device To Screen
Set Console On
EndIf
Clear
Quit
EndIf
Clear
If Chr13 > -1
Jawab= "A"
SetColor("W/N, GR+/BG+,,, W/N")
@ 2, 15 Say '-------------' + Repl("-", 20)
@ Row() + 1, 15 Say 'Mencari kata dlm "File Teks"'
@ Row() + 1, 15 Say '-------------' + Repl("-", 20)
@ Row() + 1, 15 Say "Cari kata : " Get Cari1 Pict "@S20"
@ Row() + 1, 15 Say "Nama file : " Get Nama1 Pict "@S20" ;
Valid {|oGet| Bintang(oGet)}
@ Row() + 1, 15 Say '-------------' + Repl("-", 20)
@ Row() + 1, 15 Say "Ketiklah angka jika : "
@ Row() + 1, 15 Say ' +0 = "*.PRG" +1 = "*."'
@ Row() + 1, 15 Say ' +2 = "*.*" +3 = "*.TXT"'
@ Row() + 1, 15 Say ' +4 = "*.BAT" +5 = "*.LNK"'
@ Row() + 1, 15 Say ' +6 = "*.CH" +7 = "*.H"'
@ Row() + 1, 15 Say ' +8 = "*.C" +9 = "*.PAS"'
@ Row() + 1, 15 Say ' /0 = "*.BAS" /1 = "*.ME"'
@ Row() + 1, 15 Say ' /2 = "*.HLP" /3 = "*.INI"'
@ Row() + 1, 15 Say ' /4 = "*.DAT" /5 = "*.$$$"'
@ Row() + 1, 15 Say ' /6 = "*.CPP" /7 = "*.ASM"'
@ Row() + 1, 15 Say ' /8 = "*.WK*" /9 = "*.WQ*"'
@ Row() + 1, 15 Say '-------------' + Repl("-", 20)
@ Row() + 1, 15 Say "-Pilihlah : " Get Jawab Pict "!" ;
Valid Jawab $ "AS"
@ Row() + 1, 15 Say "[A~cuhkan, S~ama persis]"
@ Row() + 1, 15 Say '-------------' + Repl("-", 20)
@ Row() + 1, 15 Say 'Created By : "Arman" - 1996.'
@ Row() + 1, 15 Say '-------------' + Repl("-", 20)
SetCursor(1)
Read
SetCursor(0)
If Empty(Cari1) .Or. Empty(Nama1) .Or. LastKey()= 27
Clear
Quit
EndIf
EndIf
Cari2:= AllTrim(Cari1)
Nama2:= AllTrim(Nama1)
Kata1:= Directory(Nama2, "D")
AEval(Kata1, {|Kata2| AAdd(Nama3, Kata2[1])})
Clear
Pjg1 := Len(Nama3)
Laporan:= "Kata yg dicari : " + Cari2 + Chr(13) + Chr(10)
Laporan+= "File yg dicari : " + Nama2 + Chr(13) + Chr(10)
Laporan+= "-----------------------------" + Chr(13) + Chr(10)
Store 1 To Chr13
Ada1 := Rat("\", Nama2)
Nama2:= Left(Nama2, Ada1)

If Pjg1 > 1 .And. ! (Jawab= "L" .Or. Jawab= "C")
@24, 02 Say Repl(Chr(176), 75)
For x:= 1 To Pjg1
Store 1 To Chr13
@24, 02 Say Repl(Chr(219), Int((x / Pjg1) * 75))
@23, 72 Say Int((x / Pjg1) * 100) Pict "999 %"
Pjg2 := Len(Nama3[x])
Teks := MemoRead(Nama2 + Nama3[x])
If Jawab= "A"
Teks := Upper(Teks)
Cari2:= Upper(Cari2)
EndIf
Ada1 := At(Cari2, Teks)
Pesan1 := TransForm(x, "9,999). ")
Pesan1 += Nama3[x] + Space(12 - Pjg2)
Laporan+= Pesan1
Laporan+= " -> "
Store "" To Pesan1
If Ada1 <>
Laporan+= "x"
Laporan+= Chr(13) + Chr(10)
Loop
EndIf
Do While Ada1 > 0
Pesan2:= Left(Teks, Ada1)
Ada2 := At(Chr(13), Pesan2)
Do While Ada2 > 0
Chr13++
Pesan2:= SubStr(Pesan2, Ada2 + 2)
Ada2 := At(Chr(13), Pesan2)
EndDo
Pesan1 += LTrim(Str(Chr13)) + ", "
Teks := SubStr(Teks, Ada1 + Len(Cari2))
Ada1 := At(Cari2, Teks)
EndDo
Laporan+= Pesan1
No := Len(Laporan)
Laporan:= Left(Laporan, No - 2)
Laporan+= Chr(13) + Chr(10)
Next
EndIf
If Pjg1 <>
? "Maaf. . .tidak ditemukan !"
Else
MemoWrit(xxx, Laporan)
MemoEdit(Laporan, 0, 0, 24, 80, .F.)
Clear
EndIf
SetColor("W/N, N/W,,, W/N")
? "Ingin mencari lagi ? (Esc= Tidak !)"
If InKey(0)= 27
Exit
EndIf
EndDo
Quit
*---

*------------------------
Function Bintang(oGet, x)
*------------------------
Private Ketik
If x != Nil
Ketik:= oGet
Else
Ketik:= oGet:Buffer
EndIf
Ketik:= StrTran(Ketik, "+0", "*.PRG")
Ketik:= StrTran(Ketik, "+1", "*.")
Ketik:= StrTran(Ketik, "+2", "*.*")
Ketik:= StrTran(Ketik, "+3", "*.TXT")
Ketik:= StrTran(Ketik, "+4", "*.BAT")
Ketik:= StrTran(Ketik, "+5", "*.LNK")
Ketik:= StrTran(Ketik, "+6", "*.CH")
Ketik:= StrTran(Ketik, "+7", "*.H")
Ketik:= StrTran(Ketik, "+8", "*.C")
Ketik:= StrTran(Ketik, "+9", "*.PAS")
Ketik:= StrTran(Ketik, "/0", "*.BAS")
Ketik:= StrTran(Ketik, "/1", "*.ME")
Ketik:= StrTran(Ketik, "/2", "*.HLP")
Ketik:= StrTran(Ketik, "/3", "*.INI")
Ketik:= StrTran(Ketik, "/4", "*.DAT")
Ketik:= StrTran(Ketik, "/5", "*.$$$")
Ketik:= StrTran(Ketik, "/6", "*.CPP")
Ketik:= StrTran(Ketik, "/7", "*.ASM")
Ketik:= StrTran(Ketik, "/8", "*.WK*")
Ketik:= StrTran(Ketik, "/9", "*.WQ*")
If x != Nil
Return Ketik
Else
oGet:VarPut(Ketik)
EndIf
Return .T.
*---------

