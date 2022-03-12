class Hangman

    def initialize 
        letter = ("a"..."z").to_a
        word = words.sample
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

    def teaser
        word_teaser = ""
        @word.first.size.time do
            word_teaser += "_ "
    end
        puts word_teaser
    end

    def make_guess
        puts "Enter a letter"
        guess = gets.chomp

        # when user guess that word, make sure if part of the word
        great_guess = @word.first.include? guess

        if great_guess
            puts "Great guess!"
        else
            puts "Sorryyyyyy.. try again"
        end

    end


    def begin
        # where we ask the user/ player for a letter
        puts "Start new game... your clue is #{ @word.first.size } characters long"

        

        puts "your clue is #{@word.last}"

        make_guess

    end

end

game = Hangman.new
game.begin