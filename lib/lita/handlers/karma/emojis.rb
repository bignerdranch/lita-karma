require 'json'

custom_emoji_file = File.read File.dirname(__FILE__) + '/custom_emoji.json'
custom_hash = JSON.parse(custom_emoji_file)

emoji_keys = custom_hash.keys

default_emoji_file = File.read File.dirname(__FILE__) + '/emoji.json'
hash = JSON.parse(default_emoji_file)
hash.map { |item| emoji_keys += item['short_names'] }

EMOJI_KEY_MAP = {}
emoji_keys.map { |key| EMOJI_KEY_MAP[key] = true }

# puts EMOJI_KEY_MAP
