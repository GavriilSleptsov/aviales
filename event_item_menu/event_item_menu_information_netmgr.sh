#!/bin/bash
declare -A event_menu
event_menu["$item_menu_information_netmgr"]="run_menu ${item_menu_information_netmgr_all[@]}"
event_menu["$item_menu_netmgr_settings"]="add_network_config"
