############### ----- 1С ----- ###############
download_one_c_first() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
		(
		wget https://slepsov.ru/aitekinfo/1C/1c-enterprise83-thin-client_8.3.17-2760_amd64.deb -P /home/$USER/Desktop/
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файл успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
		) | zenity --progress --pulsate --title "Загрузка файла" --text="Подождите, идет загрузка..." --auto-close
}

download_one_c_second() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
		(
		wget https://slepsov.ru/aitekinfo/1C/thin.client_8_3_17_1851.deb64.tar.gz -P /home/$USER/Desktop/
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файл успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
		) | zenity --progress --pulsate --title "Загрузка файла" --text="Подождите, идет загрузка..." --auto-close
}

download_one_c_three() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
		(
		wget https://slepsov.ru/aitekinfo/1C/thin.client_8_3_17_2256.deb64.tar.gz -P /home/$USER/Desktop/
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файл успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
		) | zenity --progress --pulsate --title "Загрузка файла" --text="Подождите, идет загрузка..." --auto-close
}

download_one_c_four() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
		(
		wget https://slepsov.ru/aitekinfo/1C/thin.client_8_3_22_2283.deb64.tar.gz -P /home/$USER/Desktop/
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файл успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
		) | zenity --progress --pulsate --title "Загрузка файла" --text="Подождите, идет загрузка..." --auto-close
}

