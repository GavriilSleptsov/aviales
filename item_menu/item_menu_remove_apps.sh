#!/bin/bash

# Определяем функцию для проверки установки программы
check_program_installed() {
    local program_name=$1
	local file_path="/usr/share/applications/$program_name.desktop"
    if [ -f "$file_path" ]; then
        return 0  # Программа установлена
    else
        return 1  # Программа не установлена
    fi
}

export item_menu_remove_telegram="Удалить Telegram"

export item_menu_remove_whatsapp="Удалить Whatsapp"

export item_menu_remove_wps="Удалить WPS-Office"

export item_menu_remove_notepad="Удалить NotepadPlus"

export item_menu_remove_yandex="Удалить Яндекс Браузер"

export item_menu_remove_remina="Удалить Remmina"

export item_menu_remove_vipnet="Удалить Vipnet Client 4.15.0 GUI"

export item_menu_remove_rudesktop="Удалить RuDesktop"

export item_menu_remove_sabyplugin="Удалить SabyPlugin (СБИС Плагин)"

export item_menu_remove_carma="Удалить KARMA"

export item_menu_remove_scr="Удалить SimpleScreenRecorder"


# Инициализация массива
export item_menu_remove_apps=(
"\"$exit_menu\"" 
"\"$exit_app\"")

# Проверяем и добавляем программы в массив
if check_program_installed "telegram"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_telegram\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "whatsapp"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_whatsapp\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "wps-office"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_wps\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "yandex-browser-stable"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_yandex\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "org.remmina.Remmina"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_remina\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "ViPNet"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_vipnet\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "rudesktop"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_rudesktop\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "Sbis3Plugin"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_sabyplugin\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "carma"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_carma\""
	"${item_menu_remove_apps[@]}"
	)
fi

if check_program_installed "simplescreenrecorder"; then
    item_menu_remove_apps=(
	"\"$item_menu_remove_scr\""
	"${item_menu_remove_apps[@]}"
	)
fi

