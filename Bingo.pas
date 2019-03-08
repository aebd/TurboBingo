PROGRAM Bingo;
USES uConjuntos,uElem,uFicheros;
VAR
	numero,i:TElemento;
	conjunto:TConjunto;
	opcion:char;
PROCEDURE Inicializar;
BEGIN
	CrearConjuntoVacio(conjunto);
END;

PROCEDURE Menu;
BEGIN
	writeln('*********************************');
	writeln('*                               *');
	writeln('* Bienvenido al TurboBingo v1.2 *');
	writeln('*                               *');
	writeln('*  ©2012 TurboBingo  Unlimited  *');
	writeln('*      All rights reserved      *');
	writeln('*                               *');
	writeln('*********************************');
	writeln;
END;

PROCEDURE Generar(num:TElemento);
BEGIN
	Generador(num,conjunto);
END;
PROCEDURE sorteo;
BEGIN
	WHILE NOT EsConjuntoVacio(conjunto) DO BEGIN
		i:=Elegir(conjunto);
		write(i);
		readln;
		Eliminar(i,conjunto);
	END;
	Writeln('El sorteo ha terminado, no quedan bolas');
END;

BEGIN
	numero:=0;
	Inicializar;
	Menu;
	write('Escriba el numero de bolas: ');
	readln(numero);
	Generar(numero);
	Guardar(conjunto);
	REPEAT
		Sorteo;
		write('?Desea jugar otra vez? Pulse "S" o "N": ');
		readln(opcion);
		writeln;
		IF (upcase(opcion)='S') THEN
			BEGIN
				Inicializar;
				Menu;
				write('Escriba el numero de bolas: ');
				readln(numero);
				Generar(numero);
				writeln;
			END
		ELSE
			numero:=0;
	UNTIL numero=0;

readln;
END.
