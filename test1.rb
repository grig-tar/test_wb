require 'JSON'
require 'net/http'

edge_list = [ "http://edge1.iptrunks.ru", "http://edge2.iptrunks.ru" ]

video_list = []
edge_list.each{|server|
  uri = URI("#{server}/rest-api/stream/find_all")
  response = Net::HTTP.get(uri)
  full_video_list = JSON.parse(response)
  video_list << full_video_list.select{|v| v['status'] == "PLAYING"}
}

video_statistic = {}
video_list.flatten.each{|v|
  name = v['name']
  if video_statistic[name].nil?
    video_statistic[name] = 1
  else
    video_statistic[name] += 1
  end
}

puts "video - count\n-------------"
video_statistic.sort_by{|name, count| count }.reverse.take(10).each{|n, c| puts "#{n} - #{c}"}
