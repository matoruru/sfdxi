#!/usr/bin/env

TO="/usr/lobal/bin/"
ORG="./sfdxi.sh"
NEW="./sfdxi"

cp $ORG $NEW
chmod +x $NEW

sudo mv $NEW $TO

if [[ -f $NEW ]]; then
   rm $NEW
fi
