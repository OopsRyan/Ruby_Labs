require_relative "record"
require "date"

class Library
	attr_accessor :name, :inventory, :user, :records 

	def initialize(name, inventory, users)
		@name = name
		@inventory = inventory
		@users = users
		@records = Array.new
	end

	# add some books into inventory
	def purchase_books(newbooks)
		newbooks.each {|book, number| inventory[book] = number}
	end

	# A user can only borrow one for each kind of books.
	def lend_books(books, user)
		if @users.include? user then
			books.uniq.each do |book| 
				if inventory[book] > 0 then
					inventory[book] -= 1
					add_a_record(user, book)
				else
					puts "Sorry, <#{book.title}> is unavailable."
				end
			end
		end
	end

	# Return a book to the library.
	def return_books(books, user)
		if @users.include? user then			
			(@records.select {|record| !record.has_return && record.user_id.eql?(user.id)}).each do |record|
				books.uniq.each do |book|
					if book.isbn == record.book_isbn then
						inventory[book] += 1
						record.has_return = true
						puts "Successfully return <#{book.title}> to the library"
					end
				end
			end
			check_records(user)
		end
	end

	# Create a new record for current transaction
	# One record is created for one book.
	# Every user can only borrow a book for 60 days.
	def add_a_record(user, book)
		now = DateTime.now.to_date
		borrow_days = 60
		due = now + borrow_days
		@records << Record.new(user.id, book.isbn, now, due)
		puts "Successfully lend <#{book.title}> to #{user.name}. Due:#{due}"
	end

	# Print out the inventory
	def inventory_to_s
		puts "------------------inventory----------------"
		inventory.each {|book, number| puts "Remain #{number} for <#{book.title}>"}
		puts "-------------------------------------------"
	end

	# Check records of a user.
	def check_records(user)
		@records.select{|record| !record.has_return && record.user_id == user.id}.each do |record|
			@inventory.each do |book,value|
				if book.isbn == record.book_isbn then
					puts "=> Warning! \n"
					puts "#{user.name} borrowed <#{book.title}> on #{record.borrow_date}, #{user.name} has to return it before #{record.due}."
				end
			end
		end
	end
end
