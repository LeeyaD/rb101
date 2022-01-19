# The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password. However, the program throws an error. What is the problem and how can you fix it?
# ISSUE: we're not passing a reference to the password around, it's initialized to nil outside of the #set_password method, so it doesn't get reassigned to the user' input. Even if it did, we're not passing it into #verify_pasword so authentication would fail everytime.

# Once you get the program to run without error, does it behave as expected? Verify that you are able to log in with your new password.
# If didn't because within #set_password, even if we passed in the variable 'password' we were just reassigning the method local variable password to the user's input. What we need to do is assign 'password' to the return value of #set_password

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)