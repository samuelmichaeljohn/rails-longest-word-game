require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
    all_letters = ('A'..'Z').to_a
    @letters = all_letters.sample(7)
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = URI.open(url).read
# user = JSON.parse(user_serialized)
    @word_data = JSON.parse(word_serialized)

    if @word_data["found"] == true
      @word_score = @word["length"]
    else
      "sorry that word can't be made out of #{@letters}"
    end
  end

    # "found": true,
    # "word": "absolutely",
    # "length": 10

end
