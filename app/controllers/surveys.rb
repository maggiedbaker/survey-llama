get '/' do
  redirect '/surveys'
end

get '/surveys' do
  @surveys = Survey.all
  erb :'/surveys/index'
end

post '/surveys/search' do
  #need to stop empty searches
  @surveys = Survey.find_keyword(params[:search])
  erb :'/surveys/index'
end

get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys' do
  user = User.find(session[:user_id])
  new_survey = user.surveys.create(user_id: user.id, title: params[:title], photo: params[:photo])
  # if params[:photo] != ""
  #   new_survey.photo = params[:photo]
  # end
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
  @survey = Survey.find_by(title: params[:title])
  if current_user.can_take_survey?(@survey) #guard case returns user to home page if they try to access page directly
    erb :'/surveys/show'
  else
    if logged_in?
      redirect '/surveys'
    else
      redirect '/login'
    end
  end
end

post '/surveys/:title' do
  @survey = Survey.find_by(title: params[:title])
  CompletedSurvey.create(user_id: current_user.id, survey_id: @survey.id)
  @choice = Choice.find_by(text: URI.decode(params[:response])) # params might adjust when we create the surveys/show view
  @choice.selected += 1
  @choice.save
  redirect ("/surveys/results/#{URI.escape(params[:title], Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}")
end

not_found do
  status 404
  erb :_404, layout: false
end
