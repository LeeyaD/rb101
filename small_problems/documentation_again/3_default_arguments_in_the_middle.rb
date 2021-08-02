#Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6) 
#(X)=> ArgumentError
#(O)=> [4, 5, 3, 6]
#Use the ruby documentation to determine what this code will print.

#Ruby new the no of args being passed in was less than what was defined. It assigned 4 to the first arg position, 6 to the last and--btwn 'b' & 'c'--5 went to 'b'