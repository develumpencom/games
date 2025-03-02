class Bgg
  SEARCH_TYPES = %i[boardgame boardgameaccessory boardgameexpansion rpgitem]

  def self.search(query, type = "boardgame")
    response = connection.get("search", { query: query, type: type })

    if response.success?
      parse_search(response.body)
    else
      logger.error("[BGG Search] #{response.status} - #{response.body}")
      []
    end
  end


  private

  def self.connection
    Faraday.new(url: "https://boardgamegeek.com/xmlapi2/")
  end

  def self.parse_search(response)
    xml_doc = Nokogiri::XML(response)

    xml_doc.xpath("//item").map do |item|
      {
        id: item["id"],
        type: item["type"],
        name: item.xpath("name/@value").text,
        yearpublished: item.xpath("yearpublished/@value").text
      }
    end
  end
end
