download_с_2760() {
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

download_с_1851() {
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

download_с_2256() {
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

download_с_2283() {
	passwd=$(zenity --password)
	check_cancel
	zenity --auto-close &
		(
		wget https://slepsov.ru/aitekinfo/1C/tthin.client_8_3_22_2283.deb64.tar.gz -P /home/$USER/Desktop/
		# Проверка кода завершения wget
		if [ $? -eq 0 ]; then
			zenity --info --title="Успех" --text="Файл успешно загружен!"
		else
			zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
			exit 1
		fi
		) | zenity --progress --pulsate --title "Загрузка файла" --text="Подождите, идет загрузка..." --auto-close
}
