PROGRAM Bingo;
USES uConjuntos,uElem,uProc,uFicheros,Crt;
CONST
	bolas=50;
VAR
	conjunto:TConjunto;
	opcion:char;

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

PROCEDURE tachar(n,color:integer);
VAR
	x,y:integer;
BEGIN
	x:=7*((n-1) MOD 10)+5;{Calcula la posicion X de la casilla}
	y:=2*((n-1) DIV 10)+7;{Calcula la posicion Y de la casilla}
	gotoXY(x,y);
	TextBackGround(color);
	TextColor(15);
	write('  ',(n DIV 10),(n MOD 10),'  ');{Re escribe el numero en verde}
END;

PROCEDURE sorteo;
VAR
	i,j,k:TElemento;
BEGIN
	k:=0;
	j:=0;
	WHILE NOT EsConjuntoVacio(conjunto) DO BEGIN
		i:=Elegir(conjunto);
		IF j<>0 THEN
		BEGIN
			tachar(j,5);{tacha en magenta}
			window(23,18,28,25);
			numero(j DIV 10,12);
			window(30,18,35,25);
			numero(j MOD 10,12);
			window(1,1,80,25);
			IF k<>0 THEN
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
		readln;
		Eliminar(i,conjunto);
	END;
	Window(1,18,80,25);{ LIMPIA PANTALLA}
	TextBackGround(0);
	clrscr;
	Writeln('El sorteo ha terminado, no quedan bolas');
END;
BEGIN
	Inicializar;
	Menu;
	tablero;
	Generador(bolas,conjunto);{Selimita a 50 el numero de bolas}
	Guardar(conjunto);
	tablero;
	REPEAT
		Sorteo;
		write('¿Desea jugar otra vez? Pulse "S" o "N": ');
		readln(opcion);
		writeln;
		IF (upcase(opcion)='S') THEN
			BEGIN
				Inicializar;
				Menu;
				tablero;
				Generador(bolas,conjunto);{Selimita a 50 el numero de bolas}
				Guardar(conjunto);
				tablero;
				writeln;
			END
		ELSE
			opcion:='N';
	UNTIL opcion='N';
readln;
END.

