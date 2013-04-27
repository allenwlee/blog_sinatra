get '/' do
  erb :index
end

get '/posts' do
  erb :posts
end

post '/posts' do
  @post = Post.create(title: params[:title], body: params[:body])
  
  @tags = params[:tags].split(",").map do |t|
    Tag.create(text: t)
  end
    
  @tags.each do |t|
    @post.tags << t
  end
  erb :posts
end

get '/:id/post/' do
  @post = Post.find(params[:id])
end

get '/:tag' do
  @tag = Tag.find_by_text(params[:tag])
  erb :tag
end


get '/_tags' do
  erb :_tags
end

get '/_tag' do
  erb :_tag
end

get '/:id' do
  @post = Post.where("id=?", params[:id]).first
  erb :post
end

get '/:text' do
  puts params
  @tag = params[:text]
  erb :tag
end
