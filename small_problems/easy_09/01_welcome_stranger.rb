# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.
def format_name(array)
  array.join(' ')
end

def format_job_info(hash)
  position = ''
  
  hash.each do |k, v|
    position << "#{v} "
  end
  
  position
end

def greetings(name, info)
  name = format_name(name)
  job = format_job_info(info)
  
  puts "Hello, #{name}! Nice to have a #{job}around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
