30.times do |n|
  name = Faker::Company.name
  description = Faker::Company.buzzword
  Category.create!(category_name: name, description: description)
end

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@abc.org"
  password = "banhxe2"
  User.create!(fullname: name, email: email, phone_number: "0979797979",
    password: password, password_confirmation: password)
end
