#!/bin/bash
declare -A event_menu
event_menu["$item_menu_information_domen"]="run_menu ${item_menu_domen_all[@]}"
event_menu["$item_menu_domen_connect"]="domen_connect"
event_menu["$item_menu_information_netmgr"]="add_network_config"



