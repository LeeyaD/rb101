require 'yaml'

MESSAGES = YAML.load_file('rps_messages.yml')
MOVES = { ro: 'Rock', pa: 'Paper', sc: 'Scissors',
          li: 'Lizard', sp: 'Spock' }
WINNING_MOVES = { ro: ['Scissors', 'Lizard'],
                  pa: ['Rock', 'Spock'],
                  sc: ['Paper', 'Lizard'],
                  li: ['Paper', 'Spock'],
                  sp: ['Scissors', 'Rock'] }
VALID_YES = %w(y yes)
WINS = 3
scoreboard = { player: 0, computer: 0 }

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

def welcome_sequence
  prompt('welcome')
  prompt('game_play')
  return_to_continue
end

def player_chooses
  choice = ''

  loop do
    prompt('select_move')
    puts "=> #{MOVES.values.join(', ')}"
    sleep 2
    choice = gets.chomp.downcase.to_sym
    break if MOVES.keys.include?(choice)
    prompt('invalid_selection')
  end
  choice
end

def computer_chooses
  MOVES.keys.sample
end

def display_choices(player, computer)
  clear_screen
  puts "=> You chose: #{MOVES[player]} | Computer chose: #{MOVES[computer]}"
end

def win?(first, second)
  WINNING_MOVES[first].include?(MOVES[second])
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
  score.keys.each { |key| score[key] = 0 }
end

def find_grand_winner(score)
  score.key(3)
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
  simple_prompt('Do you want to play again? (y/yes)')
  answer = gets.chomp.downcase
  VALID_YES.include?(answer)
end

clear_screen
welcome_sequence

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
