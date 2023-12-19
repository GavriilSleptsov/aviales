#!/bin/bash
#---------------init event for event_item_menu_information_repo.sh="Сетевые репозитории" menu-------------------------------
declare -A event_menu
event_menu["$item_menu_information_cryptopro"]="run_menu ${item_menu_cryptopro_all[@]}"
event_menu["$item_menu_cryptopro_install"]="download_cryptopro"
event_menu["$item_menu_cades"]="install_cades"
event_menu["$item_menu_ifc"]="install_ifc"


