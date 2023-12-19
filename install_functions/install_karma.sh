install_app_karma() {
	file_path="/usr/share/applications/rudesktop123.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		echo $passwd | sudo -S apt install libmicrohttpd12 ca-certificates -y
		file1="/home/$USER/Desktop/carma-capilite.deb"
		file2="/home/$USER/Desktop/carma-common.deb"
		file3="/home/$USER/Desktop/carma-dev.deb"
		zenity --auto-close &
		(
			wget https://slepsov.ru/aitekinfo/KARMA/carma-capilite.deb -P /home/$USER/Desktop/
			wget https://slepsov.ru/aitekinfo/KARMA/carma-common.deb -P /home/$USER/Desktop/
			wget https://slepsov.ru/aitekinfo/KARMA/carma-dev.deb -P /home/$USER/Desktop/
	
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
			echo $passwd | sudo -S dpkg -i /home/$USER/Desktop/carma-common.deb /home/$USER/Desktop/carma-dev.deb /home/$USER/Desktop/carma-capilite.deb
			# Получение кода завершения установки
			exit_code=$?
			# Проверка кода завершения и отображение соответствующего сообщения
			if [ $exit_code -eq 0 ]; then
				zenity --info --title="Успех" --text="Пакет успешно установлен!"
				cp $file_path /home/$USER/Desktop
			else
				zenity --error --title="Ошибка" --text="Ошибка при установке пакета."
			fi
		) | zenity --progress --pulsate --title "Установка пакета" --text="Подождите, идет установка..." --auto-close
		
		echo $passwd | sudo -S export PATH="$(/bin/ls -d /opt/cprocsp/{s,}bin/*|tr '\n' ':')$PATH"
		Проверка наличия файла перед удалением
		if [ -e "$file1" ]; then
			rm "$file1"
		fi
		
		if [ -e "$file2" ]; then
			rm "$file2"
		fi
		
		if [ -e "$file3" ]; then
			rm "$file3"
		fi
	fi
}