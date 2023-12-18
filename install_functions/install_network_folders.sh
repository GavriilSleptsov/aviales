#!/bin/bash
connect_folders() {
# Строка, которую вы ищете в /etc/fstab
search_string="//192.168.0.2/Users /media/test"

# Строка из /etc/fstab
fstab_line=$(grep "$search_string" /etc/fstab)

# Проверяем наличие строки в /etc/fstab
if [[ "$fstab_line" == "$search_string" ]]; then
    echo "true"
else
    echo "false"
fi
}