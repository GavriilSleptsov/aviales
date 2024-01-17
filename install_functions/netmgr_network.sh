#!/bin/bash

add_network() {
	имя активного соединения
	con_name=$(nmcli --fields NAME -t connection show --active)

	if [ -z "$con_name" ] ; then echo "Нет активных соединений" && exit 0;
	fi
	echo "$con_name"

	#сбор данных
	add_network_config
	nmcli connection modify "$con_name" connection.autoconnect yes ipv4.method manual ipv4.dns $dns1_ip ipv4.dns-search $search_domain_name ipv4.addresses $computer_ip/$subnet_mask ipv4.gateway $gateway_ip

	nmcli connection down "$con_name"
	nmcli connection up "$con_name"
	sleep 5
}

 form_data=$(zenity --forms --title="Введите данные" --text="Введите данные:" \
            --add-entry="Введите IP адрес ПК" \
            --add-entry="Введите маску подсети в виде: 24" \
            --add-entry="Введите IP DNS сервера" \
			--add-entry="Введите IP шлюза по умполчанию" \
			--add-entry="Введите поисковый домен" \ 
            # Разбиение строки с данными на отдельные переменные
            ip_address=$(echo "$form_data" | awk -F '|' '{print $1}')
            subnet_mask=$(echo "$form_data" | awk -F '|' '{print $2}')
            dns_server=$(echo "$form_data" | awk -F '|' '{print $3}')
			gateway=$(echo "$form_data" | awk -F '|' '{print $4}')
			search_domain=$(echo "$form_data" | awk -F '|' '{print $5}')