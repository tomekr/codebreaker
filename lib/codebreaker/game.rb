module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      # use the Extract Method refactoring to introduce abstractions that more
      # clearly express the intent of the guess() method. Here we replace the
      # @secret[0] == guess[0] with the exact_match method to make the code
      # more readable to the next person to stumble on this code
      #
      # if @secret[0] == guess[0]
      @output.puts '+'*exact_match_count(guess) + '-'*number_match_count(guess)
    end

    def number_match_count(guess)
      number_match_count = 0
      (0..3).each do |index|
        if number_match?(guess, index)
          number_match_count += 1
        end
      end
      number_match_count
    end

    def exact_match_count(guess)
      exact_match_count = 0
      (0..3).each do |index|
        if exact_match?(guess, index)
          exact_match_count += 1
        end
      end
      exact_match_count
    end

    def exact_match?(guess, index)
      guess[index] == @secret[index]
    end

    def number_match?(guess, index)
      @secret.include?( guess[index] ) and not exact_match?( guess, index )
    end
  end
end
