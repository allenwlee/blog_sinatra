get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:word' do
  p params[:word]
end

post '/' do
  p params[:word]
end
