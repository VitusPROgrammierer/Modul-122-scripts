#!/bin/bash
#
# Name: duSort2.sh - Zeigt die Grösse aller Dateien und Verzeichnisse an und sortiert sie der Grösse nach.
# -----------------
# SYNOPSIS: duSort2.sh
# Description: Zeigt die Grösse aller Dateien und Verzeichnisse im aktuellem Verzeichniss an und sortiert sie der Grösse nach.
#
# duSort2.sh
#
# Autor: Vitus Lindemann
# Datum: 06.10.2021

du -a | sort $1

total=$(du -c | grep total | cut -f -1)

echo "$total"
