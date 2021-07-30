require 'pry'
require 'pry-byebug'
require 'yaml'

LANGUAGE = { '1' => 'en', '2' => 'es', '3' => 'ko' }

MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(yml_key, lang='en')
  message = messages(yml_key, lang)
  puts "=> #{message}"
end

def choose_a_language
  choice = ""
  loop do
    lang = <<-MSG
  Which language is yours?
      1) English
      2) Spanish
      3) Korean
      MSG
    puts "=> #{lang}"
    choice = gets.chomp
    break if %w(1 2 3).include?(choice)
    puts "That's not a valid choice. Type either 1, 2, or 3"
  end
  LANGUAGE[choice]
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def number?(number)
  integer?(number) || float?(number)
end

def get_name(lang)
  name = ""
  loop do
    prompt("name?", lang)
    name = gets.chomp

    if name.empty?
      prompt "valid_name"
    else
      break name
    end
  end
end

def print_name(usr_name, lang)
  puts "=> #{messages('greeting', lang)}, #{usr_name}!"
end

def get_number(yml_key, lang)
  loop do
    prompt(yml_key, lang)
    num = gets.chomp

    if number?(num)
      break num.to_f
    else
      prompt("invalid_number", lang)
    end
  end
end

def choose_operator(lang)
  prompt("operator_prompt", lang)

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break operator
    else
      prompt("invalid_op", lang)
    end
  end
end

def do_math(operator, num1, num2)
  case operator
  when "1"
    num1 + num2
  when "2"
    num1 - num2
  when "3"
    num1 * num2
  else
    num1 / num2
  end
end

def print_result(result, lang)
  puts "=> #{messages('result', lang)} #{result}"
end

system "clear"
lang_choice = choose_a_language
prompt("welcome", lang_choice)
sleep 0.5
name = get_name(lang_choice)
sleep 0.5
print_name(name, lang_choice)
sleep 0.5

loop do
  first_num = get_number("first_number", lang_choice)
  sleep 0.5
  second_num = get_number("second_number", lang_choice)
  sleep 1

  operator = choose_operator(lang_choice)

  prompt("interim_msg", lang_choice)

  sleep 2
  result = do_math(operator, first_num, second_num)
  print_result(result, lang_choice)

  prompt("again?", lang_choice)
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("goodbye", lang_choice)
