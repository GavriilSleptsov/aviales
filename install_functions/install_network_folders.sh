#!/bin/bash

connect_network_folders () {
	#!/bin/bash

	# Показываем диалоговое окно с чекбоксами
	selected_options=$(zenity --list --checklist \
							--title="Выберите опции" \
							--text="Выберите нужные опции:" \
							--column="Выбрать" --column="Опция" \
							FALSE "Опция 1" \
							FALSE "Опция 2" \
							FALSE "Опция 3" \
							--separator=":");

	# Проверяем, были ли выбраны какие-либо опции
	if [ -n "$selected_options" ]; then
    # Преобразуем строку с выбранными опциями в массив
    IFS=':' read -ra options_array <<< "$selected_options"

    # Обрабатываем каждую выбранную опцию
	for option in "${options_array[@]}"; do
        case $option in
            "Опция 1")
                # Обработка для опции 1
                echo "Выбрана Опция 1"
                ;;
            "Опция 2")
                # Обработка для опции 2
                echo "Выбрана Опция 2"
                ;;
            "Опция 3")
                # Обработка для опции 3
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