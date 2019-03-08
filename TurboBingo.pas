PROGRAM Bingo;
USES uConjuntos,uElem,uProc,uFicheros,Crt;
CONST
	bolas=50;
VAR
	conjunto:TConjunto;
	opcion:char;

PROCEDURE numero(n:integer);
CONST
	x=chr(219);
BEGIN
	textcolor(10);
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

PROCEDURE tachar(n:integer);
VAR
	x,y:integer;
BEGIN
	x:=7*((n-1) MOD 10)+5;{Calcula la posicion X de la casilla}
	y:=2*((n-1) DIV 10)+7;{Calcula la posicion Y de la casilla}
	gotoXY(x,y);
	TextBackGround(2);
	TextColor(15);
	write('  ',(n DIV 10),(n MOD 10),'  ');{Re escribe el numero en verde}
END;

PROCEDURE sorteo;
VAR
	i:TElemento;
BEGIN
	WHILE NOT EsConjuntoVacio(conjunto) DO BEGIN
		i:=Elegir(conjunto);
		window(30,18,35,25);
		numero(i DIV 10);
		window(37,18,42,25);
		numero(i MOD 10);
		window(1,1,80,25);
		tachar(i);
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

