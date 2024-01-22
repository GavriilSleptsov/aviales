#!/bin/bash

connect_network_folders () {
	#!/bin/bash

	# Показываем диалоговое окно с чекбоксами
	selected_options=$(zenity --list --checklist \
		--title="Выберите сетевые папки" \
		--text="Выберите нужные сетевые папки, которые нужно подключить:" \
		--column="Выбрать" --column="Сетевая папка" \
		FALSE "sharetest" \
		FALSE "folders" \
		FALSE "gto" \
		--separator=":" \
		--width=500 --height=400);

	# Проверяем, были ли выбраны какие-либо опции
	if [ -n "$selected_options" ]; then
	# Преобразуем строку с выбранными опциями в массив
	IFS=':' read -ra options_array <<< "$selected_options"

	# Обрабатываем каждую выбранную опцию
	for option in "${options_array[@]}"; do
		case $option in
			"sharetest")
				echo "Выбрана Опция 1"
				;;
			"folders")
				echo "Выбрана Опция 2"
				;;
			"gto")
				echo "Выбрана Опция 3"
				;;
			*)
				# Обработка для других опций (если есть)
				;;
		esac
	done
	else
	# Если ничего не выбрано
		echo "Вы не выбрали ни одной опции."
	fi
}