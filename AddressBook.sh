#!/bin/bash



add_user(){
	printf "This is the add_user() function\n"
	read -p "Enter your first name: " firstName
	read -p "Enter your last name: " lastName
	read -p "Enter your email address: " emailAddress
	read -p "Enter your phone number: " phoneNumber
	echo "$firstName $lastName $emailAddress $phoneNumber" >> UserRecord.txt
	echo -e "The current user record is: \n"
	display_user $firstName $lastName $emailAddress $phoneNumber
	mainProg
}

search_user(){
	printf "This is the search_user() function\n"
	terminal=`tty`
	read -p "Enter the first/last name or phone number or email address to be searched: " searchValue
	exec < UserRecord.txt
	count=1
	#breakFlag=0
	while read line
	do
		for word in $line
		do
			if [ $word == $searchValue ]
			then
				echo "Values found in $line"
				break
			fi
		done
		echo $count
		count=$((count+1))
	done
	exec < $terminal
	mainProg
}

remove_user(){
	printf "This is the remove_user() function\n"
	read -p "Enter the first/last name or phone number or email address to be deleted: " deleteValue
	terminal=`tty`
	exec < UserRecord.txt
	count=1
	breakFlag=0
	while read line
	do
		for word in $line
		do
			if [ $word == $deleteValue ]
			then
				echo "Values found in $line"
				breakFlag=1
				#echo -e "Delete this entry? (y/n): \c"
				read -p "Delete this entry? (y/n): " deleteChoice
				#read deleteChoice
				#if [ $deleteChoice == "y" ]
				#then
				sed -i "$count"'d' "UserRecord.txt"
				#fi
			#else
			#	echo "Value not found"
			break
			fi
		done
		echo $count
		count=$((count+1))
		if [ "$breakFlag" == "1" ]
		then
			echo "Break flag is: $breakFlag"
			break
			#mainProg
		fi
		
	done
	exec < $terminal
	mainProg
}

display_user(){
	printf "This is the display_user() function\n"
	printf "The values entered are\n"
	echo "First Name: " $1
	echo "Last Name: " $2
	echo "Email Address: " $3
	echo "Phone number: " $4
	
	echo -e "The total records in the database are:"
	terminal=`tty`
	exec < UserRecord.txt
	#count=1
	while read line
	do
		echo $line
	done
	exec < $terminal
	mainProg
}



#Main program
mainProg()
{
	printf "\nChoose your option\n"
	printf "1: Search Address Book\n2: Add Entries\n3: Delete Entries\n4: Display\n5: Exit\n"
	read -p "Enter your option: " option
	printf "You selected $option\n"
	case $option in
		1)
			search_user;;
		2)
			add_user;;
		3)
			remove_user;;
		4)
			display_user;;
		5) 
			exit
	esac
}
mainProg