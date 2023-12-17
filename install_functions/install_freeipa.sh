#!/bin/bash
install_freeipa() {
	passwd=$(zenity --password)
	check_cancel
		zenity --auto-close &
		(
			echo $passwd | sudo -S apt install fly-admin-freeipa-server
			# Проверка кода завершения
			if [ $? -eq 0 ]; then
				zenity --info --title="Успех" --text="Пакет успешно загружен!"
			else
				zenity --error --title="Ошибка" --text="Ошибка при загрузке пакета."
				exit 1
			fi
		) | zenity --progress --pulsate --title "Загрузка пакета" --text="Подождите, идет загрузка..." --auto-close
	fly-term -e "fly-admin-freeipa-server"
}