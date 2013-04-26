get '/' do
  erb :index
end

post '/post' do
  @post = Post.create(title: params[:title], body: params[:body])
  
  @tags = params[:tags].split(",").map do |t|
    Tag.create(text: t)
  end
    
  @tags.each do |t|
    @post.tags << t
  end
  erb '/post'
end

get '/post' do
  erb :post
end

get '/_tags' do
  erb :_tags
end

get '/_tag' do
  erb :_tag
end

get '/:title' do
  erb :post
end
