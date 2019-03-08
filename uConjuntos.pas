unit uConjuntos;
interface
USES uElem;
	TYPE
		TConjunto=^TNodo;
		TNodo=RECORD
			info:TElemento;
			sig:TConjunto;
		END;
	FUNCTION Elegir(conjunto:TConjunto):TElemento;
	PROCEDURE Insertar(elem:TElemento;VAR Conjunto:TConjunto);
	FUNCTION Mayor(Conjunto:TConjunto):TElemento;
	PROCEDURE Siguiente(VAR conjunto:TConjunto);
	PROCEDURE CrearConjuntoVacio(VAR conjunto:TConjunto);
	FUNCTION EsConjuntoVacio(conjunto:TConjunto):boolean;
	PROCEDURE Poner(elem:TElemento; VAR conjunto:TConjunto);
	PROCEDURE MostrarConjunto(conjunto:TConjunto);
	PROCEDURE Generador(n:longint; VAR conjunto:TConjunto);
	FUNCTION Menor(VAR conjunto:TConjunto):longint;
	PROCEDURE Eliminar(elem:TElemento; VAR conjunto:TConjunto);
	PROCEDURE EliminarMultiplos(n:longint;VAR conjunto:TConjunto);
	FUNCTION CardinalConjunto(conjunto:TConjunto):longint;

implementation
	PROCEDURE CrearConjuntoVacio(VAR conjunto:TConjunto);
		BEGIN
		conjunto:=NIL;
	END;

	FUNCTION EsConjuntoVacio(conjunto:TConjunto):boolean;
		BEGIN
		EsConjuntoVacio:=(conjunto=NIL);
	END;

	PROCEDURE Poner(elem:TElemento; VAR conjunto:TConjunto);
		VAR
			aux:TConjunto;
		BEGIN
			new(aux);
			aux^.info:=elem;
			aux^.sig:=conjunto;
			conjunto:=aux;
	END;

	PROCEDURE MostrarConjunto(conjunto:TConjunto);
		VAR
			aux:TConjunto;
		BEGIN
			aux:=conjunto;
			WHILE aux<>NIL DO BEGIN
				write(aux^.info, ' ');
				aux:=aux^.sig;
			END;
			writeln;
	END;

	PROCEDURE Generador(n:longint; VAR conjunto:TConjunto);
		VAR
			i:longint;
		BEGIN
			FOR i:=n DOWNTO 1 DO BEGIN
				Poner(i,conjunto);
			END;
	END;

	FUNCTION Menor(VAR conjunto:TConjunto):longint;
	BEGIN
		Menor:=conjunto^.info;
	END;

	PROCEDURE Eliminar(elem:TElemento; VAR conjunto:TConjunto);
		VAR
			aux,aux2:TConjunto;
			i:longint;
		BEGIN
			aux:=conjunto;
			i:=1;
			WHILE (aux^.info<>elem) AND (i=1) DO BEGIN
				IF aux^.sig<>NIL THEN
					BEGIN
					aux2:=aux;
					aux:=aux^.sig;
					END
				ELSE
					i:=0;
			END;
			IF i<>0 THEN
				BEGIN
					IF (aux=conjunto) THEN
						BEGIN
						aux2:=conjunto;
						conjunto:=aux^.sig;
						dispose(aux2);
						END
					ELSE
						BEGIN
						aux2^.sig:=aux^.sig;
						dispose(aux);
						END;
				END;
		END;

	PROCEDURE EliminarMultiplos(n:longint;VAR conjunto:TConjunto);
		VAR
			i:longint;
			j:TElemento;
		BEGIN
			i:=1;
			j:=Mayor(conjunto);
			WHILE NOT EsConjuntoVacio(conjunto) AND (i<j) DO BEGIN
				i:=i+1;
				IF (i MOD n)=0 THEN
					Eliminar(i,conjunto);
			END;
	END;

	FUNCTION CardinalConjunto(conjunto:TConjunto):longint;
		VAR
			longitud:longint;
			aux:TConjunto;
		BEGIN
			longitud:=0;
			aux:=conjunto;
			WHILE NOT EsConjuntoVacio(aux) DO BEGIN
				longitud:=longitud+1;
				Siguiente(aux);
			END;
			CardinalConjunto:=longitud;
	END;

		PROCEDURE Siguiente(VAR conjunto:TConjunto);
		BEGIN
			conjunto:=conjunto^.sig;
		END;

	FUNCTION Mayor(Conjunto:TConjunto):TElemento;
	VAR
		aux:Tconjunto;
	BEGIN
		aux:=conjunto^.sig;
		WHILE NOT EsConjuntoVacio(aux) DO BEGIN
			Siguiente(conjunto);
			aux:=conjunto^.sig;
		END;
		Mayor:=Conjunto^.info;
	END;

	PROCEDURE Insertar(elem:TElemento;VAR Conjunto:TConjunto);
	VAR
	aux,aux2:TConjunto;
	BEGIN
	IF EsconjuntoVacio(conjunto) THEN
		poner(elem,conjunto)
	ELSE
	BEGIN
		new(aux);
		aux^.sig:=NIL;
		aux^.info:=elem;
		aux2:=conjunto;
		WHILE aux2^.sig<>NIL DO BEGIN
			aux2:=aux2^.sig;
		END;
		aux2^.sig:=aux;
	END;
	END;

	FUNCTION Elegir(conjunto:TConjunto):TElemento;
	VAR
		aux:TConjunto;
		i:TElemento;
	BEGIN
		aux:=conjunto;
		FOR i:=0 TO random(CardinalConjunto(conjunto))-1 DO
			aux:=aux^.sig;
		Elegir:=aux^.info;
	END;

BEGIN randomize;
end.
