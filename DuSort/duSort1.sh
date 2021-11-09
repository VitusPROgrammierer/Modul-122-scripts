#!/bin/bash
#
# Name: duSort1.sh - Zeigt die Grösse aller Dateien und Verzeichnisse.
# -----------------
# SYNOPSIS: duSort1.sh
# Description: Zeigt die Grösse aller Dateien und Verzeichnisse im aktuellem Verzeichniss.
#
# duSort1.sh
#
# Autor: Vitus Lindemann
# Datum: 06.11.2021

du -a -h --max-depth=1 | sort -hr
