get '/' do
  redirect '/surveys'
end

get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys' do
  user = User.find(session[:user_id])
  new_survey = user.surveys.create(user_id: user.id, title: params[:title])
  question = new_survey.questions.create(text: params[:question]) #modify logic here if mutliple questions
  params[:choices].reject! { |key, choice| choice[:text] == "" }
  params[:choices].values.each do |choice|
    question.choices.create(text: choice[:text])
  end
  if user.save
    redirect ('/surveys')
  else
    @errors = user.errors.full_messages
    redirect ('/surveys/new')
  end
end

get '/surveys/results/:title' do
  @survey = Survey.find_by(title: params[:title])
  erb :'/surveys/results'
end

get '/surveys/:title' do
  if logged_in?
    @survey = Survey.find_by(title: params[:title])
    erb :'/surveys/show'
  else
    redirect '/login'
  end
end

post '/surveys/:title' do
  @survey = Survey.find_by(title: params[:title])
  CompletedSurvey.create(user_id: current_user.id, survey_id: @survey.id)
  @choice = Choice.find_by(text: params[:response]) # params might adjust when we create the surveys/show view
  @choice.selected += 1
  @choice.save
  redirect ("/surveys/results/#{URI.escape(params[:title])}")
end
