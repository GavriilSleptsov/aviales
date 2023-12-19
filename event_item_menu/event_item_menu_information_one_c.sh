#!/bin/bash
#---------------init event for event_item_menu_information_repo.sh="Сетевые репозитории" menu-------------------------------
declare -A event_menu
event_menu["$item_menu_information_one_c"]="run_menu ${item_menu_one_c_all[@]}"
event_menu["$item_menu_one_c_first"]="download_one_c_first"
event_menu["$item_menu_one_c_second"]="download_one_c_second"
event_menu["$item_menu_one_c_three"]="download_one_c_three"
event_menu["$item_menu_one_c_four"]="download_one_c_four"
