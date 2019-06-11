#!/usr/bin/env

function open_ () {
   echo "You use 'open'."

   echo -n " Input org alias or user name: "
   read orgname

   if [[ "$orgname" != "" ]]; then
      orgname="-u $orgname"
   fi

   echo "sfdx force:org:open $orgname"
   echo
         sfdx force:org:open $orgname
}

function list_ () {
   echo "You use 'list'."

   echo "sfdx force:org:list"
   echo
         sfdx force:org:list
}

function create_ () {
   echo "You use 'create'."

   while true; do
      echo -n " Input new org alias: "
      read newalias
      if [[ "$newalias" != "" ]]; then
         break
      fi
      echo 'try again.'
   done

   echo -n " Input enable days [default=7]: "
   read days
   if [[ "$days" = "" ]]; then
      days=7
   fi

   echo "sfdx force:org:create -f config/project-scratch-def.json -a $newalias -s -d $days"
   echo
         sfdx force:org:create -f config/project-scratch-def.json -a $newalias -s -d $days
}


function delete_ () {
   echo "You use 'delete'."

   echo -n " Input org alias or user name: "
   read orgname

   if [[ "$orgname" != "" ]]; then
      orgname="-u $orgname"
   fi

   echo "sfdx force:org:delete $orgname"
   echo
         sfdx force:org:delete $orgname
}

function auth_ () {
   echo "You use 'auth'."

   echo "sfdx force:auth:web:login -r https://test.salesforce.com -s"
   echo
         sfdx force:auth:web:login -r https://test.salesforce.com -s
}

function main () {
   echo
   echo "You can use 'open', 'list', 'create', 'delete', 'auth', 'quit'."
   echo -n ' --> '
   read input

   echo

   case "$input" in
      open)
         open_
         ;;
      list)
         list_
         ;;
      create)
         create_
         ;;
      delete)
         delete_
         ;;
      auth)
         auth_
         ;;
      quit)
         exit
         ;;
      *)
         echo 'Input error!'
         ;;
   esac
}

while true; do
   main
done
