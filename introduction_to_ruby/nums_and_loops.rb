def is_simple(num)
  num = num.abs

  if num == 0 || num == 1 then
    return false
  elsif num == 2 || num == 3 then
    return true
  end


  for i in 2..(num/2+1) do
    if num % i == 0 then
      return false
    end

  end

  return true


end


def max_simple_divider(number)  # метод 1
  number = number.abs

  if number == 0 || number == 1 then
    return 
  elsif number == 2 || number == 3 then
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


def multiply_digits_except_divisible_on_5(num)  # метод 2
  num = num.abs
  mult = 1
  
  while number != 0 do
    mult *= number % 10
    number /=  10
  end

  return mult

end


def multiply_digits(num)
  num = num.abs

  mult = 1
  while num != 0 do
    mult *= num % 10
    num /= 10
  end

  return mult

end

def max_notsimple_odd_divider(num)
  num = num.abs
  max_divider = 1
  
  for i in 2..(num/2+1) do
    if num % i == 0 then
      if i % 2 != 0 && is_simple(i) == false and i > max_divider then
        max_divider = i
      end
    end

  end

  return max_divider

end


def find_gcd(num)  # метод 3
  max_divider = max_notsimple_odd_divider(num)
  mult_digits = multiply_digits(num)
  
  return max_divider.gcd(mult_digits)

end
