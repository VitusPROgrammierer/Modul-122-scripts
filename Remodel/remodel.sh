#!/bin/bash
#
# Name: remodel.sh
# -----------------
# SYNOPSIS: remodel.sh [file1] [file2]
# Description: Filtert das SQL-Dokument durch und gibt die wichtigsten Informationen aus, aus dem SQL-Dokument zurück.
#
# remodel.sh file1 file2
# file1: Ist das input SQL-Dokument
# file2: Ist das output Text-Dokument
#
# Autor: Vitus Lindemann
# Datum: 06.10.2021

input=$1
output=$2

# Schaut ob die Nummer zwischen 0 - 2 ist.
awk '$1 ~ /^[0-2]$/ '  "$input"   | \
# Schaut ob der Text zwischen 0 - 25 ist.
awk '$2 ~ /^[0-25]$/'             | \
# Gibt Spalte 2 und 4 zurück.
awk -F"'" '{print $2,"     ",$4}' | \
# Nur die Hauptnummer wird gefiltert.
awk 'length($1)==7' > "$output"
