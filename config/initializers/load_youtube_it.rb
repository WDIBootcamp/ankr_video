require 'ostruct'

config_hash = {"dev_key" => ENV['DEV_KEY'], "username" => ENV['YT_ADMIN'], "password" => ENV['YT_PASSWORD']}

YouTubeITConfig =  OpenStruct.new(config_hash)

