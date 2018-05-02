require 'net/http'

class ScheduleController < ApplicationController
  def index
    url = URI.parse('http://api.tvmaze.com/schedule')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP::start(url.host, url.port) { |http|
      http.request(req)
    }
    hash = JSON.parse res.body
    hash.map! { |series| series["show"]["name"] }

    @schedule = hash
  end
end
