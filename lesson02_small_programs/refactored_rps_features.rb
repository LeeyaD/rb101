require 'yaml'
require 'pry'
require 'pry-byebug'

MESSAGES = YAML.load_file('rps_messages.yml')
CHOICES = {
  ro: { move: 'Rock', beats: ['Scissors', 'Lizard'] },
  pa: { move: 'Paper', beats: ['Rock', 'Spock'] },
  sc: { move: 'Scissors', beats: ['Paper', 'Lizard'] },
  li: { move: 'Lizard', beats: ['Paper', 'Spock'] },
  sp: { move: 'Spock', beats: ['Scissors', 'Rock'] }
}
VALID_YES = %w(y yes)
VALID_NO = %w(n no)
WINS = 2
scoreboard = { player: 0, computer: 0 }

def list_of_choices
  list = []
  CHOICES.each_key { |k| list << CHOICES[k][:move] }
  list.join(', ')
end

def messages(message)
  MESSAGES[message]
end

def prompt(yml_key)
  message = messages(yml_key)
  puts "=> #{message}"
end

def simple_prompt(string)
  puts "=> #{string}"
end

def clear_screen
  system 'clear'
end

def return_to_continue
  puts ""
  puts "Press 'enter' to continue"
  gets
  clear_screen
end

def show_game_play
  clear_screen
  prompt('game_play')
  return_to_continue
end

def show_game_play?
  simple_prompt('Would you like to see the game rules?')
  simple_prompt('Press y/yes to see them')
  answer = gets.chomp.strip.downcase
  VALID_YES.include?(answer)
end

def welcome_sequence
  prompt('welcome')
  show_game_play if show_game_play?
end

def valid_move?(move)
  CHOICES.keys.include?(move)
end

def player_chooses
  choice = ''

  loop do
    prompt('select_move')
    puts "=> #{list_of_choices}"
    sleep 2
    choice = gets.chomp.strip.downcase.to_sym
    break if valid_move?(choice)
    prompt('invalid_selection')
  end
  choice
end

def computer_chooses
  CHOICES.keys.sample
end

def show_move(player)
  CHOICES[player][:move]
end

def display_choices(player, computer)
  clear_screen
  puts "=> You chose: #{show_move(player)} | Computer chose: #{show_move(computer)}"
end

def win?(first, second)
  CHOICES[first][:beats].include?(CHOICES[second][:move])
end

def display_results(player, computer)
  if win?(player, computer)
    simple_prompt('You win!')
  elsif win?(computer, player)
    simple_prompt('Computer won!')
  else
    simple_prompt("It's a tie.")
  end
end

def update_score(score, player, computer)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  end
end

def display_score(score)
  puts "=> Your score: #{score[:player]} | Computer score: #{score[:computer]}"
end

def reset_score(score)
  score.each_key { |key| score[key] = 0 }
end

def find_grand_winner(score)
  score.key(WINS)
end

def display_winner(grand_winner)
  winner = grand_winner.to_s.capitalize
  puts ""
  simple_prompt("#{winner} won #{WINS} times and is the grand winner!")
end

def grand_winner_sequence(score)
  grand_winner = find_grand_winner(score)
  if grand_winner
    display_winner(grand_winner)
    reset_score(score)
  end
end

def play_again?
  answer = ""

  loop do
    simple_prompt('Do you want to play again? (y/yes or n/no to exit)')
    answer = gets.chomp.strip.downcase
  
    break if VALID_YES.include?(answer) || VALID_NO.include?(answer)
    simple_prompt("I'm sorry that's not a valid response. Try again.")
  end
  VALID_YES.include?(answer) ? true : false
end

clear_screen
welcome_sequence
clear_screen

loop do
  player_choice = player_chooses
  computer_choice = computer_chooses

  display_choices(player_choice, computer_choice)
  sleep 2
  display_results(player_choice, computer_choice)
  sleep 1
  update_score(scoreboard, player_choice, computer_choice)
  display_score(scoreboard)
  sleep 1
  grand_winner_sequence(scoreboard)
  break unless play_again?
  clear_screen
end

simple_prompt('Thank you for playing, goodbye!')
# You could turn this game into a tournament, where the player that wins N rounds is the overall champion.
# APPROACH
# 1. 

# ADD WHEN SUBMITTING CODE REVIEW
# Hi Mia!

# I actually changed my mind and would like a review of my refactored code for this assignment. Let me know if I should create a new 'Code Review' request and I will, otherwise I'll just link it below.

# I actually like being able to type shorthand so I left that but I did all of your other corrections & suggestions
# - asking player if you want to read the rules (`#show_game_play?` and `#show_game_play` on lines 57 & 63)
# - making my input validation stricter; handling whitespace and only allowing the user to type 'n/no' to exit the program
# - making separate methods for listing the choices (formerly: `MOVES.valus.join(', ')` and the `if` conditional I originally that validated user input (formerly: `MOVES.keys.include?(choice)')
# - using `#each_key` instead of `MOVES.keys.each` in `#reset_score`
# - I did combine `WINNING_MOVES` and `MOVES` in one hash, that was interesting!
