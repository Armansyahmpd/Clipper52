* =-=-
* Pass
* =-=-
Function Pass
Parameter Item
Private Warna, Layar, x, y, Ketik
Warna= SetColor()
Save Screen To Layar
Set Exact On
If ! File("Password.ini")
xPass= xOleh
Else
Restore From Password.ini Additive
EndIf
SetColor("Gr+/R, R/Gr+,,, Gr+/R")

Box3D(03,12,07,72)
Shadow(03,12,07,72)

For x= 1 To 3
@ 5, 18 Say Item
Ketik= Mengetik(5, Col(), 9)
Read
If xPass= Ketik
Exit
Clear
EndIf
Pesan(Str(x, 2) + " x kesalahan, Harap lebih teliti ! ")
Next
If xPass # Ketik
SetColor("W/N, N/W,,, W/N")

Private Pesan1,Pesan2,Pesan3
HapusLayar(MOD(VAL(SUBS(TIME(),1,2)+SUBS(TIME(),4,2)+SUBS(TIME(),7,2)),10)+1;
,50)

PESAN1 = "Anda Tidak mempunyai Hak Akses atas program ini"
PESAN2 = "Terima Kasih & Salam Manis"
PESAN3 = HakCipta() + " " + " - " + TANGGAL(DATE(), 1)


atas = 09
bawah = 15
kiri = 13
kanan = 66

Box3D(atas, kiri, bawah, kanan)
Shadow(atas, kiri, bawah, kanan)

SETCOLOR("B+/W")
@ atas + 2, 40 - LEN(PESAN1)/2 SAY PESAN1
SETCOLOR("GR+/W")
@ atas + 3, 40 - LEN(PESAN2)/2 SAY PESAN2
SETCOLOR("N/W")
@ atas + 4, 40 - LEN(PESAN3)/2 SAY PESAN3
SETCOLOR('W+/N')
SET CURSOR ON
@23,00
Quit
EndIf
SetColor(Warna)
Restore Screen From Layar
Set Exact Off
Return (.T.)
