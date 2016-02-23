namespace :user_import do
  desc "Add users via Faker gem"
  task add_users: :environment do
  	350.times do
  		User.create(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password)
  	end
  end

  desc "Add images to user profiles"
  task add_images: :environment do
    User.find_each do |user|
    	user.image = File.open(Dir.glob(File.join(Rails.root, 'profile_images', '*')).sample)
    	user.save
    	puts "User image added."
    end
    puts "done!"
  end
end