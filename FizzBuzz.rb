class Multier
  def self.divisible(count, multiplier)
    return count  if (count % multiplier).zero?
  end
end

def Fifteen(count)
  Multier.divisible(count,15)
end
def Three(count)
  Multier.divisible(count,3)
end
def Five(count)
  Multier.divisible(count,5)
end

(1..100).each do |count|
  puts case count
         when Fifteen(count)
           "FizzBuzz"
         when Three(count)
           "Fizz"
         when Five(count)
           "Buzz"
         else
           count
       end
end