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
               radius: 60 },

             { name: "Swing Times Five",
               genre: "Swing",
               description: "Swing Times Five recreates the masterpieces of the early jazz and swing
                            eras, in concerts, dances, weddings, and festival settings. Hot dance tunes,
                            sweet ballads, and toe-tapping standards are presented with flair and
                            sophistication, adapted to meet the individual needs of each venue.",
               zipcode: "01720",
               radius: 100 },

             { name: "The McTootersons",
               genre: "jazz",
               description: "Tootin' their own horns since 1932.",
               zipcode: "02155",
               radius: 30 },

            { name: "The Cracked Mugs",
              genre: "jazz",
              description: "The Cracked Mugs are a jazz band. According to WikiPedia, this means
                            that they are a musical ensemble that plays jazz music. The end.",
              zipcode: "02150",
              radius: 230 },

              { name: "The Starving Savants",
                genre: "jazz",
                description: "We haven't been paid in months. Please help us.",
                zipcode: "02151",
                radius: 70 },

              { name: "Rusty Wrenches",
                genre: "Jazz",
                description: "Our skills are even rustier than our wrenches.
                              We'll put on a show that you'll remember for minutes.",
                zipcode: "01851",
                radius: 70 },

             { name: "OT-8",
               genre: "Desconstructed alt-retro-post-jazz disco fusion",
               description: "Bringing a heavy dosage of our sweet melodies to a gig near you.",
               zipcode: "02152",
               radius: 15 }]

musician_data = [ {firstname: "Jeff", lastname: "Hughes", instrument: "Trumpet", bio:"Bio 1"},
                  {firstname: "David", lastname: "Didriksen", instrument: "Percussion", bio:"Bio 2"},
                  {firstname: "John", lastname: "Clark", instrument: "Clarinet", bio:"Bio 3"},
                  {firstname: "Tom", lastname: "Boates", instrument: "Trombone", bio:"Bio 4"},
                  {firstname: "Ross", lastname: "Petot", instrument: "Piano", bio:"Bio 5"},
                  {firstname: "Rick", lastname: "MacWillians", instrument: "Tuba", bio:"Bio 6"},
                  {firstname: "Dan", lastname: "Weiner", instrument: "Guitar", bio:"Bio 7"},
                  {firstname: "Debbie", lastname: "Larkin", instrument: "Vocals", bio:"Bio 8"},
                  {firstname: "Pete", lastname: "Tillotson", instrument: "Percussion", bio:"Bio 9"},
                  {firstname: "Lisa", lastname: "McJazzface", instrument: "Saxophone", bio:"Bio 10"},
                  {firstname: "Lumpy", lastname: "Blobberson", instrument: "Trumpet", bio:"Bio 11"},
                  {firstname: "Stick", lastname: "Stickly", instrument: "Vocals", bio:"Bio 12"},
                  {firstname: "Hayley", lastname: "Didriksen", instrument: "Spoons", bio:"Bio 13"},
                  {firstname: "Drew", lastname: "Didriksen", instrument: "Ukulele", bio:"Bio 14"},
                  {firstname: "Cathy", lastname: "Didriksen", instrument: "Banjo", bio:"Bio 15"},
                  {firstname: "Pee-wee", lastname: "Herman", instrument: "Bass", bio:"Bio 16"}]

band_data.each {|data| Band.create(name: data[:name],
                                   genre: data[:genre],
                                   description: data[:description],
                                   zipcode: data[:zipcode],
                                   radius: data[:radius])}

musician_data.each {|data| Musician.create(firstname: data[:firstname],
                                          lastname: data[:lastname],
                                          instrument: data[:instrument],
                                          bio: data[:bio])}

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
    b.band_musicians.create(musician_id: musicians[m].id)
  end
end
