# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def non_alpha?(char)
  char.match?(/[^A-Za-z]/)
end

def staggered_case(string, non_alpha = false) #further exploration
  result = ''
  need_upper = true
  string.chars.each do |char|
    if non_alpha
      if non_alpha?(char)
        result += char
        next
      end
    end

    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

puts staggered_case('I Love Launch School!', true) == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS', true) == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 nUmBeRs'

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
