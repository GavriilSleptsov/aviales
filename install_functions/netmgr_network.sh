#!/bin/bash


validate_ip() {
	local ip=$1
	local regex='^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
	if [[ ! $ip =~ $regex ]]; then
		zenity --error --text="Ошибка: Неверный формат IP-адреса или допустимые значения."
		exit 1
	fi
}


add_network() {
	form_data=$(zenity --forms --title="Введите данные" --text="Введите данные:" \
		--add-entry="Введите IP адрес ПК" \
		--add-entry="Введите маску подсети в виде: 24" \
		--add-entry="Введите IP DNS сервера" \
		--add-entry="Введите IP шлюза по умполчанию" \
		--add-entry="Введите поисковый домен")
		#Разбиение строки с данными на отдельные переменные
		ip_address=$(echo "$form_data" | awk -F '|' '{print $1}')
		subnet_mask=$(echo "$form_data" | awk -F '|' '{print $2}')
		dns_server=$(echo "$form_data" | awk -F '|' '{print $3}')
		gateway=$(echo "$form_data" | awk -F '|' '{print $4}')
		search_domain=$(echo "$form_data" | awk -F '|' '{print $5}')
		
	if [[ $? -eq 1 ]]; then
    run_menu "${items_main_menu[@]}"
    fi
		
		
	#check_cancel
	#validate_ip "$ip_address"
		
		
		
		
	con_name=$(nmcli --fields NAME -t connection show --active)

	if [ -z "$con_name" ] ; then echo "Нет активных соединений" && exit 0;
	fi

	nmcli connection modify "$con_name" connection.autoconnect yes ipv4.method manual \
	ipv4.dns $dns_server \
	ipv4.dns-search $search_domain \
	ipv4.addresses $ip_address/$subnet_mask \
	ipv4.gateway $gateway

	nmcli connection down "$con_name"
	nmcli connection up "$con_name"
	sleep 5
}

