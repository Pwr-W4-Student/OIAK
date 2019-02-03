Opis programu:
	Program liczy ciag fibonaciego dla liczb 1024 bitowych
	Do zmiennej 'wyraz' w sekcji data przypisany jest nr wyrazu ciagu dla ktorego
	ma policzyc wartosc. W obecnej wersji program liczy wartosc dla 30 wyrazu ciagu
	Program przechowuje wartosc wyrazu ciagu w zmiennej 'liczba2'
	w konwencji little-endian. Rejestr %edi przechowuje aktualny wyraz ciagu.  
	w zmiennej liczba1 zapisany jest przedostatni wyraz.

Uruchamienie: 
	make	 kompiluje program do wersji 32 bitowej i uruchamia go

	Aby sprawdzic wartosc ciagu nalezy uruchomic program w gdb (gdb source)
	nastepnie jezeli chcemy zobaczyc wyraz ciagu o numerze zadeklarowanym w 'wyraz'
	nalezy ustawic breakpointa w 70 lini (b 70) uruchomic program i zobaczyc zawartosc 
	zmiennej liczba2 (x /128xb &liczba2)
	jezeli chcemy sledzic kolejne wyrazy ciagu nalezy ustawic breakpointa w lini 66
	(b 66) oraz z kazdym przejsciem programu (c) wyswietlac zawartosc zmiennej liczba2
	(x /128xb &liczba2). Jezeli licznik %edi dojdzie do 30 wyrazu ciagu program 
	zakonczy dzialanie.

