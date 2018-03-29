require 'JSON'
require 'net/http'

def get_published (server)
  published = []
  uri = URI("http://#{server}/rest-api/stream/find_all")

  response = Net::HTTP.get(uri)
  full_video_list = JSON.parse(response)
  full_video_list.select{|v|
    v['status'] == "PUBLISHING"
  }.each{|v|
    published << v['name']
  }
  published
end

def post_republish (origin_server, edge_server, video_name)
  uri = URI("http://#{origin_server}/rest-api/stream/republish")
  body = { "edge_address": edge_server, "name": video_name }.to_json

  request = Net::HTTP::Post.new(uri)
  request.body = body
  request.content_type = 'application/json'

  response = Net::HTTP.start(uri.hostname){|http|
    http.request(request)
  }
  if response.code == "200"
    puts "Video: #{video_name} republished on origin: #{origin_server} to edge: #{edge_server}"
  else
    puts "Something goes wrong while republishing video: #{video_name} on origin: #{origin_server} to edge: #{edge_server}\n\tmessage: #{response.message}"
  end
end


origin = [ "origin1.iptrunks.ru", "origin2.iptrunks.ru" ]
edge = [ "edge1.iptrunks.ru", "edge2.iptrunks.ru" ]

origin_published = {}
origin.each{|server|
  origin_published[server] = get_published(server)
}

edge_published = {}
edge.each{|server|
  edge_published[server] = get_published(server)
}

origin_published.each{|os, ov|
  edge_published.each{|es, ev|
    (ov - ev).each{|v|
      post_republish(os, es, v)
    }
  }
}

