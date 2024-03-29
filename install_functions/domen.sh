domen_connect() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
	(
		echo $passwd | sudo -S apt install astra-winbind -y
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Пакет успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
	) | zenity --progress --pulsate --title "Загрузка пакета" --text="Подождите, идет загрузка..." --auto-close
		
	# Установка пакета
	zenity --auto-close &
	(
		# Установка пакета с использованием sudo и передачей пароля через stdin
		echo $passwd | sudo -S astra-winbind -dc master.aviales.local -u tornado -p torsys -y
		# Получение кода завершения установки
		exit_code=$?
		# Проверка кода завершения и отображение соответствующего сообщения
		if [ $exit_code -eq 0 ]; then
			zenity --info --title="Успех" --height=160 --width=250 --text="Клиент успешно присоединился к домену. Необходимо перезагрузить ПК."
		else
			zenity --error --title="Ошибка" --text="Ошибка при присоединении к домену!."
		fi
	) | zenity --progress --pulsate --title "Загрузка"  --height=130 --width=250 --text="Пытаюсь присоединиться в домен..." --auto-close
}