# What is the return value of map in the following code? Why?
#[nil, 'bear']
p ({ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end)