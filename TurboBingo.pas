PROGRAM Bingo;
USES uConjuntos,uElem,uProc,uFicheros,Crt;
CONST
	bolas=50;
VAR
	conjunto:TConjunto;
	opcion:char;
	archivo:TFileElem;

PROCEDURE jugar(VAR conj:Tconjunto);
VAR
j,k:TElemento;
BEGIN
	j:=0;
	k:=0;
	Inicializar;
	tablero;
	Generador(bolas,conj);
	write('Pulsa [ENTER] para comenzar...');
	readln;
	tablero;
	sorteo(conj,j,k,FALSE);
END;

PROCEDURE carton;
BEGIN
	logo;
	Window(26,7,80,8);
	TextColor(11);
	TextBackground(1);
	write('########   CARTONES   ########');
	Window(12,10,80,25);
	TextBackGround(0);
	clrscr;
	gotoXY(43,16);
	TextColor(8);
	write(chr(184),'2012 TurboBingo Unlimited');
	Window(12,10,80,25);
	TextColor(7);
	Cartones;
	gotoxy(1,12);
	write('Pulsa ');
	TextColor(15);
	write('[ENTER]');
	TextColor(7);
	write(' para continuar ... ');
	readln;
END;

BEGIN
	REPEAT
		Inicializar;
		Menu;
		readln(opcion);
		CASE opcion OF
		'1':BEGIN
				jugar(conjunto);
				REPEAT
					write('¿Desea jugar otra vez? Pulse "S" o "N": ');
					readln(opcion);
					IF (upcase(opcion)='S') THEN
						jugar(conjunto)
					ELSE
						opcion:='N';
				UNTIL opcion='N';
			END;
		'2':carton;
		'3':cargar(archivo,'save.tmp',conjunto);
		'4':BEGIN
				writeln;
				writeln('Gracias por utilizar TurboBingo',chr(169),' v2.3');
				write('Pulsa ');
				TextColor(15);
				write('[ENTER]');
				TextColor(7);
				write(' para salir...');
				readln;
				exit;
			END;
	ELSE
	write('Por favor escoge una opcion valida(1-4): ');
	END;
	UNTIL opcion='4';
END.

