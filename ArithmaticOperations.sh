#!/bin/bash


number_addition(){

	echo -e "Inside the number_addition() function\n"
	sum=$((number1 + number2))
	echo -e "The added numbers are $1 + $2 = $sum\n"
	main_prog

}

number_subtraction(){

	echo -e "Inside the number_subtraction() function\n"
	if [ $number1 -gt $number2 ]
	then
		echo -e "$number1 is greater than $number2, therefore, performing $number1 - $number2\n"
		difference=$((number1 - number2))
		echo -e "The difference is $difference\n"
	else
		echo -e "$number2 is greater than $number1, therefore, performing $number2 - $number1\n"
		difference=$((number2 - number1))
		echo -e "The difference is $difference\n"
	fi
	main_prog

}

number_division(){

	echo -e "Inside the number_division() function\n"
	#VAR=$(bc <<<"scale=2;$IMG_WIDTH/$IMG2_WIDTH")
	#div=$((number1 / number2))
	div=$(C:\\Program\ Files\ \(x86\)\\GnuWin32\\bin\\bc.exe <<<"scale=4;$number1/$number2")
	echo -e "The division result is $number1 / $number2 = $div"
	main_prog

}

number_multiplication(){

	echo -e "Inside the number_multiplication() function\n"
	multi=$((number1 * number2))
	echo -e "The multiplied result is $number1 * $number2 = $multi"
	main_prog

}

main_prog(){

	printf "1: Addition\n2: Subtraction\n3: Division\n4: Multiplication\n5: Exit\n"
	read -p "Enter your choice: " user_choice
	case $user_choice in
		1)
			read -p "Enter the two numbers to add separated by a space: " number1 number2
			number_addition $number1 $number2;;
		2)
			read -p "Enter the two numbers to subtract separated by a space: " number1 number2
			number_subtraction $number1 $number2;;
		3)
			read -p "Enter the two numbers to divide separated by a space: " number1 number2
			number_division $number1 $number2;;
		4)
			read -p "Enter the two numbers to add separated by a space: " number1 number2
			number_multiplication $number1 $number2;;
		5)
			exit
	esac

}

main_prog