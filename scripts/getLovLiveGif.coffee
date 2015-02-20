﻿# Description:
#   TumblrからLoveLiveのアニメGifを取得する。
#
# Dependencies:
#   "tumblrbot": "0.1.0"
#
# Configuration:
#   HUBOT_TUMBLR_API_KEY - A Tumblr OAuth Consumer Key will work fine
#
# Commands:
#   hubot gif me - Returns a random gif from a random blog
#   hubot food mosh - Returns a random gif from foodmosh.tumblr.com
#   hubot fluxmachine - Returns a random gif from fluxmachine.tumblr.com
#   hubot android - Returns a random gif from milosrajkovic.tumblr.com
#   hubot nic cage me - Returns a random gif from gifolas-cage.tumblr.com
#
# Author:
#   SUMERAGI

tumblr = require "tumblrbot"
SOURCES = {
  "lovelivegif.tumblr.com"
}

getGif = (blog, msg) ->
  tumblr.photos(blog).random ({"にこ"},post) ->
    msg.send post.photos[0].original_size.url

module.exports = (robot) ->
  robot.respond /lovelive/i, (msg) ->
    blog = msg.random Object.keys(SOURCES)
    getGif blog, msg
