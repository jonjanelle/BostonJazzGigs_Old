# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
band_data = [{ name: "The Wolverine Jazz Band",
               genre: "Dixieland",
               description: "Since 1995 the Wolverine Jazz Band has been
                            entertaining lovers of Traditional Jazz all over
                            Boston and southern New England. In Massachusetts alone,
                            they have raised the roof at the Sherborn Inn, crisped the
                            leaves at sundry Town Green summer concerts, and flaked the
                            varnish on church pews in the Boston suburbs. The band can
                            arrange Dixieland or Swing performances to suit all venues and budgets.",
               zipcode: "01720",
               email: "test@test.com",
               radius: 60 },

             { name: "Swing Times Five",
               genre: "Swing",
               description: "Swing Times Five recreates the masterpieces of the early jazz and swing
                            eras, in concerts, dances, weddings, and festival settings. Hot dance tunes,
                            sweet ballads, and toe-tapping standards are presented with flair and
                            sophistication, adapted to meet the individual needs of each venue.",
               email: "test@test.com",
               zipcode: "01720",
               radius: 100 },

             { name: "The McTootersons",
               genre: "jazz",
               description: "Tootin' their own horns since 1932.",
               email: "test@test.com",
               zipcode: "02155",
               radius: 30 },

            { name: "The Cracked Mugs",
              genre: "jazz",
              description: "The Cracked Mugs are a jazz band. According to WikiPedia, this means
                            that they are a musical ensemble that plays jazz music. The end.",
              email: "test@test.com",
              zipcode: "02150",
              radius: 230 },

              { name: "The Starving Savants",
                genre: "jazz",
                description: "We haven't been paid in months. Please help us.",
                email: "test@test.com",
                zipcode: "02151",
                radius: 70 },

              { name: "Rusty Wrenches",
                genre: "Jazz",
                description: "Our skills are even rustier than our wrenches.
                              We'll put on a show that you'll remember for minutes.",
                email: "test@test.com",
                zipcode: "01851",
                radius: 70 },

             { name: "OT-8",
               genre: "Desconstructed alt-retro-post-jazz disco fusion",
               email: "test@test.com",
               description: "Bringing a heavy dosage of our sweet melodies to a gig near you.",
               zipcode: "02152",
               radius: 15 }]

musician_data = [ {firstname: "Jeff", lastname: "Hughes", instrument: "Trumpet", bio:"Bio 1"},
                  {firstname: "David", lastname: "Didriksen", instrument: "Percussion", bio:"Bio 2"},
                  {firstname: "John", lastname: "Clark", instrument: "Clarinet", bio:"Bio 3"},
                  {firstname: "Tom", lastname: "Boates", instrument: "Trombone", bio:"Bio 4"},
                  {firstname: "Ross", lastname: "Petot", instrument: "Piano", bio:"Bio 5"},
                  {firstname: "Rick", lastname: "MacWilliams", instrument: "Tuba", bio:"Bio 6"},
                  {firstname: "Dan", lastname: "Weiner", instrument: "Guitar", bio:"Bio 7"},
                  {firstname: "Debbie", lastname: "Larkin", instrument: "Vocals", bio:"Bio 8"},
                  {firstname: "Pete", lastname: "Tillotson", instrument: "Percussion", bio:"Bio 9"},
                  {firstname: "Lisa", lastname: "McJazzface", instrument: "Saxophone", bio:"Bio 10"},
                  {firstname: "Lumpy", lastname: "Blobberson", instrument: "Trumpet", bio:"Bio 11"},
                  {firstname: "Stick", lastname: "Stickly", instrument: "Vocals", bio:"Bio 12"},
                  {firstname: "Hayley", lastname: "Didriksen", instrument: "Spoons", bio:"Bio 13"},
                  {firstname: "Drew", lastname: "Didriksen", instrument: "Ukulele", bio:"Bio 14"},
                  {firstname: "Cathy", lastname: "Didriksen", instrument: "Banjo", bio:"Bio 15"},
                  {firstname: "Pee-wee", lastname: "Herman", instrument: "Bass", bio:"Bio 16"} ]

#create one user accounts for each musician
musician_data.length.times do |i|
  User.create!( email: "user"+i.to_s+"@test.com",
                firstname: musician_data[i][:firstname],
               lastname: musician_data[i][:lastname],
               password: "password",
               password_confirmation: "password",
               user_type: "m")
end
puts "#{User.count} User accounts created"

mbio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vel diam pharetra, semper est ac, volutpat odio. Praesent dictum nunc augue. Phasellus suscipit tellus magna, quis vehicula sem maximus id. Integer volutpat ligula vel turpis euismod luctus. Duis hendrerit a eros quis maximus. Nunc ut vestibulum ante. Aenean aliquam mattis risus quis fringilla. Phasellus faucibus est ante, sit amet ornare purus dignissim a. Duis eu feugiat risus. Morbi fringilla a metus in congue."

musician_data.each_with_index do |data, index|
  Musician.create!(firstname: data[:firstname], lastname: data[:lastname],
                  instrument: data[:instrument], bio: mbio,
                  user_id: index+1)
end
puts "#{Musician.count} Musician entries created"

band_data.each do |data|
  Band.create!(name: data[:name], genre: data[:genre],
              description: data[:description], zipcode: data[:zipcode],
              radius: data[:radius], email: data[:email])
end
puts "#{Band.count} Band entries created"

bands = Band.all()
musicians = Musician.all()

bands.each do |b|
  used = Array.new
  r = Random.new
  bandSize = r.rand(2..4)
  bandSize.times do
    m = r.rand(0...musicians.length)
    while used.include?(m)
      m = r.rand(0...musicians.length)
    end
    used << m
    b.band_musicians.create!(musician_id: musicians[m].id)
  end
end
puts "#{BandMusician.count} Band/Musician pairings created"
