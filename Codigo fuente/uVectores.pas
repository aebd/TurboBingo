unit uVectores;
interface
USES uElem;
	TYPE
		TVector=array[1..3] OF TElemento;

PROCEDURE Ordenar(VAR vector:TVector);

implementation

PROCEDURE Ordenar(VAR vector:TVector);
	VAR
		i,j:integer;
		aux:TElemento;
	BEGIN
		FOR i:=3 DOWNTO succ(1) DO
			FOR j:=1 TO pred(i) DO
				IF (vector[j] > vector[succ(j)]) THEN
				BEGIN
					aux:=vector[j];
					vector[j]:=vector[succ(j)];
					vector[succ(j)]:=aux;
				END;
	END;
end.
