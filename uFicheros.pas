unit uFicheros;
interface
USES uConjuntos,uElem,uProc;

	PROCEDURE Cartones;
	PROCEDURE cargar(VAR fich:TFileElem;ruta:string[100];VAR conjunto:TConjunto);

implementation

	PROCEDURE Cartones;
	CONST
		MAX=15; (* numeros de cada carton*)
	VAR
		conjunto:TConjunto;
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
			crearconjuntovacio(conjunto);
			generador(50,conjunto);
			FOR k:=1 TO MAX DO
				BEGIN
				num:=Elegir(conjunto);
				write(archivo,num ,' ');
				eliminar(num,conjunto);
			END;
			writeln(archivo);
			writeln(archivo);
		END;
		close(archivo);
		writeln('Se ha guardado con exito el archivo ',ruta,' ');
	END;


PROCEDURE cargar(VAR fich:TFileElem;ruta:string[100];VAR conjunto:TConjunto);
VAR
	elem,a,b:TElemento;
	l:integer;
BEGIN
	a:=0;
	b:=0;
	l:=0;
	assign(fich, ruta);
	{$I-}   {Desactica el control de errores}
	reset(fich);
	{$I+}   {Actica el control de errores}
	IF IORESULT= 0 THEN   {IORESULT almacena el n£mero de fallos en el tiempo que estaba desactivado el cotrol}
		tablero;
		crearconjuntovacio(conjunto);
		Generador(50,conjunto);
		write('Pulsa [ENTER] para comenzar...');
		readln;
		tablero;
		IF filesize(fich)<50 THEN
		BEGIN
			WHILE NOT EOF(fich)	DO
			BEGIN
				seek(fich, l);
				read(fich,elem);
				colores(elem,a,b);
				eliminar(elem,conjunto);
				l:=l+1;
			END;
		close(fich);
		sorteo(conjunto,a,b,TRUE);
		END
		ELSE
		BEGIN
			close(fich);
			crearconjuntovacio(conjunto);
			Generador(50,conjunto);
			tablero;
			a:=0;
			b:=0;
			sorteo(conjunto,a,b,FALSE);
		END;
END;

end.
