# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

# A: I say the returned string will be a different object that the one passed in as an argument - CORRECT

def spin_me(str)
  str.tap{|n|p n.object_id}.split.tap {|n| p n.object_id}.each do |word|
    word.reverse!
  end.tap{|n| p n.object_id}.join(" ").tap{|n| p n.object_id}
end

spin_me("hello world") # "olleh dlrow"