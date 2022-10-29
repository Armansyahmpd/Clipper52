*-------------
Procedure Calc
* Membuat kalkulator
* Armansyah
*-------------
Local Ttp, Tmp, Tnd, Sgn, Hrf, Kur
Local Ang0, Ang1, Test, Hasil, Potongan
Local A, N, Bar, Kol, Ul, xx, nLen, AStack:= {}
Private Layar, Warna
Set Key 9 To
Bri := 1
Kli := 25
Bar := Row()
Kol := Col()
Kur := SetCursor()
Warna:= SetColor()
Save Screen To Layar
Box3D2(1, 20, 16, 47)
Bayangan(1, 20, 16, 47)
SetCursor(0)
Hrf:= Repl(Chr(205), 18)
@05, Kli Say Hrf
Hrf:= Left(Hrf, 5)
@03, Kli Say Hrf + " " + Deskrip("7wgjl€")+ " " + Hrf
Set Color To Gr+/Bg
*----------------------
@06, Kli Say ' % '
@06, Kli + 5 Say ' %.'
@06, Kli + 10 Say ' ý '
@06, Kli + 15 Say ' û '
*----------------------
@08, Kli Say ' 7 '
@08, Kli + 5 Say ' 8 '
@08, Kli + 10 Say ' 9 '
@08, Kli + 15 Say ' : '
*----------------------
@10, Kli Say ' 4 '
@10, Kli + 5 Say ' 5 '
@10, Kli + 10 Say ' 6 '
@10, Kli + 15 Say ' x '
*----------------------
@12, Kli Say ' 1 '
@12, Kli + 5 Say ' 2 '
@12, Kli + 10 Say ' 3 '
@12, Kli + 15 Say ' - '
*----------------------
@14, Kli Say ' 0 '
@14, Kli + 5 Say ' . '
@14, Kli + 10 Say ' = '
@14, Kli + 15 Say ' + '
*----------------------
@04, Kli Say Space(18)
Hrf:= Chr(13) + Chr(10)
Store '' To Ttp, Tmp, Tpp, Sgn, Tnd
Store 0 To A, N, Ul, xx, nLen, Test, Hasil
Brii:= 16
Kli := 20
Klii:= 47
@Bri + 3, Kli + 5 Say '( ) '
Potongan:= " Periksa Hasil " + Hrf
Potongan+= " ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ" + Hrf + " " + Hrf
MemoWrit("Calc.$$$", Potongan)
Do While .T.
A:= 0
Do While ! Chr(A) $ '1234567890.-+*:/%^=cvx$CVX'
A:= InKey()
If A= 27
Set Key 9 To
Potongan:= ""
SetCursor(Kur)
SetColor(Warna)
SetPos(Bar, Kol)
MemoWrit("Calc.$$$", "íåãïàØ")
Restore Screen From Layar
Return
ElseIf A= 13 && Enter
LihatFile(Bri, Kli, Brii, Klii, "Calc.$$$")
ElseIf A= 9 && Tab
Do Gerak
Clear TypeAHead
ElseIf A= 25 && ^Y
Ttp:= Tmp
Store '' To Tmp, Tpp
ElseIf A= 21 && ^U
Tmp:= Ttp
Tpp:= Tmp
ElseIf A= 5 && Panah Atas
Ul:= 0
nLen--
nLen:= Iif(nLen <>
Store AStack[nLen] To Tmp, Tpp
ElseIf A= 24 && Panah Bawah
Ul:= 0
nLen++
nLen:= Iif(nLen > xx, xx, nLen)
Store AStack[nLen] To Tmp, Tpp
ElseIf A= 4 && Panah Kanan
If Len(Tmp) <>
Tmp:= Left(Ttp, Len(Tmp) + 1)
Tpp:= Tmp
EndIf
ElseIf A= 8 .Or. A= 19 && BackSpace atau Panah Kiri
If Len(Tmp) > 0
Tmp:= Left(Tmp, Len(Tmp) - 1)
Tpp:= Tmp
EndIf
EndIf
@Bri + 3, Kli + 9 Say TransForm(Val(Tpp), '999,999,999.99')
Enddo
If Chr(A) $ 'cC' .And. Val(Tpp) > 0
@Bri + 3, Kli + 5 Say '( ) '
Store '' To Sgn, Tmp, Tpp, Tnd
Store 0 To N, Ul, Ang0, Ang1, Test, Hasil
Potongan+= ' ÍÍÍ "C" ( Nol !) ÍÍÍ ' + Hrf
MemoWrit("Calc.$$$", Potongan)
Loop
ElseIf Chr(A) $ 'cC'
Ul++
EndIf
If Chr(A) $ 'vV' .And. Val(Tpp) > 0
Ang0:= Val(Tpp)
Store Chr(A) To Tnd, Sgn
@Bri + 3, Kli + 5 Say '(û) '
Potongan+= " ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ " + Hrf
Potongan+= " ³" + TransForm(Ang0, '999,999,999.99') + "³ " + Hrf
Potongan+= " ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´ (û) " + Hrf
Ang0:= Sqrt(Ang0)
Store 0 To N, Ul, Test, Ang1
Store Str(Ang0) To Tpp, Tmp, Hasil
Potongan+= " ³" + TransForm(Ang0, '999,999,999.99') + "³ " + Hrf
Potongan+= " ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ " + Hrf
MemoWrit("Calc.$$$", Potongan)
Loop
ElseIf Chr(A) $ 'vV'
Ul++
EndIf
If Sgn= '=' .And. Chr(A) $ '='
Loop
ElseIf Chr(A) $ '-+*:/%^=xcv$XCV' .And. (Ul > 0 .Or. Len(Tmp) <>
Loop
EndIf
If Chr(A) $ '-+*:/%^x$X' .And. (Sgn= '=' .Or. Sgn $ 'vV')
Ul++
Sgn:= Chr(A)
Tnd:= Tanda(Sgn)
EndIf
If Chr(A) $ '0123456789.'
Ul := 0
Test:= Iif(Test= 1, 0, 1)
x:= Iif(At(".", Tmp)= 0, 9, 12)
If Len(Tmp) <>
Tmp+= Chr(A)
Store Tmp To Ttp, Tpp
EndIf
Else
If Chr(A) != '=' .And. N <> 0
xx++
nLen++
Sgn := Chr(A)
Ang0:= Val(Tmp)
Aadd(AStack, Tmp)
Tnd := Tanda(Sgn)
Store '' To Tmp, Tpp
Store 1 To N, Ul, Test
@Bri + 3, Kli + 5 Say '(' + Tnd + ') '
Potongan+= TransForm(Ang0, ' 999,999,999.99 ') + Hrf
MemoWrit("Calc.$$$", Potongan)
Else
xx++
nLen++
Ang1:= Val(Tmp)
Aadd(AStack, Tmp)
Do Case
Case Sgn== '+'
Hasil:= Ang0 + Ang1
Case Sgn== '-'
Hasil:= Ang0 - Ang1
Case Sgn $ '^ý'
Hasil:= Ang0 ^ Ang1
Case Sgn $ ':/'
Hasil:= Ang0 / Ang1
Case Sgn $ '*xX'
Hasil:= Ang0 * Ang1
Case Sgn== '%'
Hasil:= Ang0 * Ang1 / 100
Case Sgn== '$' .Or. Sgn== '%.'
Hasil:= Ang0 * Ang1 / 1000
EndCase
Store Str(Hasil) To Ttp, Tpp
If Chr(A)== '='
Sgn := '='
Ang0:= Hasil
@Bri + 3, Kli + 5 Say '(=) '
Potongan+= TransForm(Ang1, ' 999,999,999.99 ') + Hrf
Potongan+= " ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ " + '(' + Tnd + ')' + Hrf
Potongan+= " ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ " + Hrf
Potongan+= " ³" + TransForm(Ang0, '999,999,999.99')
Potongan+= "³ (=) " + Hrf
Potongan+= " ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ " + Hrf
MemoWrit("Calc.$$$", Potongan)
Store 0 To N, Ul, Ang1, Test
Store Str(Hasil) To Tpp, Tmp
Loop
Else
Tmp := ''
Ang0:= Hasil
Sgn := Chr(A)
Store 1 To N, Ul
Do Case
Case Sgn== '^'
@Bri + 3, Kli + 5 Say '(ý) '
Case Sgn== '/'
@Bri + 3, Kli + 5 Say '(:) '
Case Sgn== '$'
@Bri + 3, Kli + 5 Say '(%.)'
Case Sgn $ '*X'
@Bri + 3, Kli + 5 Say '(x) '
OtherWise
@Bri + 3, Kli + 5 Say '(' + Sgn + ') '
EndCase
EndIf
Potongan+= TransForm(Ang1, ' 999,999,999.99 ') + Hrf
Potongan+= " ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ " + '(' + Tnd + ')' + Hrf
Potongan+= TransForm(Ang0, ' 999,999,999.99 ') + Hrf
MemoWrit("Calc.$$$", Potongan)
Ang1:= 0
Test:= 1
Tnd := Tanda(Sgn)
EndIf
EndIf
Enddo
Return
*-----
