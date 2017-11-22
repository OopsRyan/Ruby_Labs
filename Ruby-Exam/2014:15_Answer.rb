######## question1
class Fixnum
	def is_prime?
		flag = true
		(1..self).to_a.each do |i|
			if (self%i == 0) && self != i && i != 1 then
				flag = false
			end
		end
		flag
	end
end

p 13.is_prime?
p 10.is_prime?

