def is_simple(num)
  num = num.abs

  if num == 0 then
    return false
  elsif num == 1 || num == 2 || num == 3 then
    return true
  end


  for i in 2..(num/2+1) do
    if num % i == 0 then
      return false
    end

  end

  return true


end


def max_simple_divider(number)
  number = number.abs

  if number == 0 then
    return 
  elsif number == 1 || number == 2 || number == 3 then
    return number
  end

  if is_simple(number) == true then
    return number
  end

  max_divider = 1

  for potential_div in 2..(number/2+1) do
    if number % potential_div == 0 then
      if is_simple(potential_div) == true  && potential_div > max_divider then
        max_divider = potential_div
      end
    end

  end

  return max_divider

end


def multiply_digits_except_divisible_on_5(number)
  mult = 1
  
  while number != 0 do
    mult *= number % 10
    number /=  10
  end

  return mult

end

