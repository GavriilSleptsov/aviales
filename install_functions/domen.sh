domen_connect() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
	(
		echo $passwd | sudo apt install astra-winbind -y
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файл успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
	) | zenity --progress --pulsate --title "Загрузка пакета" --text="Подождите, идет загрузка..." --auto-close
		
	# Установка пакета
	zenity --auto-close &
	(
		# Установка пакета с использованием sudo и передачей пароля через stdin
		echo $passwd | sudo -S astra-winbind -dc srv1.svfu.ru -u admin -p P@ssw0rd -y
		# Получение кода завершения установки
		exit_code=$?
		# Проверка кода завершения и отображение соответствующего сообщения
		if [ $exit_code -eq 0 ]; then
			zenity --info --title="Успех" --text="Пакет успешно установлен! НЕОБХОДИМО ПЕРЕЗАГРУЗИТЬ ПК!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при установке пакета!."
		fi
	) | zenity --progress --pulsate --title "Загрузка" --text="Пытаюсь присоединиться в домен..." --auto-close
}