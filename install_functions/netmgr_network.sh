#!/bin/bash

apt install whiptail -y

function add_network_config() {
    computer_ip=$(whiptail --inputbox "Введите IP адрес ПК:" 10 60 192.168.0. 3>&1 1>&2 2>&3)
    subnet_mask=$(whiptail --inputbox "Введите маску подсети (в виде /24):" 10 60 24 3>&1 1>&2 2>&3)
    gateway_ip=$(whiptail --inputbox "Введите шлюз:" 10 60 192.168.0.1 3>&1 1>&2 2>&3)
    dns1_ip=$(whiptail --inputbox "Введите IP DNS сервера:" 10 60 192.168.0.201 3>&1 1>&2 2>&3)
    search_domain_name=$(whiptail --inputbox "Введите поисковый домен:" 10 60 aviales.local 3>&1 1>&2 2>&3)
    if (whiptail --yesno "IP адрес:    $computer_ip\nМаска подсети:    $subnet_mask\nШлюз:    $gateway_ip\nDNS:    $dns1_ip\nПоисковый домен:    $search_domain_name" --no-button "No" --yes-button "Yes" 15 60 3>&1 1>&2 2>&3 ); then
  whiptail --title "MESSAGE" --msgbox "Process completed successfully." 8 78;
  else whiptail --title "MESSAGE" --msgbox "Cancelling" 8 78
  exit 1;
fi
}

#стартуем сеть
nmcli -wait 1 device conn eth0 

#имя активного соединения
con_name=$(nmcli --fields NAME -t connection show --active)

if [ -z "$con_name" ] ; then echo "Нет активных соединений" && exit 0;
fi
echo "$con_name"

#сбор данных
nmcli connection modify "$con_name" connection.autoconnect yes ipv4.method manual ipv4.dns $dns1_ip ipv4.dns-search $search_domain_name ipv4.addresses $computer_ip/$subnet_mask ipv4.gateway $gateway_ip

nmcli connection down "$con_name"
nmcli connection up "$con_name"
sleep 5
