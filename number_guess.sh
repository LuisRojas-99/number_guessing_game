#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -q -c"
#I have done everything right.
random_number="$(( ( $RANDOM % 1000) + 1 ))"

echo "Enter your username:"

read -e username
attempts=1
search_user=`$PSQL " SELECT COUNT(username) FROM game WHERE username = '$username';"`

if [ $search_user -eq 0 ];then
  echo "Welcome, $username! It looks like this is your first time here."
  $PSQL " INSERT INTO game (username) VALUES ('$username');"
  echo "Guess the secret number between 1 and 1000:"
fi

games_played=`$PSQL " SELECT games_played FROM game WHERE username = '$username';"`

best_game=`$PSQL " SELECT best_game FROM game WHERE username = '$username';"`


if [ $search_user -eq 1 ];then
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
  echo "Guess the secret number between 1 and 1000:"
fi
read -r number_guessed

while ! [[ $number_guessed -eq $random_number ]] 
do #game
  re='^[0-9]+$'
  
  if ! [[ $number_guessed =~ $re ]];then
  echo "That is not an integer, guess again:"
  read -r number_guessed  
  else
    attempts=$((attempts + 1))
    if [ $number_guessed -lt $random_number ];then
      echo "It's higher than that, guess again:"
    
    fi
    if [ $number_guessed -gt $random_number ];then
      echo "It's lower than that, guess again:"
    fi
    read -r number_guessed
    

  fi
  

done
final_games_played=$((games_played + 1))
#echo "games_played = $games_played"
#echo "final_games_played = $final_games_played"
if [ $best_game -gt $attempts ];then
  $PSQL "UPDATE game SET best_game = $attempts WHERE username = '$username'"


fi
$PSQL "UPDATE game SET games_played = $final_games_played WHERE username = '$username'"
echo "You guessed it in $attempts tries. The secret number was $random_number. Nice job!"


#comment I have done this 10 times now. last commit
