install_app_wps() {
	file_path="/usr/share/applications/wps-office-prometheus.desktop"
	local check_code=0
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/wps-office.deb"
		zenity --auto-close &
		(
			wget http://easyastra.ru/store/wps-office.deb -P /home/$USER/Desktop/
			# Проверка кода завершения wget
			if [ $? -eq 0 ]; then
				zenity --info --title="Успех" --text="Файл успешно загружен!"
			else
				zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
				check_code=1
				exit 1
			fi
		) | zenity --progress --pulsate --title "Загрузка пакета" --text="Подождите, идет загрузка..." --auto-close
		
		# Установка пакета
		if [ $check_code -eq 0 ]; then
			zenity --auto-close &
				(
					# Установка пакета с использованием sudo и передачей пароля через stdin
					echo $passwd | sudo -Ss apt install "$file" -y -q
					# Получение кода завершения установки
					exit_code=$?
					# Проверка кода завершения и отображение соответствующего сообщения
					if [ $exit_code -eq 0 ]; then
						zenity --info --title="Успех" --text="Пакет успешно установлен!"
						#cp $file_path /home/$USER/Desktop
					else
						zenity --error --title="Ошибка" --text="Ошибка при установке пакета."
					fi
				) | zenity --progress --pulsate --title "У
				становка пакета" --text="Подождите, идет установка..." --auto-close
		fi
		# Проверка наличия файла перед удалением
		if [ -e $file ]; then
			rm $file
		fi
	fi
}