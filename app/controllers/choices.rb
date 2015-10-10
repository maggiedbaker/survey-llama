post '/surveys/:name/choices' do |name|
  @survey = Survey.find_by(title: name)
  CompletedSurvey.create!(user_id: current_user.id, survey_id: @survey.id)
  @choice = Choice.find_by(text: params[text]) # params might adjust when we create the surveys/show view
  @choice.selected += 1
  @choice.save
  erb :'surveys/results'
end
