UNIT uProc;
INTERFACE
USES uConjuntos,uElem,Crt,uSonido;

PROCEDURE Inicializar;
PROCEDURE Menu;
PROCEDURE Logo;
PROCEDURE tablero;
PROCEDURE colores(VAR i,j,k:TElemento);
PROCEDURE tachar(n,color:integer);
PROCEDURE numero(n,color:integer);
PROCEDURE sorteo(VAR bolas:TConjunto;VAR j,k:TElemento;VAR pause:boolean);
PROCEDURE creararchivo(VAR fich:TFileElem);
PROCEDURE Pausa;
PROCEDURE instrucciones;

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
	TextColor(8);
	write(chr(184),'2012 TurboBingo Unlimited');
END;

PROCEDURE Logo;
BEGIN
	window(23,1,46,6);
	TextBackGround(0);
	TextColor(15);
	writeln('**********************************');
	writeln('*                                *');
	writeln('*       TurboBingo',chr(169),' v3.1         *');
	writeln('*                                *');
	writeln('**********************************');
END;

PROCEDURE Menu;
BEGIN
	Logo;
	Window(26,7,80,8);
	TextColor(11);
	TextBackground(1);
	write('########    MENU    ########');
	Window(12,10,80,25);
	TextBackGround(0);
	TextColor(7);
	writeln('1 - JUGAR');
	writeln;
	writeln('2 - CARTONES');
	writeln;
	writeln('3 - CARGAR');
	writeln;
	writeln;
	writeln;
	writeln('4 - SALIR');
	writeln;
	writeln;
	write('Que desea hacer: ');
END;

PROCEDURE Pausa;
BEGIN
	Logo;
	Window(25,6,53,21);
	TextBackGround(7);
	clrscr;
	Window(25,6,53,6);
	TextColor(14);
	TextBackground(4);
	write('########    PAUSA    ########');
	Window(27,9,53,21);
	TextColor(0);
	TextBackGround(7);
	writeln('1 - NUEVA PARTIDA');
	writeln;
	writeln('2 - GUARDAR');
	writeln;
	writeln('3 - VOLVER AL MENU');
	writeln;
	writeln;
	writeln;
	writeln('4 - VOLVER');
	writeln;
	writeln;
	write('Que desea hacer: ');
END;

PROCEDURE tablero;
VAR
	j:integer;
BEGIN
	logo;
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
	gotoXY(54,9);
	TextColor(8);
	write(chr(184),'2012 TurboBingo Unlimited');
	gotoXY(7,4);
	TextColor(15);
END;

PROCEDURE tachar(n,color:integer);
VAR
	x,y:integer;
BEGIN
	window(1,1,80,25);
	x:=7*((n-1) MOD 10)+5;{Calcula la posicion X de la casilla}
	y:=2*((n-1) DIV 10)+7;{Calcula la posicion Y de la casilla}
	gotoXY(x,y);
	TextBackGround(color);
	TextColor(15);
	write('  ',(n DIV 10),(n MOD 10),'  ');{Re escribe el numero en verde}
END;

PROCEDURE numero(n,color:integer);
CONST
	x=chr(219);
