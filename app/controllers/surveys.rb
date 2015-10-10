get '/' do
  redirect '/surveys'
end

get '/surveys' do 
  @surverys = Survey.all
  erb :'surveys/index'
end

get '/surveys/:name' do
  @survey = Survey.find(params[:name])
end