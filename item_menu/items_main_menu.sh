#!/bin/bash
#---------------init items_main_menu-------------------------------
if getent group | grep -qw 'astra-admin' && id -nG | grep -qw 'astra-admin'; then
	export item_menu_information_resources="Информационные ресурсы"
	export item_menu_information_install="Установка программ"
	export item_menu_information_remove="Удаление программ"
	export item_menu_information_repo="Сетевые репозитории"
	export item_menu_information_printers="Драйвера для принтеров"
	export item_menu_information_freeipa="Действия с Freeipa"
	export item_menu_information_pomogator="О программе"
	export items_main_menu=( 
	"$item_menu_information_resources"  
	"$item_menu_information_install" 
	"$item_menu_information_remove" 
	"$item_menu_information_repo" 
	"$item_menu_information_printers" 
	"$item_menu_information_freeipa" 
	"$item_menu_information_pomogator" 
	"$exit_app")

else
	export item_menu_information_resources="Информационные ресурсы"
	export item_menu_information_pomogator="О программе"
	export items_main_menu=( 
	"$item_menu_information_resources"  
	"$item_menu_information_pomogator" 
	"$exit_app")
fi


