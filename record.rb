class Record
	attr_accessor :record_id, :user_id, :book_isbn, :borrow_date, :due, :has_return

	def initialize(user_id, book_isbn, borrow_date, due, has_return = false)
		@record_id = self.object_id
		@user_id = user_id
		@book_isbn = book_isbn
		@borrow_date = borrow_date
		@due = due
		@has_return = has_return
	end
end
