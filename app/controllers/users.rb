get '/signup' do
  erb :'users/new'
end

post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/surveys'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

