#!/bin/bash
connect_folders() {
credentials_network_folder="cifs username=tornado,password=torsys,iocharset=utf8,file_mode=0777,dir_mode=0777 0 0"
# Строка, которую вы ищете в /etc/fstab
search_string="//192.168.0.2/Users /media/test $credentials_network_folder"

# Строка из /etc/fstab
fstab_line=$(grep "$search_string" /etc/fstab)

# Проверяем наличие строки в /etc/fstab
if [[ "$fstab_line" == "$search_string" ]]; then
    echo "true"
else
    echo "false"
fi
}