get '/' do
  erb :index
end

post '/' do
  user = User.find_by_username(params[:username])
  if user
    if params[:password] == user.password
      session[:id] = user.id
      session[:decks] = Deck.all
      redirect '/'
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end

