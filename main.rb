require "sinatra"
require "sinatra/reloader"
require "movies"
require "stock_quote"
require "image_suckr"

# homepage
get "/" do
  erb :index
end

# movies page
get "/movies" do
  if params["input_title"].nil?
    erb :movies
  else
    @results = Movies.find_by_title(params[:input_title])
    erb :movies
  end
end

# stocks page
get "/stocks" do
  if params["input_stock"].nil?
    erb :stocks
  else
     @stock = StockQuote::Stock.quote(params[:input_stock])
    erb :stocks
  end
end


# images page
get "/images" do
  if params["input_image"].nil?
    erb :images
  else
    suckr = ImageSuckr::GoogleSuckr.new
    @image = suckr.get_image_url({"q" => params[:input_image]})
    erb :images
  end
end






