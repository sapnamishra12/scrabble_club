namespace :model do
  desc "Populate data for Models Members and Matches"
  task :populate => :environment do 
    require 'faker'

    ##Reset database 
    Rake::Task['db:reset'].invoke

    # Populate 20 Authors
    20.times do
      Member.create! do |m|
        m.name = Faker::Name.first_name
        m.contact_number = Faker::PhoneNumber.cell_phone_with_country_code 
      end
    end

    ##Get random two players and play the game
    50.times do
      Match.create! do |g|
        g.player1 = Member.random.first.id
        g.player2 = Member.random.first.id
        g.location = Faker::Address.city
        g.score_player1 = rand(10..70)
        g.score_player2 = rand(40..100)
      end
    end
  end
end