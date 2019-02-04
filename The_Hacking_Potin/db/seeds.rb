require 'faker'

10.times do
	City.create(name: Faker::GameOfThrones.city, zip: Faker::Address.zip_code)
end

10.times do
	User.create(first_name: Faker::GameOfThrones.character, last_name: Faker::StarWars.character, description: Faker::Lorem.paragraphs, age: rand(20..40), email: Faker::Internet.free_email, city: City.all.sample)
end

20.times do
	Potin.create(title: Faker::NewGirl.quote, content: Faker::Lorem.paragraphs(4), date: Faker::Date.backward(15), user: User.all.sample)
end

10.times do
	Tag.create(title: Faker::Hacker.adjective)
end

# Au moins un tag par potin
Potin.all.each do |potin|
	potin.tags << Tag.all.sample
end

## Quelques comment de potins
20.times do
	Comment.create(content: Faker::Lorem.paragraphs, user: User.all.sample, commenteable: Potin.all.sample)
end

## Puis quelques comment de comment, des bebes comment quoi
20.times do
	Comment.create(content: Faker::Lorem.paragraphs, user: User.all.sample, commenteable: Comment.all.sample)
end

# Des likes polymorphics, comme ca on peut liker un article OU un comment, mais forcement un des deux.
20.times do
	Like.create(user: User.all.sample, likeable: [Potin.all, Comment.all][rand(0..1)][rand(1..20)])
end

# Et un petit MP, dans une boucle times pour en creer plus si besoin
1.times do
 pm = PrivateMessage.new
 pm.sender = User.all.sample
 pm.recipients << User.all.sample
 pm.recipients << User.all.sample
 pm.recipients << User.all.sample
 pm.save
end