############### ----- KARMA ----- ###############
install_app_karma() {
	file_path="/usr/share/applications/carma.desktop"
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

############### ----- МойОфис 2.7.0 ----- ###############
install_app_myoffice() {
	file_path="/usr/share/applications/myoffice-text.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/myoffice-standard-documents_2.7.0_amd64.deb"

		zenity --auto-close &
		(
			wget https://slepsov.ru/aitekinfo/myoffice-standard-documents_2.7.0_amd64.deb -P /home/$USER/Desktop/
			
			# Проверка кода завершения wget
			if [ $? -eq 0 ]; then
				zenity --info --title="Успех" --text="Файл успешно загружен!"
			else
				zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
				exit 1
			fi
		) | zenity --progress --pulsate --title "Загрука пакета" --text="Подождите, идет загрука..." --auto-close
		
		# Установка пакета
		zenity --auto-close &
		(
			# Установка пакета с использованием sudo и передачей пароля через stdin
			echo $passwd | sudo -S apt install "$file" -y
			# Получение кода завершения установки
			exit_code=$?
			# Проверка кода завершения и отображение соответствующего сообщения
			if [ $exit_code -eq 0 ]; then
				zenity --info --title="Успех" --text="Пакет успешно установлен!"
			else
				zenity --error --title="Ошибка" --text="Ошибка при установке пакета."
			fi
		) | zenity --progress --pulsate --title "Установка пакета" --text="Подождите, идет установка..." --auto-close

		rm "$file"
	fi
}

############### ----- NAPS ----- ###############
install_app_naps() {
	file_path="/usr/share/applications/naps2.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/naps2-7.2.1.deb"
		zenity --auto-close &
		(
			wget https://slepsov.ru/aitekinfo/naps2-7.2.1.deb -P /home/$USER/Desktop/
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
			echo $passwd | sudo -S apt install "$file" -y
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
		# Проверка наличия файла перед удалением
		if [ -e "$file" ]; then
			rm "$file"
		fi
	fi
}

############### ----- REMMINA ----- ###############
install_app_remmina() {
	file_path="/usr/share/applications/org.remmina.Remmina.desktop"
	if [ -e "$file_path" ]; then
		zenity --info --text="Пакет уже установлен!"
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		# Установка пакета с указанием прогресса
		zenity --auto-close &
		(
		# Установка пакета с использованием sudo и передачей пароля через stdin
		echo $passwd | sudo -S apt install remmina -y
		# Получение кода завершения установки
		exit_code=$?
		# Проверка кода завершения и отображение соответствующего сообщения
			if [ $exit_code -eq 0 ]; then
				zenity --info --title="Успех" --text="Пакет успешно установлен!"
				cp $file_path /home/$USER/Desktop
			else
				zenity --error --title="Ошибка" --text="Ошибка при установке пакета."
			fi
		) | zenity --progress --pulsate --title "Установка пакета" --text="Подождите, идет установка пакета..." --auto-close
	fi
}

############### ----- RuDesktop ----- ###############
install_app_rudesktop() {
	file_path="/usr/share/applications/rudesktop.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/rudesktop.deb"
		zenity --auto-close &
		(
			wget https://slepsov.ru/aitekinfo/rudesktop.deb -P /home/$USER/Desktop/
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
			echo $passwd | sudo -S apt install "$file" -y
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
		# Проверка наличия файла перед удалением
		if [ -e "$file" ]; then
			rm "$file"
		fi
	fi
}

############### ----- SabyPlugin ----- ###############
install_app_saby_plugin() {
	file_path="/usr/share/applications/Sbis3Plugin.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/sabyapps-setup"
		zenity --auto-close &
		(
			wget https://slepsov.ru/aitekinfo/sabyapps-setup -P /home/$USER/Desktop/
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
			echo $passwd | sudo -S chmod +x /home/$USER/Desktop/sabyapps-setup
			fly-term -e "sudo /home/$USER/Desktop/sabyapps-setup"
			# Получение кода завершения установки
			exit_code=$?
			# Проверка кода завершения и отображение соответствующего сообщения
			zenity --info --title="Успех" --text="Пакет успешно установлен!"
			cp $file_path /home/$USER/Desktop
		) | zenity --progress --pulsate --title "Установка пакета" --text="Подождите, идет установка..." --auto-close
		# Проверка наличия файла перед удалением
		if [ -e "$file" ]; then
			rm "$file"
		fi
	fi
}

############### ----- SimpleScreenRecorder ----- ###############
install_app_scr() {
	file_path="/usr/share/applications/simplescreenrecorder.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		# Установка пакета с указанием прогресса
		zenity --auto-close &
		(
		# Установка пакета с использованием sudo и передачей пароля через stdin
		echo $passwd | sudo -S apt install simplescreenrecorder -y
		# Получение кода завершения установки
		exit_code=$?
		# Проверка кода завершения и отображение соответствующего сообщения
			if [ $exit_code -eq 0 ]; then
				zenity --info --title="Успех" --text="Пакет успешно установлен!"
				cp $file_path /home/$USER/Desktop
			else
				zenity --error --title="Ошибка" --text="Ошибка при установке пакета."
			fi
		) | zenity --progress --pulsate --title "Установка пакета" --text="Подождите, идет установка пакета..." --auto-close
	fi
}

############### ----- Telegram ----- ###############
install_app_telegram() {
	file_path="/usr/share/applications/telegram.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/telegram.deb"
		zenity --auto-close &
		(
			wget http://easyastra.ru/store/telegram.deb -P /home/$USER/Desktop/
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
			echo $passwd | sudo -S apt install "$file" -y
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
		# Проверка наличия файла перед удалением
		if [ -e "$file" ]; then
			rm "$file"
		fi
	fi
}

############### ----- VipNet ----- ###############
install_vipnet() {
	file_path="/usr/share/applications/ViPNet.desktop"
	if [ -e "$file_path" ]; then
		zenity --info --text="Пакет уже установлен!"
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/vipnet_4.15.0.deb"
		zenity --auto-close &
		(
			wget https://slepsov.ru/aitekinfo/Vipnet/vipnet_4.15.0.deb -P /home/$USER/Desktop/
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
			echo $passwd | sudo -S dpkg -i /home/$USER/Desktop/vipnet_4.15.0.deb
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
		# Проверка наличия файла перед удалением
		if [ -e "$file" ]; then
			rm "$file"
		fi
	fi
}

############### ----- WhatsApp ----- ###############
install_app_whatsapp() {
	file_path="/usr/share/applications/whatsapp.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/whatsapp.deb"
		zenity --auto-close &
		(
			wget http://easyastra.ru/store/whatsapp.deb -P /home/$USER/Desktop/
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
			echo $passwd | sudo -S apt install "$file" -y
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
		# Проверка наличия файла перед удалением
		if [ -e "$file" ]; then
			rm "$file"
		fi
	fi
}

############### ----- WPS ----- ###############
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

############### ----- Yandex Browser ----- ###############
install_app_yandex() {
	file_path="/usr/share/applications/yandex-browser.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		# Установка пакета с указанием прогресса
		zenity --auto-close &
		(
		# Установка пакета с использованием sudo и передачей пароля через stdin
		echo $passwd | sudo -S apt install yandex-browser-stable -y
		# Получение кода завершения установки
		exit_code=$?
		# Проверка кода завершения и отображение соответствующего сообщения
			if [ $exit_code -eq 0 ]; then
				zenity --info --title="Успех" --text="Пакет успешно установлен!"
				cp $file_path /home/$USER/Desktop
			else
				zenity --error --title="Ошибка" --text="Ошибка при установке пакета."
			fi
		) | zenity --progress --pulsate --title "Установка пакета" --text="Подождите, идет установка пакета..." --auto-close
	fi
}