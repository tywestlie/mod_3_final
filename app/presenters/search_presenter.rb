class SearchPresenter

  def initialize(word)
    @attrs = WordSearchService.new(word).search
  end

  def word
    @attrs[:id]
  end

  def all_sentences
    @attrs[:lexicalEntries].map do |attribute|
      attribute[:sentences]
    end
  end

  def filtered_sentences
    all_sentences[0].map do |sentence|
      if sentence[:regions].include?("North American")
        sentence[:text]
      end
    end.compact
  end
end
