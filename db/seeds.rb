20.times do
    User.create(name: Faker::Name.name_with_middle)
end