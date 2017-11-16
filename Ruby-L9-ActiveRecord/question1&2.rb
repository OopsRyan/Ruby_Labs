require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "library")

class CreateRecords < ActiveRecord::Migration[5.0]
	def self.up
		create_table :users do |t|
			t.string :name
			t.integer :age
		end

		create_table :books do |t|
			t.string :title
			t.string :author
		end

		create_table :records do |t|
			t.belongs_to :user, index: true
			t.belongs_to :book, index:true
			t.datetime :borrowed_when
			t.datetime :dueback
			t.timestamps
		end
	end

	def self.down
		drop_table :users
		drop_table :books
		drop_table :records
	end
end

class User < ActiveRecord::Base
end

class Book < ActiveRecord::Base
end

class Record < ActiveRecord::Base
end



def read_from_db()

	print_records = lambda {|record| p record}

	users = User.find([1,2])
	users.each(&print_records)

	books = Book.all
	books.each{|a| p a}
	records = Record.all
	records.each{|a| p a}
end


if User.table_exists? || Book.table_exists? || Record.table_exists? then
	read_from_db()
	CreateRecords.down	
else
	CreateRecords.up

	user_create = -> name, age {User.create(:name => name, :age => age)}
	user1 = user_create.("Bernardo Jones II", 21)
	user2 = user_create.("Prof. Cynthia Champlin PhD", 43)
	user3 = user_create.("Mr. Donnie O'Reilly", 46)

	book1 = Book.create(:title => "The Snowman", :author => "Jo Nesbo")
	book2 = Book.create(:author => "Rogan", :title => "Kill Bill")
	book3 = Book.create(:title => "The Break", :author => "Marian Keyes")
	## assume borrow days are 14 days
	record1 = Record.create(:user_id => user1.id, :book_id => book2.id, :borrowed_when => Time.now, :dueback => Time.now+14)
	record2 = Record.create(:user_id => user2.id, :book_id => book3.id, :borrowed_when => Time.now-7, :dueback => Time.now+7)
	record3 = Record.create(:user_id => user3.id, :book_id => book1.id, :borrowed_when => Time.now-14, :dueback => Time.now)

	# read database cache, so print record will be empty. run again, and the cache will be clean.
	read_from_db()
end


