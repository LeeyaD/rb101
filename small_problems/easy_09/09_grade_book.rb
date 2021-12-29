# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

# Numerical Score - Letter Grade
# 90 <= score <= 100	'A'
# 80 <= score < 90	'B'
# 70 <= score < 80	'C'
# 60 <= score < 70	'D'
# 0 <= score < 60	'F'
# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.
GRADES = { A: (90..100), B: (80..89), C: (70..79), D: (60..69), F: (0..59) }

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3
  grade = nil

  GRADES.each_pair do |key, value|
    grade = key.to_s if value.include?(average)
  end

  grade
end

p get_grade(95, 90, 93) == "A"
p get_grade(85, 90, 93) == "B"
p get_grade(50, 50, 95) == "D"