#!/bin/bash

# Nome della cartella
folder=/home/pi/da_stampare

# Stampa tutti i file nella cartella
for file in $folder/*
do
  lpr $file
done

rm -rf $folder/*