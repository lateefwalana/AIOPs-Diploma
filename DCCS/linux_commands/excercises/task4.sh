#!/bin/bash
first_num=0
second_num=0
read -p "Enter first number: " first_num
read -p "Enter second number: " second_num

echo "First number + second number =  $((first_num + second_num))"
echo "First number - second number =  $((first_num - second_num))"
echo "First number * second number =  $((first_num * second_num))"
echo "First number / second number =  $((first_num / second_num))"
echo "First number % second number =  $((first_num % second_num))"
echo "First number raised to the power of the second second number =  $((first_num ** second_num))"
