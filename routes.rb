class Items < Sinatra::Base
  get "/" do
    erb :home
  end

  get "/items/new" do
    erb :new
  end

  get "/items/:id/edit" do
    @item = Item.find(params[:id])
    erb :edit
  end

  put "/items/:id" do
    item = Item.find(params[:id])
    Item.update({title: params[:title], description: params[:description], image: params[:image]})
    redirect "/items"
  end

  get "/items" do
    @items = Item.all
    erb :items
  end

  post "/items" do
    Item.create(
      title: params[:title],
      description: params[:description],
      image: params[:image]
    )
    redirect "/items"
  end
  delete '/items/:id' do |id|
    Item.find(params[:id]).destroy
    redirect "/items"
  end

end
