#!/bin/bash
#---------------init event for event_item_menu_information_repo.sh="Сетевые репозитории" menu-------------------------------
declare -A event_menu
event_menu["$item_menu_information_repo"]="run_menu ${item_menu_information_repo_all[@]}"
event_menu["$item_menu_information_repo_rcit"]="repo_rcit"
event_menu["$item_menu_information_repo_frozen1_7_3"]="repo_frozen1_7_3"
event_menu["$item_menu_information_repo_frozen1_7_4"]="repo_frozen1_7_4"
event_menu["$item_menu_information_repo_frozen1_7_5"]="repo_frozen1_7_5"

