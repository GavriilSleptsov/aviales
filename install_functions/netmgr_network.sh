#!/bin/bash
validate_ip() {
	local ip=$1
	local regex='^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
	if [[ ! $ip =~ $regex ]]; then
		zenity --error --width=120 --height=100 --text="Ошибка: Неверный формат IP-адреса или допустимые значения." 
		run_menu "${items_main_menu[@]}"
	fi
}

validate_subnet_mask() {
	local subnet_mask="$1"
	if ! [[ "$subnet_mask" =~ ^[0-9]+$ ]]; then
		zenity --error --width=120 --height=100 --text="Ошибка: Маска подсети должна быть числом от 0 до 32." 
		run_menu "${items_main_menu[@]}"
	fi

	if ((subnet_mask < 0 || subnet_mask > 32)); then
		zenity --error --width=120 --height=100 --text="Ошибка: Недопустимый префикс маски подсети. Префикс должен быть от 0 до 32." 
		run_menu "${items_main_menu[@]}"
	fi
}


add_network() {
	form_data=$(zenity --forms --title="Введите данные" --text="Введите данные:"\
		--add-entry="Введите IP адрес ПК" \
		--add-entry="Введите маску подсети в виде: 24" \
		--add-entry="Введите IP DNS сервера" \
		--add-entry="Введите IP шлюза по умполчанию" \
		--add-entry="Введите поисковый домен")
		
		check_cancel
		
		#Разбиение строки с данными на отдельные переменные
		ip_address=$(echo "$form_data" | awk -F '|' '{print $1}')
		subnet_mask=$(echo "$form_data" | awk -F '|' '{print $2}')
		dns_server=$(echo "$form_data" | awk -F '|' '{print $3}')
		gateway=$(echo "$form_data" | awk -F '|' '{print $4}')
		search_domain=$(echo "$form_data" | awk -F '|' '{print $5}')
	
	con_name=$(nmcli --fields NAME -t connection show --active)
	
	declare -a dns_options
	declare -a ip_options
	
	if [ -z "$ip_address" ] && [ -z "$subnet_mask" ] && [ -z "$dns_server" ] && [ -z "$gateway" ] && [ -z "$search_domain" ]; then
		run_menu "${items_main_menu[@]}"
	fi
	
	if [ -n "$dns_server" ]; then
		validate_ip "$dns_server"
		dns_options+=("ipv4.dns $dns_server")
	fi
	
	if [ -z "$search_domain" ]; then
		dns_options+=("ipv4.dns-search """)
	fi
	
	if [ -n "$ip_address" ]; then
		validate_ip "$ip_address"
		validate_subnet_mask "$subnet_mask"
		ip_options+=("ipv4.addresses $ip_address/$subnet_mask")
	fi
	
	if [ -n "$gateway" ]; then 
		validate_ip "$gateway"
		ip_options+=("ipv4.gateway $gateway")
	fi

	nmcli connection modify "$con_name" connection.autoconnect yes ipv4.method manual \
	${dns_options[@]} \
	${ip_options[@]}
	
	nmcli connection down "$con_name"
	nmcli connection up "$con_name"
	sleep 5
}


