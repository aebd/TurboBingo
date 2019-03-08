unit uFicheros;
interface
USES uConjuntos,uElem;

	PROCEDURE Cartones(VAR conjunto:TConjunto);

implementation

	PROCEDURE Cartones(VAR conjunto:TConjunto);
	CONST
		MAX=7; (* numeros de cada carton*)
	VAR
		ruta:string[100];
		archivo:text;
		numero,j,k:integer;
		num:TElemento;
	BEGIN
		numero:=0;
		write('Numero de cartones a generar: ');
		readln(numero);
		write('Introduce una ruta donde guardar: ');
		readln(ruta);
		writeln;
		assign(archivo,ruta);
		rewrite(archivo);
		FOR j:=1 TO numero DO
		BEGIN
			write(archivo,'Cartón ',j,':  ');
			FOR k:=1 TO MAX DO
				BEGIN
				num:=Elegir(conjunto);
				write(archivo,num ,' ');
			END;
			writeln(archivo);
			writeln(archivo);
		END;
		close(archivo);
		writeln('Se ha guardado con exito el archivo ',ruta,' ');
	END;
end.
