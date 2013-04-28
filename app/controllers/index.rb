get '/' do
  erb :index
end

get '/posts' do
  erb :posts
end


post '/tag/:tag' do
  @tag = Tag.find_by_text(params[:tag])
  erb :tag
end

get '/tag/:tag' do
  @tag = Tag.find_by_text(params[:tag])
  erb :tag
end

get '/_tags' do
  erb :_tags
end

get '/_tag' do
  erb :_tag
end

get '/_posts' do
  erb :_posts
end


get '/post/:id' do
  @post = Post.find_by_id(params[:id])
  @tag = @post.tags.all
  erb :post
end

post '/post/:id' do
  @post = Post.create(title: params[:title], body: params[:body])
  
  @tags = params[:tags].split(",").map do |t|
    Tag.create(text: t)
  end
    
  @tags.each do |t|
    @post.tags << t
  end
  erb :post
end

get '/create_post' do
  erb :create_post
end

get '/:text' do
  puts params
  @tag = params[:text]
  erb :tag
end

