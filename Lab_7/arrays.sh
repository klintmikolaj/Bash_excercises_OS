#!/bin/bash

#7.0

babelkowe() {

	tablica=("$@")
	rozmiar=$#
	
	for (( i = 0; i < rozmiar-1; i++ )); do
		for (( j = 0; j < rozmiar-i-1; j++)); do
			if (( ${tablica[j]} > ${tablica[j+1]} )); then
				zamianka=${tablica[j]}
				tablica[j]=${tablica[j+1]}
				tablica[j+1]=$zamianka
			fi
		done
	done
	
	echo "${tablica[@]}"
}

#7.1

tabliczka() {

	wiersze=$1
	kolumny=$2
	
	#sprawdzenie czy 2 argumenty
	if ! [[ $# -eq 2 ]]; then
		echo "Niepoprawna liczba argumentow"
		exit -1
	fi
	
	#sprawdzenie czy dodatnie calkowite dla dwoch argumentow
	if ! [[ $1 =~ ^[1-9][0-9]*? && $1 -gt 0 && $2 =~ ^[1-9][0-9]*? && $2 -gt 0 ]]; then
		echo "Niepoprawne argumenty"
		exit -1
	fi
	
	declare -A tabliczka
	tabliczka=()
	
	for (( i=1; i<=wiersze; i++ )); do
		for (( j=1; j<=kolumny; j++ )); do
			tabliczka[$i,$j]=$((i*j))
			echo -n "${tabliczka[$i,$j]}      " #spacje dla oddzielenia kolumn
		done
		#spacje dla oddzielenia wierszy
		echo
	done

}

echo "Tabliczka mnozenia:"
#tabliczka $@
echo

#7.2

calkowanie() {
	#sprawdzenie czy przynajmniej 2 argumenty
	if ! [[ $# -ge 2 ]]; then
		echo "Niepoprawna liczba argumentow"
		exit -1
	fi
	
	suma=0
	#wyrzucenie pierwszego argumentu z listy
	poprzedni=$1; shift
	
	for nastepny in $@; do
		#bez mnozenia przez h, bo h = 1
		suma=$( bc -l <<< "$suma + ( $poprzedni + $nastepny ) / 2" )
		poprzedni=$nastepny
	done
	
	echo $suma
}

echo "Sortowanie babelkowe:"
#babelkowe $@
echo
echo "Tabliczka mnozenia:"
tabliczka $@
echo
echo "Calkowanie metoda trapezow:"
#calkowanie $@
echo


