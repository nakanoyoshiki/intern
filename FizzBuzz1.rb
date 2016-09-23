list = []
3.step(100, 3) {|i| list[i] = 'Fizz' }
5.step(100, 5) {|i| list[i] = list[i].to_s + 'Buzz' }
(1..100).each do |i|
  unless list[i].nil?
    puts list[i]
  else
    puts i
  end
end