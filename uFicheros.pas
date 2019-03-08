unit uFicheros;
interface
USES uConjuntos,uElem,uProc,crt;

	PROCEDURE Cartones;
	PROCEDURE cargar(VAR fich:TFileElem;ruta:string;VAR conjunto:TConjunto;VAR fin:boolean);
	PROCEDURE guardar(VAR save:TFileElem);

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


PROCEDURE cargar(VAR fich:TFileElem;ruta:string;VAR conjunto:TConjunto;VAR fin:boolean);
VAR
	elem,a,b:TElemento;
	l:integer;
	fich2:TFileElem;
BEGIN
	a:=0;
	b:=0;
	l:=0;
	fin:=TRUE;
	IF ruta <> 'save.tmp' THEN
	BEGIN
		assign(fich2,'save.tmp');
		{$I-}   {Desactica el control de errores}
			reset(fich2);
		{$I+}   {Actica el control de errores}
		IF IORESULT = 0 THEN
		BEGIN
			close(fich2);
			erase(fich2);
		END;
	END;
	assign(fich, ruta);
	{$I-}   {Desactica el control de errores}
	reset(fich);
	{$I+}   {Actica el control de errores}
	IF IORESULT= 0 THEN   {IORESULT almacena el n£mero de fallos en el tiempo que estaba desactivado el cotrol}
	BEGIN
		tablero;
		crearconjuntovacio(conjunto);
		Generador(50,conjunto);
		tablero;
		elem:=0;
		WHILE NOT EOF(fich) DO {COLOREA TODOS DE VERDE}
		BEGIN
			IF (l=filesize(fich)-2) AND (elem<>0) THEN
				b:=elem;
			IF l=filesize(fich)-1 THEN
				a:=elem;
			seek(fich, l);
			read(fich,elem);
			tachar(elem,2);
			eliminar(elem,conjunto);

			l:=l+1;
		END;
		colores(elem,a,b);
		close(fich);
		instrucciones;
		rename(fich,'save.tmp');
		readln;
		sorteo(conjunto,a,b,fin);
	END
	ELSE
	BEGIN
	fin:=FALSE;
	write('SE HA PROCUCIDO UN ERROR AL CARGAR EL ARCHIVO...');
	readln;
	END;
END;

PROCEDURE guardar(VAR save:TFileElem);
VAR
	rut,rut2:string;
BEGIN
	window(1,1,80,25);
	textbackground(0);
	clrscr;
	logo;
	Window(26,7,54,7);
	TextColor(11);
	TextBackground(1);
	write('#######    GUARDAR   #######');
	Window(12,10,80,25);
	TextBackGround(0);
	gotoXY(43,16);
	TextColor(8);
	write(chr(184),'2012 TurboBingo Unlimited');
	Window(12,10,80,25);
	TextBackGround(0);
	TextColor(7);
	assign(save,'save.tmp');
	Write('Introduce un nombre para el fichero: ');
	readln(rut);
	rut:=rut +'.sav';
	{$I-}   {Desactica el control de errores}
	rename(save,rut);
	{$I+}   {Actica el control de errores}
	IF IORESULT=5 THEN{ ARCHIVO REPETIDO}
	BEGIN
		REPEAT
			writeln('El archivo "',rut,'" ya existe.');
			write('Por favor, escoja otro nombre: ');
			readln(rut2);
			rut2:=rut2 +'.sav';
		UNTIL rut<>rut2;
		rename(save,rut2);
	END;
	gotoxy(1,12);
	write('Pulsa ');
	TextColor(15);
	write('[ENTER]');
	TextColor(7);
	write(' para continuar ... ');
	readln;
END;

end.
