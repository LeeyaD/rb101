# As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

# Yes, we know that 24:00 isn't a valid time in 24-hour format. Humor us, though; it makes the problem more interesting.

MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def time_of_day(minutes)
  minutes += MINUTES_PER_DAY if minutes < 0

  days, minutes = minutes.divmod(MINUTES_PER_DAY)
  hours, min = minutes.divmod(MINUTES_PER_HOUR)

  "#{format("%02d", hours)}:#{format("%02d", min)}"
end

def after_midnight(time)
  return 0 if time == "24:00"
  time_array = time.split(":")
  time_array.map! { |e| e.to_i }
  hours, min = time_array[0, 2]

  minutes = hours * MINUTES_PER_HOUR + min
end

def before_midnight(time)
  return 0 if time == "24:00"
  time_array = time.split(":")
  time_array.map! { |e| e.to_i }
  hours, min = time_array[0, 2]

  minutes = hours * MINUTES_PER_HOUR - min
end


puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0