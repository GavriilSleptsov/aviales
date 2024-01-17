#!/bin/bash
#---------------init items_main_menu-------------------------------
export item_menu_information_domen="Подключение к домену aviales.local"
export item_menu_information_resources="Информационные ресурсы"
export item_menu_information_install="Установка программ"
export item_menu_information_remove="Удаление программ"
export item_menu_information_repo="Сетевые репозитории"
export item_menu_information_pomogator="О программе"
export item_menu_information_network_folders="Сетевые папки"
export item_menu_information_cryptopro="КриптоПро 5"
export item_menu_information_one_c="1С: Предприятие. Тонкий Клиент"
export item_menu_information_netmgr="Настройка сетевого интерфейса (eth0)"
export items_main_menu=( 
	"$item_menu_information_netmgr"
	"$item_menu_information_domen" 
	"$item_menu_information_resources"  
	"$item_menu_information_install" 
	"$item_menu_information_remove" 
	"$item_menu_information_repo"
	"$item_menu_information_network_folders"
	"$item_menu_information_cryptopro"
	"$item_menu_information_one_c"
	"$item_menu_information_pomogator" 
	"$exit_app")
	
