#!/bin/bash
install_freeipa() {
	passwd=$(zenity --password)
	check_cancel
		zenity --auto-close &
		(
			echo $passwd | sudo -S apt install fly-admin-freeipa-server -y
			# Проверка кода завершения
			if [ $? -eq 0 ]; then
				zenity --info --title="Успех" --text="Пакет успешно загружен!"
			else
				zenity --error --title="Ошибка" --text="Ошибка при загрузке пакета."
				exit 1
			fi
		) | zenity --progress --pulsate --title "Загрузка пакета" --text="Подождите, идет загрузка..." --auto-close
	fly-term -e "sudo fly-admin-freeipa-server"
}

connect_freeipa() {
	passwd=$(zenity --password)
	check_cancel
		zenity --auto-close &
		(
			echo $passwd | sudo -S apt install astra-freeipa-client -y
			# Проверка кода завершения
			if [ $? -eq 0 ]; then
				zenity --info --title="Успех" --text="Пакет успешно загружен!"
			else
				zenity --error --title="Ошибка" --text="Ошибка при загрузке пакета."
				exit 1
			fi
		) | zenity --progress --pulsate --title "Загрузка пакета" --text="Подождите, идет загрузка..." --auto-close
	fly-term -e "astra-freeipa-client -d slepsov.corp -p user123qwe -u admin -y"
}