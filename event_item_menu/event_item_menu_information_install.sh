#!/bin/bash
#---------------init event for item_menu_information_install="Установка программ" menu-------------------------------
declare -A event_menu
event_menu["$item_menu_information_install"]="run_menu ${item_menu_install_apps[@]}"
event_menu["$item_menu_install_telegram"]="install_app_telegram"
event_menu["$item_menu_install_whatsapp"]="install_app_whatsapp"
event_menu["$item_menu_install_wps"]="install_app_wps"
event_menu["$item_menu_install_yandex"]="install_app_yandex"
event_menu["$item_menu_install_myoffice"]="install_app_myoffice"
event_menu["$item_menu_install_vipnet"]="install_vipnet"
event_menu["$item_menu_install_remina"]="install_app_remmina"
event_menu["$item_menu_install_rudesktop"]="install_app_rudesktop"
event_menu["$item_menu_install_karma"]="install_app_karma"
event_menu["$item_menu_install_saby_plugin"]="install_app_saby_plugin"
event_menu["$item_menu_install_kontur_plugin"]="xdg-open https://help.kontur.ru/plugin?p=1210&utm_source=kontur-extern.ru&utm_medium=referral&utm_referer=www.kontur-extern.ru&utm_startpage=support.kontur.ru%2Fca%2F38818-ustanovka_kontur_plagina_v_chromium_na_astralinux&utm_orderpage=support.kontur.ru%2Fca%2F38819-ustanovka_kontur_plagina_v_firefox_na_astralinux &"
event_menu["$item_menu_install_scr"]="install_app_scr"
event_menu["$item_menu_install_naps"]="install_app_naps"
event_menu["$item_menu_install_test"]="install_app_test"