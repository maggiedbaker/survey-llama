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

post '/surveys' do
  user = User.find_by(username: session[:user_id])
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

get '/surveys/:name' do
  @survey = Survey.find(params[:name])
  if logged_in?
    erb :'surveys/show'
  else
    redirect '/login'
  end
end
