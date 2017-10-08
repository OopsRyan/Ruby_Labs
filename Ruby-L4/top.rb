require_relative "book"
require_relative "user"
require_relative "library"

# create some books 
books = Array.new

book_1 = Book.new("The Sun and Her Flowers", "Rupi Kaur", "9781471165825", "SIMON &AMP; SCHUSTER UK", "3/10/2017")
book_2 = Book.new("Simply Simon's", "Simon", "9781785301360", "	BLACK & WHITE PUBLISHING", "12/10/2017")
book_3 = Book.new("Gooch The Autobiography", "Colm Cooper", "9781848272187", "TRANSWORLD IRELAND", "5/10/2017")
book_4 = Book.new("Operation Trumpsformation", "Ross O'Carroll-Kelly", "9780241978016", "PENGUIN IRELAND", "21/9/2017")
book_5 = Book.new("The child in time", "Ian McEwan", "9780099755012", "Random House", "7/7/2016")

# create an array for recording users' information
users = Array.new

user_1 = User.new("Ursula Roberts", "9725 Pouros Ports North Bradford, DC 80367-6198", "Male", 29)
user_2 = User.new("Ansel Pagac", "604 Thora Road Suite 665 Cordelialand, ID 36930", "Male", 30)
user_3 = User.new("Leta Hodkiewicz", "83066 Runolfsdottir Divide Apt. 658 North Serenityview, AK 41038", "Female", 23)

users << user_1 << user_2 << user_3

# create a library

inventory = {book_1 => 1, book_2 => 3, book_3 => 2, book_4 => 4, book_5 => 1}

library = Library.new("James Joyce", inventory, users)

puts "Today is #{DateTime.now.to_date}, welcome to #{library.name} library!"
puts "\n"
# Show inventory of library
library.inventory_to_s
puts "\n"

# User_1 borrows books
user_1_books = Array.new
user_1_books << book_1 << book_2 << book_3
puts "=> #{user_1.name} is borrowing books."
library.lend_books(user_1_books, user_1)
puts "\n"

# User_2 borrows books
user_2_books = Array.new
user_2_books << book_4 << book_2 << book_1 << book_3 << book_5 
puts "=> #{user_2.name} is borrowing books."
library.lend_books(user_2_books, user_2)
puts "\n"

# User_3 borrows books
user_3_books = Array.new
user_3_books << book_4 << book_2 << book_3 << book_1 << book_5
puts "=> #{user_3.name} is borrowing books."
library.lend_books(user_3_books, user_3)
puts "\n"

library.inventory_to_s
puts "\n"

# User_1 returns books
user_1_books = Array.new
user_1_books << book_2 << book_1
puts "=> #{user_1.name} is returning books."
library.return_books(user_1_books, user_1)
puts "\n"
library.inventory_to_s

