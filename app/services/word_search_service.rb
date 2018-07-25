class WordSearchService
  def initialize(word)
    @word = word
  end

  def search
    data[:results][0][:lexicalEntries][0][:sentences].map do |sentence|
      if sentence[:regions].include?("North American")
        sentence[:text]
      end
    end.compact
  end

  private
  attr_reader :word

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1/entries/en/#{word}/sentences")
  end

  def response
    conn.get do |req|
      req.headers['app_key'] = ENV['OXFORD_API_KEY']
      req.headers['app_id'] = ENV['OXFORD_APP_ID']
    end
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end

end
