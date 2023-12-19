download_cryptopro() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
		(
		wget https://slepsov.ru/aitekinfo/Cryptopro/crypto_11455.tgz -P /home/$USER/Desktop/
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файл успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
		) | zenity --progress --pulsate --title "Загрузка КриптоПро 5" --text="Подождите, идет загрузка..." --auto-close
}

install_cades() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
	(
		wget https://slepsov.ru/aitekinfo/Cryptopro/cprocsp-pki-cades-64_2.0.14892-1_amd64.deb -P /home/$USER/Desktop/
		wget https://slepsov.ru/aitekinfo/Cryptopro/cprocsp-pki-phpcades_2.0.14892-1_all.deb -P /home/$USER/Desktop/
		wget https://slepsov.ru/aitekinfo/Cryptopro/cprocsp-pki-plugin-64_2.0.14892-1_amd64.deb -P /home/$USER/Desktop/
		
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файлы успешно загружены!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файлов."
			exit 1
		fi
	) | zenity --progress --pulsate --title "Загрузка файлов" --text="Подождите, идет загрузка..." --auto-close
		
	# Установка пакета
	zenity --auto-close &
	(
		# Установка пакета с использованием sudo и передачей пароля через stdin
		echo $passwd | sudo -S dpkg -i /home/$USER/Desktop/cprocsp-pki-cades-64_2.0.14892-1_amd64.deb /home/$USER/Desktop/cprocsp-pki-phpcades_2.0.14892-1_all.deb /home/$USER/Desktop/cprocsp-pki-plugin-64_2.0.14892-1_amd64.deb -y
		# Получение кода завершения установки
		exit_code=$?
		# Проверка кода завершения и отображение соответствующего сообщения
		if [ $exit_code -eq 0 ]; then
			zenity --info --title="Успех" --text="Пакеты успешно установлены!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при установке пакетов."
		fi
	) | zenity --progress --pulsate --title "Установка пакетов" --text="Подождите, идет установка..." --auto-close
	rm /home/$USER/Desktop/cprocsp-pki-cades-64_2.0.14892-1_amd64.deb 
	rm /home/$USER/Desktop/cprocsp-pki-phpcades_2.0.14892-1_all.deb 
	rm /home/$USER/Desktop/cprocsp-pki-plugin-64_2.0.14892-1_amd64.deb 
}

install_ifc() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
	(
		wget https://slepsov.ru/aitekinfo/Cryptopro/IFCPlugin-x86_64.deb -P /home/$USER/Desktop/	
		
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файл успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
	) | zenity --progress --pulsate --title "Загрузка файлов" --text="Подождите, идет загрузка..." --auto-close
		
	# Установка пакета
	zenity --auto-close &
	(
		# Установка пакета с использованием sudo и передачей пароля через stdin
		echo $passwd | sudo -S dpkg -i /home/$USER/Desktop/IFCPlugin-x86_64.deb
		# Получение кода завершения установки
		exit_code=$?
		# Проверка кода завершения и отображение соответствующего сообщения
		if [ $exit_code -eq 0 ]; then
			zenity --info --title="Успех" --text="Пакет успешно установлен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при установке пакета!."
		fi
	) | zenity --progress --pulsate --title "Установка пакетов" --text="Подождите, идет установка..." --auto-close
	rm /home/$USER/Desktop/IFCPlugin-x86_64.deb
}