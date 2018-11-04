require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def score
    @score = 0
    @message = ""
    @lettero = params[:letters].split("|").join.downcase
    @new_word = params[:word].dup
    @try_word = params[:word].downcase.split('')
    url = URI.parse("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
    information = JSON.parse(url.open.read)

    @lettero.split("").each do |letter|
      if !@try_word.index(letter).nil?
        @try_word.delete_at(@try_word.index(letter))
      end
    end
    if !@try_word.empty?
      @message = "#{@new_word} cannot be made out of the #{params[:letters].split("|").join}"
    elsif information["found"]
      @score += @new_word.length
      @message = "Congratulations!!!"
    elsif information["found"] == false
      @message = "#{params[:word]} is not an english word :("
    end
  end

  def new
    @letters = []; 8.times{@letters  << (65 + rand(25)).chr}
  end
end


    # if (params[:word].upcase.match?(/#{params[:letters]}/) == false) && (params[:word].split("").each do |letter|
    #   params[:letters].split("|").join.include?(letter.upcase)
    #   end)
