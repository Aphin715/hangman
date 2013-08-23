#!/usr/bin/env ruby

require 'pry'



puts "Program goes here..."

#As a game master I want to come up with a random word.
mets =["wright", "davis" , "murphy" , "tejada" ,"buck" , "byrd" , "young" ,"harvey","lagares"]

met = mets.sample

guesses = 8

player =  "_" * met.length




puts "Welcome to Mets Hangman!"
#User should know know how much of the word he has guessed
puts

guessed_letters=[]

while guessed_letters != met

  print "Word: "
  puts player

  puts "Chances remaining #{guesses}"

  puts "Guess a single letter (a-z) or the entire word:"
 guess=gets.chomp


  if guess.length > 1
    if guess == met
      puts "player wins"
      break
    else
      puts "You lose"
      break
    end
  elsif guess.length == 1
    guessed_letters << guess
    occurances = guessed_letters.count(guess)

    if met.include?(guess)
      puts "Found #{occurances} occurance(s) of the character #{guess}"
    else
      guesses -=1
      puts "Sorry no #{guess}'s here"
    end


  end

  player = met.gsub(/[^"#{guessed_letters.join}"]/, "_")

  if met == player
    puts"Congratulations, you can guess one of the 9 starters on the Mets! You're a super fan!"
    break

  elsif guesses == 0
      puts "You couldn't guess #{met}, what kind of Met fan are you?"
      exit
  end
end