BEGIN
	textcolor(color);
	textbackground(0);
	CASE n OF
	0:BEGIN
		writeln(' ',x,x,x,x,' ');
		writeln(x,'    ',x);
		writeln(x,'   ',x,x);
		writeln(x,'  ',x,' ',x);
		writeln(x,' ',x,'  ',x);
		writeln(x,x,'   ',x);
		write(' ',x,x,x,x,' ');
	END;
	1:BEGIN
		writeln('     ',x);
		writeln('     ',x);
		writeln('     ',x);
		writeln('      ');
		writeln('     ',x);
		writeln('     ',x);
		write('     ',x);
	END;
	2:BEGIN
		writeln(' ',x,x,x,x,' ');
		writeln('     ',x);
		writeln('     ',x);
		writeln(' ',x,x,x,x,' ');
		writeln(x,'     ');
		writeln(x,'     ');
		write(' ',x,x,x,x,' ');
	END;
	3:BEGIN
		writeln(' ',x,x,x,x,' ');
		writeln('     ',x);
		writeln('     ',x);
		writeln(' ',x,x,x,x,' ');
		writeln('     ',x);
		writeln('     ',x);
		write(' ',x,x,x,x,' ');
	END;
	4:BEGIN
		writeln(x,'    ',x);
		writeln(x,'    ',x);
		writeln(x,'    ',x);
		writeln(' ',x,x,x,x,' ');
		writeln('     ',x);
		writeln('     ',x);
		write('     ',x);
	END;
	5:BEGIN
			writeln(' ',x,x,x,x,' ');
		writeln(x,'     ');
		writeln(x,'     ');
		writeln(' ',x,x,x,x,' ');
		writeln('     ',x);
		writeln('     ',x);
		write(' ',x,x,x,x,' ');
	END;
	6:BEGIN
			writeln(' ',x,x,x,x,' ');
		writeln(x,'     ');
		writeln(x,'     ');
		writeln(' ',x,x,x,x,' ');
		writeln(x,'    ',x);
		writeln(x,'    ',x);
		write(' ',x,x,x,x,' ');
	END;
	7:BEGIN
			writeln(' ',x,x,x,x,' ');
		writeln('     ',x);
		writeln('     ',x);
		writeln('      ');
		writeln('     ',x);
		writeln('     ',x);
		write('     ',x);
	END;
	8:BEGIN
		writeln(' ',x,x,x,x,' ');
		writeln(x,'    ',x);
		writeln(x,'    ',x);
		writeln(' ',x,x,x,x,' ');
		writeln(x,'    ',x);
		writeln(x,'    ',x);
		write(' ',x,x,x,x,' ');
		END;
	9:BEGIN
			writeln(' ',x,x,x,x,' ');
		writeln(x,'    ',x);
		writeln(x,'    ',x);
		writeln(' ',x,x,x,x,' ');
		writeln('     ',x);
		writeln('     ',x);
		write(' ',x,x,x,x,' ');
	END;
END;
END;

PROCEDURE colores(VAR i,j,k:TElemento);
BEGIN
IF j>0 THEN
		BEGIN
			tachar(j,5);{tacha en magenta}
			window(23,18,28,25);
			numero(j DIV 10,12);
			window(30,18,35,25);
			numero(j MOD 10,12);
			window(1,1,80,25);
			IF k>0 THEN
			BEGIN
				tachar(k,2);{tacha en Verde}
				window(6,18,11,25);
				numero(k DIV 10,4);
				window(13,18,18,25);
				numero(k MOD 10,4);
				window(1,1,80,25);
			END;
		END;
		window(40,18,45,25);
		numero(i DIV 10,10);
		window(47,18,52,25);
		numero(i MOD 10,10);
		window(1,1,80,25);
		k:=j;
		j:=i;
		tachar(i,4);{Tacha en rojo}
END;
PROCEDURE instrucciones;
BEGIN
	window(1,17,80,25);
	TextBackground(0);
	gotoXY(54,2);
	TextColor(7);
	Write('Pulsa ');
	TextColor(15);
	write('[ENTER]');
	TextColor(7);
	write(' para obtener');
	gotoXY(54,3);
	write('una nueva bola...');
	gotoXY(54,5);
	write('Pulsa ');
	TextColor(15);
	write('[ESC]');
	TextColor(7);
	write(' para volver al');
	gotoXY(54,6);
	write('menu...');
	window(1,1,80,25);
END;
PROCEDURE sorteo(VAR bolas:TConjunto;VAR j,k:TElemento;VAR pause:boolean);
VAR
	fich:TFileElem;
	i:TElemento;
	key:char;
BEGIN
	IF pause THEN
	BEGIN
	assign(fich, 'save.tmp');
	reset(fich);
	Seek (fich, FileSize(fich));
	END
	ELSE
	creararchivo(fich);
	instrucciones;
	pause:=FALSE;
	WHILE NOT EsConjuntoVacio(bolas) AND NOT pause DO BEGIN
		i:=Elegir(bolas);
		write(fich,i);
		colores(i,j,k);
		Eliminar(i,bolas);
		Play(i);
		key:=readkey;
		pause:= ord(key)=27;
	END;
	crearconjuntovacio(bolas);
	Window(1,18,80,25);{ LIMPIA PANTALLA}
	TextBackGround(0);
	IF filepos(fich)<>50 THEN
	BEGIN
		close(fich);
		pausa;
	END
	ELSE
		BEGIN
			close(fich);
			tablero;
		END;
END;

PROCEDURE creararchivo(VAR fich:TFileElem);
CONST
		ruta='save.tmp';
BEGIN
	assign( fich, ruta);
	rewrite(fich);
END;

END.
