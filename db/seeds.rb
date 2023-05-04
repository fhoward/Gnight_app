me = User.create(name: "Francisco Susa")

30.times do
    time_in = Faker::Time.forward(days: 23, period: :morning)
    me.attendances.create(time_in: time_in, time_out: time_in + rand(8))
end

40.times do
    user = User.create(name: Faker::Name.name_with_middle)

    80.times do
        time_in = Faker::Time.forward(days: 23, period: :morning)
        user.attendances.create(time_in: time_in, time_out: time_in + rand(8))
    end
end

_users = User.all 
_users.each do |u|
    10.times do
        random_user = User.find(rand(1..41))
        u.follow_friend(random_user)
    end
end