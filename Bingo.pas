PROGRAM Bingo;
USES uConjuntos,uElem;
VAR
	numero,i:TElemento;
	conjunto:TConjunto;
	opcion:char;
PROCEDURE Menu;
BEGIN
	writeln('*********************************');
	writeln('*                               *');
	writeln('* Bienvenido al TurboBingo v1.0 *');
	writeln('*                               *');
	writeln('*********************************');
	writeln;
	write('Escriba el numero de bolas: ');
	readln(numero);
	CrearConjuntoVacio(conjunto);
	Generador(numero,conjunto);
END;

BEGIN
	numero:=0;
	Menu;
	REPEAT
		WHILE NOT EsConjuntoVacio(conjunto) DO BEGIN
			i:=Elegir(conjunto);
			write(i);
			readln;
			Eliminar(i,conjunto);
		END;
		IF EsConjuntoVacio(conjunto) THEN
			BEGIN
			writeln('No hay mas numeros');
			writeln;
		END;
		write('?Desea jugar otra vez? Pulse "S" o "N": ');
		readln(opcion);
		writeln;
		IF (opcion='S') OR (opcion='s') THEN
			BEGIN
			Menu;
			writeln;
			END
		ELSE
			numero:=0;
	UNTIL numero=0;

readln;
END.

