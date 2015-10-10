get '/surveys/new' do
  erb :'/surveys/new'
end

post '/surveys/new' do
  user = User.find_by(username: session[:user_id])
  new_survey = Survey.create(user_id: user.id, title: params[:title])
  question = Question.new(text: params[:question]) #modify logic here if mutliple questions
  new_survey.questions << question
  params[:choices].reject! { |key, choice| choice[:text] == "" }
  params[:choices].values.each do |choice|
    question.choices << Choice.new(text: choice[:text])
  end
  user.surveys << new_survey
  if user.save
    redirect ('/surveys')
  else
    redirect ('/surveys/new')
  end
end
