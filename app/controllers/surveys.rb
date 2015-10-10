get '/' do
  redirect '/surveys'
end

get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys/new' do
  user = User.find_by(username: session[:username])
  new_survey = Survey.new(user_id: user.id, title: params[:title])
  choice = new_survey.questions[0].choices.find_by(text: params[:choice])
  ## modify this when implementing multi question surveys. questions should be many not just index 0
  choice.selected += 1
  user.surveys << new_survey
  if @survey.save
    redirect ('/surveys')
  else
    redirect ('/surveys/new')
  end
end

get '/surveys/:name' do
  @survey = Survey.find(params[:name])
  if logged_in?
    erb :'surveys/show'
  else
    redirect '/login'
  end
end
