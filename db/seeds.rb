30.times do |n|
  name = Faker::Company.name
  description = Faker::Company.buzzword
  Category.create!(category_name: name, description: description)
end
