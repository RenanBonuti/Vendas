unit UMesExtenso;

interface

Function NomedoMes(dData:TDatetime):string;

implementation

Function NomedoMes(dData:TDatetime):string;
var
nAno,nMes,nDia:word;
cMes:array[1..12] of string;
begin
cMes[01] := 'Janeiro';
cMes[02] := 'Fevereiro';
cMes[03] := 'Mar�o';
cMes[04] := 'Abril';
cMes[05] := 'Maio';
cMes[06] := 'Junho';
cMes[07] := 'Julho';
cMes[08] := 'Agosto';
cMes[09] := 'Setembro';
cMes[10] := 'Outubro';
cMes[11] := 'Novembro';
cMes[12] := 'Dezembro';
//decodedate(dData,nAno,nMes,nDia);
if (nMes>=1) and (nMes<=13)then
begin
Result:=cMes[nMes];
end
else
begin
Result:='';
end;
end;

end.
