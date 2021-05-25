#!/bin/sh

# back up ====================================================================
cd /mnt/drive1/phone-bak/
mkdir $(date +"%Y-%m-%d")
cd $(date +"%Y-%m-%d")

adb pull /storage/self/primary/DCIM/
adb pull /storage/self/primary/Download/
adb pull /storage/self/primary/Movies/
adb pull /storage/self/primary/Pictures/
#adb pull /storage/self/primary/Snapseed/
adb pull /storage/self/primary/SNOW/
#adb pull /storage/self/primary/Videos/
adb pull /storage/self/primary/zalo/

touch contacts
adb shell content query --uri content://com.android.contacts/data --projection display_name:data1:data4:contact_id > contacts

# push =======================================================================
# remind.rem to phone
adb push ~/p-dot-script/remind.rem /storage/self/primary/DCIM

# notes and yt download on computer
echo -e "\n" >> ~/vimwiki/index.md
cat DCIM/notes >> ~/vimwiki/index.md

# clear youtube on phone
# doesn't work...
#adb shell
#echo "" > /storage/self/primary/DCIM/youtube
#exit

# msg
toilet -f mono9 UNPLUG PHONE

# youtube
#youtube-dl -a DCIM/youtube

# msg
#toilet -f mono9 YT DOWNLOADS COMPLETE
