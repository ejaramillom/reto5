
# Starts game of 5!!
#here i assume that the user assigned the value of the document including the questions and answers
class Game
  attr_reader = :name

	#take the document and convert into questions and answers
	def check_doc(name) #check_doc('dictionary.txt')

	  file_lines = File.readlines(name)
	  @define = []
	  @answer = []
	  counter = 0
	  countres = 0
	  limit = 5 #in a more elaborated code file, this value is file_lines.size

	  return [] unless File.file?(name)

	  while counter < limit do
		  file_lines.each do |line|
		    counter += 1
		    if line.include? "(Definicion)"
		      countres +=1
		      @define[countres] = line
		    elsif line.include? "(Respuesta)"
		      @answer[countres] = line
		    end
		  end
	  end
	end

	def answer()

	  iter = 0
    @define.shift
    @answer.shift

	  puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos! \n"
    puts ""
	  puts "A continuación verás la primera pregunta, debes responder en minúsculas, sin tildes!. \n"
    puts ""

    #puts "#{ans[iter]}" == "alias"
    puts @define

	  @define.each do |line|
			puts ""
	    print "> "
	    puts line
	    print ">"
	    guess = $stdin.gets.chomp
			until @answer[iter].include? guess
				puts "BZZZZDDDD! te encalambraste."
				guess = $stdin.gets.chomp
			end
	    iter +=1
		end

	    puts "Felicidades! tienes el talento necesario, juega de nuevo si quieres! Game Over!"
	end
end


game = Game.new
game.check_doc('dictionary.txt')
game.answer()
# Finaliza el reto cinco!
