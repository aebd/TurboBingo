PROGRAM Bingo;
USES uConjuntos,uElem,uProc,uFicheros,Crt,uSonido;
CONST
	bolas=50;
VAR
	conjunto:TConjunto;
	opcion:char;
	archivo:TFileElem;
	fin:boolean;
	ruta:string;

PROCEDURE jugar(VAR conj:Tconjunto;VAR bol:boolean);
VAR
j,k:TElemento;
BEGIN
	bol:=FALSE;
	j:=0;
	k:=0;
	Inicializar;
	tablero;
	Generador(1,bolas,conj);
	write('Pulsa [ENTER] para comenzar...');
	readln;
	tablero;
	sorteo(conj,j,k,bol);
END;

PROCEDURE carton;
BEGIN
	logo;
	Window(27,7,80,8);
	TextColor(11);
	TextBackground(1);
	write('#######   CARTONES   #######');
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
				jugar(conjunto,fin);
				REPEAT
				IF fin THEN
				BEGIN
					pausa;
					readln(opcion);
					CASE opcion OF
						'1':jugar(conjunto,fin);
						'2':guardar(archivo);
						'3':BEGIN;END;
						'4':cargar(archivo,'save.tmp',conjunto,fin);
					ELSE
						Write('Introduzca una opcion valida (1-4): ');
					END;
				END
				ELSE
				opcion:='3';{Si no viene de pausa, es el final}
				UNTIL (opcion='2') OR (opcion='3');
				Window(1,1,80,25);
				TextBackGround(0);
				clrscr;
				gotoXY(54,25);
				TextColor(8);
				write(chr(184),'2012 TurboBingo Unlimited');
				logo;
			END;
		'2':carton;
		'3':BEGIN
			Write('Nombre del archivo a cargar: ');
			readln(ruta);
			ruta:=ruta+'.sav';
			cargar(archivo,ruta,conjunto,fin);
			REPEAT
			IF fin THEN
			BEGIN
				pausa;
				readln(opcion);
				CASE opcion OF
					'1':jugar(conjunto,fin);
					'2':guardar(archivo);
					'3':BEGIN;END;
					'4':cargar(archivo,'save.tmp',conjunto,fin);
				ELSE
					Write('Introduzca una opcion valida (1-4): ');
				END;
			END
			ELSE
				opcion:='3';{Si no viene de pausa, es el final}
			UNTIL (opcion='2') OR (opcion='3');
			Window(1,1,80,25);
			TextBackGround(0);
			clrscr;
			gotoXY(54,25);
			TextColor(8);
			write(chr(184),'2012 TurboBingo Unlimited');
			logo;
			END;
		'4':BEGIN
				writeln;
				writeln('Gracias por utilizar TurboBingo',chr(169),' v3.2');
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

