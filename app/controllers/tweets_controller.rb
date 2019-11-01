class TweetsController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = "cjWY0AAVcFMUsluiUH0BxNuT9"
      config.consumer_secret = "Yuhb4cr7AedtAJtosSQCtyf7CdMOQiX13ZgtKQ1F74PwtHAUOf"
      config.access_token = "928205057983627264-1lCMtYFsu3KCKzUVNXIGJSCYDucn4s2"
      config.access_token_secret = "BSIKR93AtNsvXtsfCTPt2WYhyHX30vVBVZ9VXIXyMzvSw"
    end

    #@followers = client.followers
    #@following = client.following
    #@timeline = client.user_timeline("Bellam_3415")

  end
end
