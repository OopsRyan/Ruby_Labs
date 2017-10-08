class User
	attr_accessor :name, :address, :id, :sex, :age

	def initialize(name, address, sex, age)
		@id = self.object_id
		@name = name
		@address = address
		@sex = sex
		@age = age
	end
end