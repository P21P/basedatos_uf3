!#/bin/bash

clear

echo"Esto es el gestor de Among Meme"
echo"==============================="

echo"¿Que quieres hacer?"
echo"-------------------"

echo"1.-Mostrar Personajes"
echo"2.-Mostrar Inventario de un Personaje"
echo"3.-Crear Personaje"
echo"4.-Crear Item"
echo"5.-Dar Item a Personaje"
echo"Q.-Salir"

read RESPUESTA

if [ "$RESPUESTA" == "1" ]; then
	echo"Personajes:"
	echo "select id_character, name from characters" | $MYSQL
elif 
