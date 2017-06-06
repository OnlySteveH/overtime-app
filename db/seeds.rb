@user = User.create(email: "test@test.com", password: "ayodele1", password_confirmation: "ayodele1", first_name: "Edward", last_name: "Snowden")

puts "1 User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts have been created"
