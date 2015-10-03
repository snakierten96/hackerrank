# Solution:
# http://stackoverflow.com/questions/9469898/1-x-1-y-1-nfactorial
# https://answers.yahoo.com/question/index?qid=20091027134709AAVJlxi


# Eratostenovo sito - najrychlejsi sposob, ako urcit prvocisla mensie ako n
def eratosthenes(num)
  result = []
  primes = Array.new(num + 1, true)
  for i in 2..primes.length do
    if primes[i]
      j = i
      while j * i <= primes.length do
        primes[j * i] = false
        j += 1
      end
    end
  end
  for i in 2..primes.length do
    result << i if primes[i]
  end
  return result
end

input_fact = gets.chomp.to_i
result = 1
if input_fact == 1 
  result = 1
else
  primes = eratosthenes(input_fact)
  primes.each do |prime|
    num = input_fact
    exp = 0
    while num > 0 do
      div = num / prime
      num /= prime
      exp += div
    end
    result *= (2 * exp + 1) # equation from StackOverflow
   end
end
puts result % 1000007
