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
adb shell content query --uri content://com.android.contacts/data --projection display_name:data1:data4:contact_id >> contacts

# push =======================================================================
# remind.rem to phone
adb push ~/p-dot-script/remind.rem /storage/self/primary/DCIM

# notes and yt download links to p-dot-script
cp DCIM/notes ~/p-dot-script/notes
cp DCIM/youtube ~/p-dot-script/youtube
