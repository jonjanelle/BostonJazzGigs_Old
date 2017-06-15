# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

band_data = [{name: "The Wolverine Jazz Band",
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
             {name: "Swing Time Five",
              genre: "Swing"
              description: "Swing Times Five recreates the masterpieces of the early jazz and swing
                            eras, in concerts, dances, weddings, and festival settings. Hot dance tunes,
                            sweet ballads, and toe-tapping standards are presented with flair and
                            sophistication, adapted to meet the individual needs of each venue.",
              zipcode: "01720",
              radius: 100},
             {name: "band 3", description: "band 3 description"},
             {name: "Operating Thetan Level 8",
              genre: "Alternative retro desconstructed post-jazz disco fusion",
              description: "Bringing a double-dose of our sweet melodies to a gig",
              zipcode: 02155,
              radius: 15}]

musician_data = [{name: "musician 1", instrument: "instrument 1"},
                  {name: "musician 2", instrument: "instrument 2"},
                  {name: "musician 3", instrument: "instrument 3"},
                  {name: "musician 4", instrument: "instrument 4"},
                  {name: "musician 5", instrument: "instrument 1"},
                  {name: "musician 6", instrument: "instrument 5"},
                  {name: "musician 7", instrument: "instrument 1"},
                  {name: "musician 8", instrument: "instrument 2"},
                  {name: "musician 9", instrument: "instrument 3"},
                  {name: "musician 10", instrument: "instrument 1"},
                  {name: "musician 11", instrument: "instrument 4"},
                  {name: "musician 12", instrument: "instrument 1"},
                  {name: "musician 13", instrument: "instrument 2"}]

band_data.each {|data| Band.create(name: data[:name], description: data[:description])}
musician_data.each {|data| Musician.create(name: data[:name], instrument: data[:instrument])}

bands = Band.all()
musicians = Musician.all()

bands.each do |b|
  r = Random.new
  bandSize = r.rand(2..5)
  bandSize.times do
    m = r.rand(0...musicians.length)
    b.band_musicians.create(musician_id: musicians[m].id)
  end
end
