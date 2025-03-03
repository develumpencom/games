class Bgg
  def self.search(query, type = "boardgame")
    response = connection.get("search", { query:, type: })

    if response.success?
      parse_search(response.body)
    else
      Rails.logger.error("[BGG Search] #{response.status} - #{response.body}")
      []
    end
  end

  def self.thing(id)
    response = connection.get("thing", { id: })

    if response.success?
      parse_thing(response.body)
    else
      Rails.logger.error("[BGG Thing] #{response.status} - #{response.body}")
      nil
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

  def self.parse_thing(response)
    xml_doc = Nokogiri::XML(response)

    thing = xml_doc.xpath("//item").first

    case thing["type"]
    when "boardgame"
      parse_boardgame(thing)
    when "boardgameexpansion"
      parse_boardgameexpansion(thing)
    else
      Rails.logger.error("[BGG Thing] Unknown type: #{thing["type"]}")
      nil
    end
  end

  def self.parse_boardgame(thing)
      {
        id: thing["id"],
        type: thing["type"],
        name: thing.xpath("name[@type='primary']/@value").text,
        thumbnail: thing.xpath("thumbnail").text,
        image: thing.xpath("image").text,
        description: thing.xpath("description").text,
        yearpublished: thing.xpath("yearpublished/@value").text,
        minplayers: thing.xpath("minplayers/@value").text,
        maxplayers: thing.xpath("maxplayers/@value").text,
        playingtime: thing.xpath("playingtime/@value").text,
        minplaytime: thing.xpath("minplaytime/@value").text,
        maxplaytime: thing.xpath("maxplaytime/@value").text,
        minage: thing.xpath("minage/@value").text,
        categories: thing.xpath("link[@type='boardgamecategory']").map {
          |category| { id: category["id"], value: category["value"] }
        },
        mechanics: thing.xpath("link[@type='boardgamemechanic']").map {
          |mechanic| { id: mechanic["id"], value: mechanic["value"] }
        },
        family: thing.xpath("link[@type='boardgamefamily']").map {
          |family| { id: family["id"], value: family["value"] }
        },
        expansions: thing.xpath("link[@type='boardgameexpansion']").map {
          |expansion| { id: expansion["id"], value: expansion["value"] }
        },
        designers: thing.xpath("link[@type='boardgamedesigner']").map {
          |designer| { id: designer["id"], value: designer["value"] }
        },
        artists: thing.xpath("link[@type='boardgameartist']").map {
          |artist| { id: artist["id"], value: artist["value"] }
        },
        publishers: thing.xpath("link[@type='boardgamepublisher']").map {
          |publisher| { id: publisher["id"], value: publisher["value"] }
        }
      }
  end

  def self.parse_boardgameexpansion(thing)
    {
      id: thing["id"],
      type: thing["type"],
      name: thing.xpath("name[@type='primary']/@value").text,
      thumbnail: thing.xpath("thumbnail").text,
      image: thing.xpath("image").text,
      description: thing.xpath("description").text,
      yearpublished: thing.xpath("yearpublished/@value").text,
      minplayers: thing.xpath("minplayers/@value").text,
      maxplayers: thing.xpath("maxplayers/@value").text,
      playingtime: thing.xpath("playingtime/@value").text,
      minplaytime: thing.xpath("minplaytime/@value").text,
      maxplaytime: thing.xpath("maxplaytime/@value").text,
      minage: thing.xpath("minage/@value").text,
      categories: thing.xpath("link[@type='boardgamecategory']").map {
        |category| { id: category["id"], value: category["value"] }
      },
      mechanics: thing.xpath("link[@type='boardgamemechanic']").map {
        |mechanic| { id: mechanic["id"], value: mechanic["value"] }
      },
      family: thing.xpath("link[@type='boardgamefamily']").map {
        |family| { id: family["id"], value: family["value"] }
      },
      expansions: thing.xpath("link[@type='boardgameexpansion']").map {
        |expansion| { id: expansion["id"], value: expansion["value"] }
      },
      designers: thing.xpath("link[@type='boardgamedesigner']").map {
        |designer| { id: designer["id"], value: designer["value"] }
      },
      artists: thing.xpath("link[@type='boardgameartist']").map {
        |artist| { id: artist["id"], value: artist["value"] }
      },
      publishers: thing.xpath("link[@type='boardgamepublisher']").map {
        |publisher| { id: publisher["id"], value: publisher["value"] }
      }
    }
  end
end
