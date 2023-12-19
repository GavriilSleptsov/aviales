#!/bin/bash
#---------------init event for event_item_menu_information_repo.sh="Сетевые репозитории" menu-------------------------------
declare -A event_menu
event_menu["$item_menu_information_one_c"]="run_menu ${item_menu_one_c_all[@]}"
event_menu["$item_menu_cryptopro_install"]="download_cryptopro"

export item_menu_one_c_first="Загрузить КриптоПро 5.0.11455 (23.18Mb)"
export item_menu_one_c_second="Установить cAdES Browser Plug-in (18Mb)"
export item_menu_one_c_three="Установить IFCPlugin (5.02Mb)"
export item_menu_one_c_four="Установить IFCPlugin (5.02Mb)"
export item_menu_one_c_all=(
"\"$item_menu_one_c_first\""
"\"$item_menu_one_c_second\""
"\"$item_menu_one_c_three\""
"\"$item_menu_one_c_four\""
"\"$exit_menu\"" 
"\"$exit_app\"" )