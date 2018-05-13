require "yaml"
require "pry"

def load_library(location)
  emoticon = YAML.load_file(location)
  hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
}
  emoticon.each do |meaning,emoticons|
    english_emoticon = emoticons[0]
    japanese_emoticon = emoticons[1]

    hash["get_meaning"][japanese_emoticon] = meaning
    hash["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  hash
end

def get_japanese_emoticon(location, emoticon)
  hash_emoticon = load_library(location)
  hash_emoticon.each do |categories|
    if categories[0] == 'get_emoticon'
      if categories[1][emoticon] != nil
        return categories[1][emoticon]
      else
        return "Sorry, that emoticon was not found"
      end
    end
  end
end

def get_english_meaning(location, emoticon)
  hash_emoticon = load_library(location)
  hash_emoticon.each do |categories|
    if categories[0] == 'get_meaning'
      if categories[1][emoticon] != nil
        return categories[1][emoticon]
      else
        return "Sorry, that emoticon was not found"
      end
    end
  end
end
