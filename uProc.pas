UNIT uProc;
INTERFACE
USES uConjuntos,uElem,Crt;

PROCEDURE Inicializar;
PROCEDURE Menu;
PROCEDURE tablero;

IMPLEMENTATION
VAR
	conjunto:TConjunto;

PROCEDURE Inicializar;
BEGIN
	HighVideo;
	CrearConjuntoVacio(conjunto);
	Window(1,1,80,25);
	TextBackGround(0);
	clrscr;
	gotoXY(54,25);
	write(chr(184),'2012 TurboBingo Unlimited');
END;

PROCEDURE Menu;
BEGIN
	window(23,1,46,6);
	TextBackGround(0);
	TextColor(15);
	writeln('**********************************');
	writeln('*                                *');
	writeln('*       TurboBingo',chr(169),' v2.1         *');
	writeln('*                                *');
	writeln('**********************************');
END;


PROCEDURE tablero;
VAR
	j:integer;
BEGIN
	Window(4,6,75,18);
	TextColor(15);
	TextBackGround(1);
	write(chr(201),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	FOR j:=1 TO 9 DO
	write(chr(203),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	writeln(chr(187));
	write(chr(186));
	FOR j:=1 TO 9 DO
	write('  0',j,'  ',chr(186));
	write('  10  ',chr(186));
	writeln;
	write(chr(204),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	FOR j:=1 TO 9 DO
	write(chr(206),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	writeln(chr(185));
	write(chr(186));
	FOR j:=11 TO 20 DO
	write('  ',j,'  ',chr(186));
	writeln;
	write(chr(204),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	FOR j:=1 TO 9 DO
	write(chr(206),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	writeln(chr(185));
	write(chr(186));
	FOR j:=21 TO 30 DO
	write('  ',j,'  ',chr(186));
	writeln;
	write(chr(204),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	FOR j:=1 TO 9 DO
	write(chr(206),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	writeln(chr(185));
	write(chr(186));
	FOR j:=31 TO 40 DO
	write('  ',j,'  ',chr(186));
	writeln;
	write(chr(204),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	FOR j:=1 TO 9 DO
	write(chr(206),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	writeln(chr(185));
	write(chr(186));
	FOR j:=41 TO 50 DO
	write('  ',j,'  ',chr(186));
	writeln;
	write(chr(200),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	FOR j:=1 TO 9 DO
	write(chr(202),chr(205),chr(205),chr(205),chr(205),chr(205),chr(205));
	writeln(chr(188));
	Window(1,17,80,25);
	TextBackGround(0);
	clrscr;
	gotoXY(54,8);
	write(chr(184),'2012 TurboBingo Unlimited');
	gotoXY(1,1);
	writeln;
END;

END.
