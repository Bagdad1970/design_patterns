def is_simple(num)
  if num < 0
    return nil

  if num == 0 || num == 1 
    return false
  elsif num == 2 || num == 3 
    return true
  end

  for i in 2..(num/2+1) do
    if num % i == 0
      return false
    end

  end

  return true

end


def max_simple_divider(number)  # метод 1
  if number < 0
    return nil

  if number == 0 || number == 1
    return nil
  elsif number == 2 || number == 3 
    return number
  end

  if is_simple(number) == true
    return number
  end

  max_divider = 1

  for potential_div in 2..(number/2+1) do
    if number % potential_div == 0
      if is_simple(potential_div) == true  && potential_div > max_divider
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
    if num % i == 0
      if i % 2 != 0 && is_simple(i) == false and i > max_divider
        max_divider = i
      end
    end

  end

  return max_divider

end

def GCD(a, b)
  if a == 1 || b == 1
    return 1
  end

  if a % b == 0
    return b
  elsif b % a == 0
    return a
  end

  while a != b
    if a > b
      a -= b
    else
      b -= a
    end
  end

  return a

end


def find_gcd(num)  # метод 3
  max_divider = max_notsimple_odd_divider(num)
  mult_digits = multiply_digits(num)
  
  return GCD(max_divider, mult_digits)

end
