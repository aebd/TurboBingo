unit uSonido;
interface
USES MMSystem,uElem;

	PROCEDURE Play(sonido_bola:TElemento);

implementation
	PROCEDURE Play(sonido_bola:TElemento);
	BEGIN
		CASE sonido_bola OF
 			1:PlaySound('Sonidos/01.wav',0,0);
			2:PlaySound('Sonidos/02.wav',0,0);
			3:PlaySound('Sonidos/03.wav',0,0);
			4:PlaySound('Sonidos/04.wav',0,0);
			5:PlaySound('Sonidos/05.wav',0,0);
			6:PlaySound('Sonidos/06.wav',0,0);
			7:PlaySound('Sonidos/07.wav',0,0);
			8:PlaySound('Sonidos/08.wav',0,0);
			9:PlaySound('Sonidos/09.wav',0,0);
			10:PlaySound('Sonidos/10.wav',0,0);
			11:PlaySound('Sonidos/11.wav',0,0);
			12:PlaySound('Sonidos/12.wav',0,0);
			13:PlaySound('Sonidos/13.wav',0,0);
			14:PlaySound('Sonidos/14.wav',0,0);
			15:PlaySound('Sonidos/15.wav',0,0);
			16:PlaySound('Sonidos/16.wav',0,0);
			17:PlaySound('Sonidos/17.wav',0,0);
			18:PlaySound('Sonidos/18.wav',0,0);
			19:PlaySound('Sonidos/19.wav',0,0);
			20:PlaySound('Sonidos/20.wav',0,0);
			21:PlaySound('Sonidos/21.wav',0,0);
			22:PlaySound('Sonidos/22.wav',0,0);
			23:PlaySound('Sonidos/23.wav',0,0);
			24:PlaySound('Sonidos/24.wav',0,0);
			25:PlaySound('Sonidos/25.wav',0,0);
			26:PlaySound('Sonidos/26.wav',0,0);
			27:PlaySound('Sonidos/27.wav',0,0);
			28:PlaySound('Sonidos/28.wav',0,0);
			29:PlaySound('Sonidos/29.wav',0,0);
			30:PlaySound('Sonidos/30.wav',0,0);
			31:PlaySound('Sonidos/31.wav',0,0);
			32:PlaySound('Sonidos/32.wav',0,0);
			33:PlaySound('Sonidos/33.wav',0,0);
			34:PlaySound('Sonidos/34.wav',0,0);
			35:PlaySound('Sonidos/35.wav',0,0);
			36:PlaySound('Sonidos/36.wav',0,0);
			37:PlaySound('Sonidos/37.wav',0,0);
			38:PlaySound('Sonidos/38.wav',0,0);
			39:PlaySound('Sonidos/39.wav',0,0);
			40:PlaySound('Sonidos/40.wav',0,0);
			41:PlaySound('Sonidos/41.wav',0,0);
			42:PlaySound('Sonidos/42.wav',0,0);
			43:PlaySound('Sonidos/43.wav',0,0);
			44:PlaySound('Sonidos/44.wav',0,0);
			45:PlaySound('Sonidos/45.wav',0,0);
			46:PlaySound('Sonidos/46.wav',0,0);
			47:PlaySound('Sonidos/47.wav',0,0);
			48:PlaySound('Sonidos/48.wav',0,0);
			49:PlaySound('Sonidos/49.wav',0,0);
			50:PlaySound('Sonidos/50.wav',0,0);

		END;
	END;



end.
