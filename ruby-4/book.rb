class Book
	attr_accessor :title, :author, :isbn, :publisher, :publish_year

	def initialize(title, author, isbn, publisher, publish_year)
		@title = title
		@author = author
		@isbn = isbn
		@publisher = publisher
		@publish_year = publish_year 
	end
end