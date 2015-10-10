User.create! [{ :username => 'pattycake', :password => 'password'},
              { :username => 'DantheMan', :password => 'password'},
              { :username => 'MuscleShoals', :password => 'password'}]

User.find_by(username: 'pattycake').surveys.create! [{ :title => '2016 Election'}]

User.find_by(username: 'DantheMan').surveys.create! [{ :title => 'Dinner Tonight'}]

User.find_by(username: 'MuscleShoals').surveys.create! [{ :title => 'Favorite Hemingway Novel'}]

Survey.find_by(title: '2016 Election').questions.create! [{ :text => 'Who should be the next president?' }]
Survey.find_by(title: 'Dinner Tonight').questions.create! [{ :text => 'What do you want for dinner tonight?' }]
Survey.find_by(title: 'Favorite Hemingway Novel').questions.create! [{ :text => 'Which is your favorite Hemingway novel?' }]

Question.find_by(text: 'Who should be the next president?').choices.create! [{:text => 'Bernie Sanders'},{ :text => 'Donald Trump'},{ :text => 'Jeb Bush'},{ :text => 'None of the above'}]

Question.find_by(text: 'What do you want for dinner tonight?').choices.create! [{ :text => 'Macaroni and Cheese'},{ :text => 'Burgers'},{ :text => 'Caprese Salad'},{ :text => 'Pizza and Beer'}]

Question.find_by(text: 'Which is your favorite Hemingway novel?').choices.create! [{ :text => 'A Farwell to Arms'},{ :text => 'The Old Man and the Sea'},{ :text => 'For Whom the Bell Tolls'},{ :text => 'The Sun Also Rises'}]
