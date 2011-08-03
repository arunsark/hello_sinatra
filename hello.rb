
get '/' do
  'Hello World!'
end

get '/hello/:name' do |n|
  "Hello #{n}"
end

get '/haml/:name' do |n|
  @name = n
  haml :index
end
