class WordSearchService
  def initialize(word)
    @word = word
  end

  def data
  end

  private
  attr_reader :word

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{word}")
  end

  


end
