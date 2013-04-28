get '/' do
  erb :index
end

get '/posts' do
  erb :posts
end

# post '/tag/:id' do
#   @tag = Tag.find_by_text(params[:id])
#   erb :tag
# end

get '/tag/:id' do
  @tag = Tag.find_by_id(params[:id])
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
  @tags = @post.tags
  @date = @post.format_date
  erb :post
end

post '/post/:id' do
  @post = Post.create(title: params[:title], body: params[:body])
  
  @tags = Tag.parse(params[:tags])
  @tags.each {|t| puts "Hey it's #{t.text} with id of #{t.id}" }
    
  @tags.each do |t|
    @post.tags << t
  end
  erb :post
end

get '/create_post' do
  erb :create_post
end


