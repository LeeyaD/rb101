# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

  if true
    greeting = "hello world"
  end
  
  puts greeting
  # => "hello world" - WRONG! ---> nil
  # O_O Why? B/c when an if block isn't executed, the variable gets initialized to nil