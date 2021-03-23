!#/bin/bash

clear

echo"Esto es el gestor de Among Meme"
echo"==============================="

echo"¿Que quieres hacer?"
echo"-------------------"

echo"1.Mostrar Personajes"
echo"2.Mostrar Inventario de un Personaje"
echo"3.Crear Personaje"
echo"4.Crear Item"
echo"5.Dar Item a Personaje"
echo"6.Eliminar Item"
echo"7.Eliminar Personaje"
echo"8.Mostrar Items"
echo"Q.Salir"

read RESPUESTA

if [ "$RESPUESTA" == "1" ]; then
	echo"Personajes:"
	echo"select id_character, name from characters" | $MYSQL
elif [ "$RESPUESTA" == "2"]; then
	echo"Inventario de que personaje?"
	read PERSONAJE
	if [ "$PERSONAJE" == "" ]; then
		echo "NO has introducido ningun nombre"
		exit 1
	fi
	echo "select * from view_char_items where id_character=$PERSONAJE" | $MYSQL | cut -f 4

elif [ "$RESPUESTA" == "3" ]; then
	echo"Inserción de personaje"
	echo"======================"

	echo -n "Nombre"
	read NOMBRE

	echo -n "Edad: "
	read EDAD

	echo -n "HP"
	read HP

	echo -n "Género"
	read GENDER

	echo -n "Estilo"
	read STYLE

	echo -n "Mana"
	read MANA

	echo -n "Classe"
	read CLASS

	echo -n "Raza"
	read RACE

	echo -n "XP"
	read XP

	echo -n "Nivel"
	read `LEVEL`

	echo -n "Height"
	read HEIGHT

	QUERY="INSERT INTO characters (name,age,hp,gender,style,mana,class,race,xp,level,height)"
	QUERY="$QUERY VALUES ('$NOMBRE', $EDAD, $HP, '$GENDER', '$STYLE', $MANA, '$CLASS', '$RACE', $XP, $LEVEL, $HEIGHT)"
	echo $QUERY | mysql -u gestor amongmeme

elif [ "$RESPUESTA" == "5" ]; then
	echo "¿Qué personaje quieres usar? (id_character)"
	read ID_CHARACTER

	echo "¿Qué item quieres darle? (id_item)"
	read ID_ITEM

	QUERY= "INSERT INTO characters_items (id_characters, id_item)"
	QUERY= "$QUERY VALUES($ID_CHARACTERS, $ID_ITEM)";

	echo $QUERY | mysql -u gestor amongmeme
