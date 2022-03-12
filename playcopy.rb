class Hangman

    def initialize 
        letters = ("a"..."z").to_a
        word = words.sample
        @lives = 7
        @correct_guess = []
        @word_teaser = ""

        @word.first.size.time do
            @word_teaser += "_ "
    end

    def words
        [
            ["silence", "Need no words"],
            ["jogging", "Not gonna walk"],
            ["engaged", "Marriage is up next"],
            ["excited", "I bet you are happy"],
            ["forward", "Not on the reverse gear"],
        ]
    end

    def print_teaser last_guess
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
        
    end

    def update_teaser
        new_teaser = @word_teaser.split

        new_teaser.each_with_index do |letter, index|
            # replacing blank value with letters
            if letter == "_" && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end

        @word_teaser = new_teaser.join("")
    end
        
       
    end

    def make_guess
        # to check if user have sufficient lives to continue
        if @lives > 0
        puts "Enter a letter"
        guess = gets.chomp

        # when user guess that word, make sure if part of the word
        great_guess = @word.first.include? guess

        if great_guess
            puts "Great guess!"

            #correct value is stored in an array
            @correct_guess << guess

            # remove correct guess from the alphabet
            @letters.delete guess

            print_teaser guess
            make_guess
        else
            @lives -= 1
            puts "Sorryyyyyy.. try again. You have #{ @lives } guess left"
            make_guess
        end

        else
            puts "GAME OVER! Try againn next time"
        end


    end


    def begin
        # where we ask the user/ player for a letter
        puts "Start new game... your clue is #{ @word.first.size } characters long"

        

        puts "your clue is #{ @word.last }"

        make_guess

    end

end

game = Hangman.new
game.begin