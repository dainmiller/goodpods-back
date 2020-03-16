module WikipediaClient
  URL = "http://wikipedia.org"

  class Checker

    def self.search_by_topic topic
      JSON.parse(HTTParty.get(URL + "/topic/#{topic}").body)
    end


    def self.is_entity? word
      word and not self.search_by_topic(word).null?
    end
  end

end