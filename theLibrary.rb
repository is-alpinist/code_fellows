class Shelf 						
#Each shelf should know what books it contains 
	attr_reader (:book)
#Shelf.new
	def initialize (theLibrary)
	theLibrary.add_shelf(self) 					#the Library gets a new shelf, self is the shelf name
	@books_on_this_shelf = [] 					#new array to keep track of shelf contents
	end
	def add_book_to_shelf(book)
		@books_on_this_shelf << book 			#append book too array 
	end
	def remove_book_from_shelf(book)
		@books_on_this_shelf.delete(book) 		#delete book from array
												#also deletes it from app
	end
	def list_shelf_of_books
		if @books_on_this_shelf.empty?			#looks up obj id gets/prints title
		else
		@books_on_this_shelf.each {|x| puts x.title} 
		end
	end

	
end
#--------------------------------------------------

class Library 		
	#library should be aware of a number of shelves
	# should have method to report all books it contains
	attr_reader(:name)
	def shelves
		@shelf = shelves
	end
#Library.new	
	def initialize(name)
		@name = name
		@shelves = []        					#new empty array of shelves
	end
	def add_shelf(shelf)						#append new shelf to array
		@shelves << shelf
	end
	def  report_all_books
		@shelves.each {|x|  x.list_shelf_of_books} 	#flip through shelves id get / print titles
	end
	def print_name
		puts "::: " + name + " :::"
	end
	def shelves_count
		puts  "The library has"
		puts  @shelves.count
		puts "shelves."
	end
end
#-------------------------------------------------


class Book 
 #book object have "enshelf" and "unshelf" methods 
 #that control what shelf the book is sitting on
	attr_reader :title
#Book.new
	def initialize(title)
	@title = title
	end
	def en_shelf(shelf)
		shelf.add_book_to_shelf(self)				#call add_book_to_shelf pass self; it's a book					
	end												
	def un_shelf(shelf)
		shelf.remove_book_from_shelf(self)			#call remove_book_from_shelf pass self; it's a book
		end											#this removes it forever.
end
#---------------------------------------------------



#make library
theLibrary =Library.new('My Chicago Library')
#make some books
book_a = Book.new("Container Atlas")
book_b = Book.new("New Moroccan")
book_c = Book.new("The Late American Novel")
book_d = Book.new("Chez Panisse Vegetables")
#make some shelves
Culinary = Shelf.new(theLibrary)
Architechture = Shelf.new(theLibrary)
Literature = Shelf.new(theLibrary)
History = Shelf.new(theLibrary)

#movebooks to shelves
book_a.en_shelf(Architechture)
book_b.en_shelf(Culinary)
book_c.en_shelf(Literature)
book_d.en_shelf(Culinary)


puts("Culinary shelf before enshelf:")
Culinary.list_shelf_of_books

#try to list empty shelf 
History.list_shelf_of_books


#move books around 
book_d.un_shelf(Culinary)

puts("Culinary shelf after unshelf:")
Culinary.list_shelf_of_books

theLibrary.print_name
theLibrary.shelves_count
theLibrary.report_all_books







