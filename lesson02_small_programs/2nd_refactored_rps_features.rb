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
game_data = { player: 0, computer: 0, wins: 0 }

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

def show_game_rules
  clear_screen
  prompt('game_rules')
  return_to_continue
end

def show_game_rules?
  simple_prompt('Would you like to see the game rules?')
  simple_prompt("Press y/yes to see them " \
                "or any other key to start the game")
  answer = gets.chomp.strip.downcase
  VALID_YES.include?(answer)
end

def valid_input?(input)
  (input.to_i.to_s == input) && (input.to_i > 0)
end

def modify_wins(score, integer)
  score[:wins] = integer
end

def display_wins(score)
  score[:wins]
end

def how_many_wins(game_data)
  answer = ""
  loop do
    simple_prompt('How many wins needed to declare a Grand Winner?')
    answer = gets.chomp.strip
    break if valid_input?(answer)
    simple_prompt('Please enter a number greater than 0')
  end
  modify_wins(game_data, answer.to_i)
end

def welcome_sequence(game_data)
  prompt('welcome')
  show_game_rules if show_game_rules?
  how_many_wins(game_data)
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
  puts "=> You chose: #{show_move(player)} |" \
       " Computer chose: #{show_move(computer)}"
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
  score[:player] = 0
  score[:computer] = 0
end

def find_grand_winner(score)
  if score[:player] == score[:wins]
    :player
  elsif score[:computer] == score[:wins]
    :computer
  end
end

def display_winner(grand_winner, score)
  winner = grand_winner.to_s.capitalize
  puts ""
  simple_prompt("#{winner} won #{display_wins(score)} " \
                "times and is the grand winner!")
end

def grand_winner_sequence(score)
  grand_winner = find_grand_winner(score)
  if grand_winner
    display_winner(grand_winner, score)
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
  VALID_YES.include?(answer)
end

def grand_winner?(game_data)
  (game_data[:player] == game_data[:wins]) ||
    (game_data[:computer] == game_data[:wins])
end

def reset_sequence(game_data)
  if grand_winner?(game_data)
    reset_score(game_data)
    how_many_wins(game_data)
  end
end

clear_screen
welcome_sequence(game_data)
clear_screen

loop do
  player_choice = player_chooses
  computer_choice = computer_chooses

  display_choices(player_choice, computer_choice)
  sleep 2
  display_results(player_choice, computer_choice)
  sleep 1
  update_score(game_data, player_choice, computer_choice)
  display_score(game_data)
  sleep 1
  grand_winner_sequence(game_data)
  break unless play_again?
  clear_screen
  reset_sequence(game_data)
end

simple_prompt('Thank you for playing, goodbye!')
