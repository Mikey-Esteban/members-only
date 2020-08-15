# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# emails:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# member0 = Member.create! :name => 'Kristin', :username => 'awesomeSauce', :blurb=> 'pretty fashionable | pretty awesome | pretty pretty', :email => 'user0@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member0.avatar.attach(io: File.open('app/assets/images/user0.jpg'), filename: 'user0.jpg', content_type: 'image/jpg')
# member1 = Member.create! :name => 'Jane', :username => 'kellykapoorftw', :blurb=> 'the office | Mindy Kaling | i know all the office details', :email => 'user1@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member1.avatar.attach(io: File.open('app/assets/images/user1.jpg'), filename: 'user1.jpg', content_type: 'image/jpg')
# member2 = Member.create! :name => 'Debbie', :username => 'techNerdl33t', :blurb=> 'RoR | IT ', :email => 'user2@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member2.avatar.attach(io: File.open('app/assets/images/user2.jpg'), filename: 'user2.jpg', content_type: 'image/jpg')
# member3 = Member.create! :name => 'Annie', :username => 'anniesb00bz', :blurb=> 'annies boobs deserves a spin off', :email => 'user3@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member3.avatar.attach(io: File.open('app/assets/images/user3.jpg'), filename: 'user3.jpg', content_type: 'image/jpg')
# member4 = Member.create! :name => 'Lauren', :username => 'i<3meangirls', :blurb=> " 'She doesn't even go here!' ", :email => 'user4@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member4.avatar.attach(io: File.open('app/assets/images/user4.jpg'), filename: 'user4.jpg', content_type: 'image/jpg')
# member5 = Member.create! :name => 'Jeff Winger', :username => 'lawyerXtrodinaire', :blurb=> 'Community College Law Professor | fitness', :email => 'user5@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member5.avatar.attach(io: File.open('app/assets/images/user5.jpg'), filename: 'user5.jpg', content_type: 'image/jpg')
# member6 = Member.create! :name => 'Pierce', :username => 'moistTowlettes', :blurb=> 'Level 6 Lotus', :email => 'user6@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member6.avatar.attach(io: File.open('app/assets/images/user6.jpg'), filename: 'user6.jpg', content_type: 'image/jpg')
# member7 = Member.create! :name => 'Troy', :username => 'andAbed', :blurb=> 'Troy and Abed in the mooooooooorrrnnningg!', :email => 'user7@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member7.avatar.attach(io: File.open('app/assets/images/user7.jpg'), filename: 'user7.jpg', content_type: 'image/jpg')
# member8 = Member.create! :name => 'Dave', :username => 'chefmaestro', :blurb=> 'I will start the next Momofuku', :email => 'user8@email.com', :password => 'topsecret', :password_confirmation => 'topsecret'
# member8.avatar.attach(io: File.open('app/assets/images/user8.jpg'), filename: 'user8.jpg', content_type: 'image/jpg')
# member0.posts.create!(:title => 'How awesome am I (part 2)?', :message => 'I swear a lot of people must be sleeping or something.. not enough people have commented on my first post')
# member0.posts.create!(:title => 'Why are we even friends with Annie?', :message => "Annie isn't even that pretty.")


init_female_members = {
                  :user0 => Member.new,
                  :user1 => Member.new,
                  :user2 => Member.new,
                  :user3 => Member.new,
                  :user4 => Member.new
                }
init_male_members = {
                  :user5 => Member.new,
                  :user6 => Member.new,
                  :user7 => Member.new,
                  :user8 => Member.new,
                  :user9 => Member.new
                }

members = []

init_female_members.each do |female, value|
  username = female
  female = Member.create!( :name => Faker::Name.female_first_name + ' ' + Faker::Name.last_name,
                           :username => Forgery('internet').user_name,
                           :blurb => Forgery('name').job_title + ' | ' + Faker::Hipster.sentence,
                           :email => "#{username}@email.com",
                           :password => 'topsecret',
                           :password_confirmation => 'topsecret' )

  female.avatar.attach(io: File.open("app/assets/images/#{username}.jpg"), filename: "#{username}.jpg", content_type: 'image/jpg')
  members << female
end

init_male_members.each do |male, value|
  username = male
  male = Member.create!( :name => Faker::Name.male_first_name + ' ' + Faker::Name.last_name,
                           :username => Forgery('internet').user_name,
                           :blurb => Forgery('name').job_title + ' | ' + Faker::Hipster.sentence,
                           :email => "#{username}@email.com",
                           :password => 'topsecret',
                           :password_confirmation => 'topsecret' )

  male.avatar.attach(io: File.open("app/assets/images/#{username}.jpg"), filename: "#{username}.jpg", content_type: 'image/jpg')
  members << male
end


members.each do |member|
  10.times {
    member.posts.create!(:title => Faker::Hipster.sentence, :message => Faker::Hipster.paragraph)
  }
end
