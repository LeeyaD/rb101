require 'yaml'

MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def messages(messages)
  MESSAGES[messages]
end

def prompt(yml_key)
  message = messages(yml_key)
  puts "=> #{message}"
end

def get_name
  name = ""
  loop do
    prompt("name?")
    name = gets.chomp

    break unless name.empty?
    prompt "valid_name"
  end
  name
end

def print_name(usr_name)
  puts "=> #{messages('greeting')} #{usr_name}."
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  /\d/.match(num) && /^\d*\.?\d{0,3}$/.match(num)
end

def only_digits?(num)
  !(/\D/.match?(num))
end

def valid_loan_amt?(amt)
  (amt.to_i > 0) && only_digits?(amt)
end

def get_loan_amount
  amount = ""
  prompt('loan_amount?')
  loop do
    amount = gets.chomp

    break if valid_loan_amt?(amount)
    prompt('invalid_loan_amt')
  end
  amount.to_i
end

def valid_apr?(num)
  integer?(num) || float?(num)
end

def get_apr
  apr = ""
  prompt('apr?')
  loop do
    apr = gets.chomp

    break if valid_apr?(apr)
    prompt('invalid_apr')
  end
  apr.to_f
end

def valid_term?(term)
  integer?(term)
end

def get_mo_loan_term
  duration = ""
  prompt('loan_duration?')
  loop do
    duration = gets.chomp

    break if valid_term?(duration)
    prompt('invalid_loan_duration')
  end
  duration.to_i
end

def calculate_monthly_interest(apr)
  ((apr / 100) / 12)
end

def calculate_mo_pymnt(loan_amt, mo_int, loan_term)
  mo_pymnt = loan_amt * (mo_int / (1 - (1 + mo_int)**(-loan_term)))
  mo_pymnt.floor(2)
end

def calculate_again?
  prompt('calculate_again?')

  answer = gets.chomp.downcase
  %w(y yes).include?(answer)
end

def print_result(loan_amt, apr, loan_term, mo_pymnt)
  puts format(messages('print_loan_amt'), loan_amt: "$#{loan_amt}")
  puts format(messages('print_apr'), apr: "#{apr}%")
  puts format(messages('print_loan_term'), loan_term: loan_term.to_s)
  puts format(messages('print_monthly_payments'), mo_pymnt: "$#{mo_pymnt}")
end

system 'clear'
prompt('welcome')
sleep 1
name = get_name
print_name(name)
sleep 1
prompt('intro')
sleep 2
system 'clear'

loop do
  loan_amount = get_loan_amount
  apr = get_apr
  mo_loan_term = get_mo_loan_term

  mo_interest = calculate_monthly_interest(apr)
  monthly_pymnt = calculate_mo_pymnt(loan_amount, mo_interest, mo_loan_term)

  sleep 1
  prompt('interim_message')
  sleep 2
  system 'clear'
  print_result(loan_amount, apr, mo_loan_term, monthly_pymnt)
  sleep 3
  break unless calculate_again?
end

prompt('thank_you')
