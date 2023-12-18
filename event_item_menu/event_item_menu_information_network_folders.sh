#!/bin/bash
#---------------init event for item_menu_information_network_folders-------------------------------
declare -A event_menu
event_menu["$item_menu_information_network_folders"]="run_menu ${item_menu_information_network_folders_all[@]}"
event_menu["$item_menu_information_network_folders_connect"]="connect_network_folders"
event_menu["$item_menu_information_network_folders_disconnect"]="disconnect_folders"