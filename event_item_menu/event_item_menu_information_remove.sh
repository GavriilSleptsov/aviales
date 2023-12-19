#!/bin/bash
#---------------init event for item_menu_information_remove="Удаление программ" menu-------------------------------
declare -A event_menu
event_menu["$item_menu_information_remove"]="run_menu ${item_menu_remove_apps[@]}"
event_menu["$item_menu_remove_telegram"]="remove_app 'telegram' "
event_menu["$item_menu_remove_whatsapp"]="remove_app 'whatsapp' "
event_menu["$item_menu_remove_wps"]="remove_app 'wps-office' "
event_menu["$item_menu_remove_yandex"]="remove_app 'yandex-browser-stable' "
event_menu["$item_menu_remove_remina"]="remove_app 'remmina' "
event_menu["$item_menu_remove_vipnet"]="remove_app 'vipnetclient-gui' "
event_menu["$item_menu_remove_rudesktop"]="remove_app 'rudesktop-astra' "
event_menu["$item_menu_remove_sabyplugin"]="fly-term -e 'sudo /opt/sbis3plugin/sabyapps-uninstall SabyPlugin'"
event_menu["$item_menu_remove_carm"]="fly-term -e 'sudo apt remove carma-capilite carma-dev carma-common -y"
