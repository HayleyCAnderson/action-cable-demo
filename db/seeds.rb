survey = Survey.where(name: 'JS Frameworks').first_or_create do |s|
  s.question = 'What is your favorite JavaScript framework?'
end

frameworks = ['React', 'Angular', 'Ember', 'No JS for me thankyouverymuch', 'Other']
if survey.answers.empty?
  frameworks.each_with_index do |f, i|
    Answer.create(survey: survey, number: (i + 1), text: f)
  end
end
