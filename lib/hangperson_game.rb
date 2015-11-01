require 'pry'

class HangpersonGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word, :guesses, :wrong_guesses
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
  def guess(letter)
    reg_exp = Regexp.new letter, true

    if word =~ reg_exp and guesses !~ reg_exp
      guesses << letter
    elsif word !~ reg_exp and wrong_guesses !~ reg_exp 
      wrong_guesses << letter
    else
      false
    end
  end
end
