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

get '/' do
  redirect('/surveys')
end

get '/surveys' do
  erb :'/surveys/index'
end
