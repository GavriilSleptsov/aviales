connect_network_folders () {
	zenity --list \
		--checklist \
		--column "checkbox" \
		--column "Player" \
		--column "Club" \
		--column "Country" \
		FALSE Messi PSG Argentina \
		FALSE Neymar PSG Brazil \
		FALSE Ronaldo Manu Portugal
}