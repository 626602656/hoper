<%
Call Com_CreatValidCode("safecode")
sub Com_CreatValidCode(ByVal pSN) 
Response.Expires = -9999 
Response.AddHeader "Pragma","no-cache" 
Response.AddHeader "cache-ctrol","no-cache" 
Response.ContentType = "Image/bmp" 
Randomize 
Dim i, ii, iii 
Const cOdds = 2 
Const cAmount = 14 
Const cCode = "0123456789+*=?" 
Dim vColorData(1),vColorRandom(10) 
vColorRandom(0)=ChrB(150) & ChrB(0) & ChrB(0) 
vColorRandom(1)=ChrB(0) & ChrB(150) & ChrB(0) 
vColorRandom(2)=ChrB(0) & ChrB(0) & ChrB(150) 
vColorRandom(3)=ChrB(0) & ChrB(50) & ChrB(150) 
vColorRandom(4)=ChrB(150) & ChrB(50) & ChrB(0) 
vColorRandom(5)=ChrB(150) & ChrB(0) & ChrB(150) 
vColorRandom(6)=ChrB(150) & ChrB(100) & ChrB(10) 
vColorRandom(7)=ChrB(150) & ChrB(40) & ChrB(120) 
vColorRandom(8)=ChrB(150) & ChrB(0) & ChrB(250) 
vColorRandom(9)=ChrB(100) & ChrB(100) & ChrB(100) 
vColorRandom(10)=ChrB(50) & ChrB(50) & ChrB(50) 
vColorData(0) = vColorRandom(0)
 
vColorData(1) = ChrB(250) & ChrB(250) & ChrB(255)
Dim vCode(4),vCodes,vCodeColors(4) 
For i = 0 To 4 
vCodeColors(i)=vColorRandom(Int(Rnd * 10)) 
Next 
Randomize:Dim rndnum:rndnum=int(Rnd*2) + 1
If rndnum=2 then
vCode(0) = Int(Rnd*5)+1 
vCode(1) = 10 
vCode(2) = Int(Rnd*5)+1 
vCode(3) = 12 
vCode(4) = 13
Session(Cacheflag&pSN) = vCode(0)+vCode(2) 
Else
vCode(0) = Int(Rnd*5)+1 
vCode(1) = 11 
vCode(2) = Int(Rnd*5)+1 
vCode(3) = 12 
vCode(4) = 13 
Session(Cacheflag&pSN) = vCode(0)*vCode(2) 
End if
Dim vNumberData(14) 
vNumberData(0) = "1110000111110111101111011110111101001011110100101111010010111101001011110111101111011110111110000111" 
vNumberData(1) = "1111011111110001111111110111111111011111111101111111110111111111011111111101111111110111111100000111" 
vNumberData(2) = "1110000111110111101111011110111111111011111111011111111011111111011111111011111111011110111100000011" 
vNumberData(3) = "1110000111110111101111011110111111110111111100111111111101111111111011110111101111011110111110000111" 
vNumberData(4) = "1111101111111110111111110011111110101111110110111111011011111100000011111110111111111011111111000011" 
vNumberData(5) = "1100000011110111111111011111111101000111110011101111111110111111111011110111101111011110111110000111" 
vNumberData(6) = "1111000111111011101111011111111101111111110100011111001110111101111011110111101111011110111110000111" 
vNumberData(7) = "1100000011110111011111011101111111101111111110111111110111111111011111111101111111110111111111011111" 
vNumberData(8) = "1110000111110111101111011110111101111011111000011111101101111101111011110111101111011110111110000111" 
vNumberData(9) = "1110001111110111011111011110111101111011110111001111100010111111111011111111101111011101111110001111" 
vNumberData(10) = "1111111111111101111111110111111111011111100000001111110111111111011111111101111111110111111111111111" 
vNumberData(11) = "1111111111111111111110111110111101110111111010111111110111111110101111110111011110111110111111111111"
vNumberData(12) = "1111111111111111111111111111111000000001111111111111111111111000000001111111111111111111111111111111" 
vNumberData(13) = "1110000111110011001111011110111111111011111111001111111001111111001111111111111111110011111111001111"
 
Response.BinaryWrite ChrB(66) & ChrB(77) & ChrB(166) & ChrB(8) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) &_ 
ChrB(0) & ChrB(0) & ChrB(54) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(40) & ChrB(0) &_ 
ChrB(0) & ChrB(0) & ChrB(52) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(10) & ChrB(0) &_ 
ChrB(0) & ChrB(0) & ChrB(1) & ChrB(0) 
Response.BinaryWrite ChrB(24) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(112) & ChrB(8) &_ 
ChrB(0) & ChrB(0) & ChrB(18) & ChrB(11) & ChrB(0) & ChrB(0) & ChrB(18) & ChrB(11) &_ 
ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) &_ 
ChrB(0) & ChrB(0) 
For i = 9 To 0 Step -1 
For ii = 0 To 4 
For iii = 1 To 10 
vColorData(0)=vCodeColors(ii) 
If Rnd * 99 + 1 < cOdds Then 
Response.BinaryWrite vColorData(0) 
Else 
Response.BinaryWrite vColorData(Mid(vNumberData(vCode(ii)), i * 10 + iii, 1)) 
End If 
Next 
Next 
Response.BinaryWrite vColorData(1) & vColorData(1) 
Next 
End sub
%>