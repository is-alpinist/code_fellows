class Book
	
	attr_accessor 
	$h = {}

	def initialize(title, shelf) 
		@title = title
		@shelf = shelf
		update_books
	end

	def update_books
		$h.store(@title,@shelf)
	end

	def self.count_titles
		$h.length
	end

	def self.list_unique_shelves
		($h.values).uniq
	end

	def self.list_titles()
		$h.keys	
	end

	def en_shelf(new_shelf)
		@shelf = new_shelf
		update_books
	end
	def un_shelf
		@shelf = "Unshelved"
		update_books
	end
end

class Shelf < Book
	def self.which_books
		puts "Contents by Shelf: "
		$h.each{|key,value|puts"Shelf: #{value}	Title: #{key}"}

	end	
	print "\n"	
end

class Library < Book
	def self.how_many_books
		puts "The library has #{Library.count_titles} books:"
		puts Library.list_titles 
		print "\n"
	end
	def self.which_shelves
		print "This library has #{Library.list_unique_shelves.count} shelves:\n" 
		Library.list_unique_shelves.each do |i|
			puts i
		end
		print "\n"
	end
end

ISBN1 = Book.new("World Since 1917", "History")
ISBN2 = Book.new("Globalization and It's Discontents", "Economics")
ISBN3 = Book.new("Chez Panisse Vegetables", "Culinary")
ISBN4 = Book.new("The Zookeeper's wife", "Fiction")
ISBN4.en_shelf("History")
ISBN1.un_shelf
Library.how_many_books
Library.which_shelves
ISBN4.un_shelf
Library.how_many_books
Shelf.which_books


