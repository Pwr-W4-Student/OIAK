Opis programu: 
	Program oblicza wartosc ciagu fibonaciego dla liczby wyrazow przypisanych do len, aktualnie jest to 13.
	Program operuje tylko na rejestrach, nie wyswietla obliczonej wartosci. Wynik przechowywany jest w rejestrze edx.
	aby zobaczyc wynik obliczenien nalezy uzyc gdb oraz ustawic break point np w lini 26 (polecenie: b 26), nastepnie wyswietlic 		zawartosc rejestrow poleceniem: i reg podczas kazdego przejscia przez petle. Gdy rejestr edi w roli licznika przekroczy len 		program zakonczy dzialanie.

Uruchamienie: 
	skompilowac program poleceniem make, nastepnie nalezy uzyc gdb(polecenie: gdb source) w celu wyswietlenia zawartosci rejestrow
