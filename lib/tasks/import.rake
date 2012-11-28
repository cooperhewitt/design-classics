require 'csv'
require 'iconv'

namespace :import do

  desc "import a list of things from a CSV file"
  task :types_of_thing => :environment do |t, args|

    file_path = File.join(File.dirname(__FILE__), '..', '..', 'tmp', 'source_data', 'types.csv')

    file = File.open(file_path)

    ic = Iconv.new("UTF-8//IGNORE", "US-ASCII")

    CSV.foreach(file_path) do |row|

      name = row[2].to_s

      unless TypeOfThing.find_by_name(name) or name == "name"

        TypeOfThing.create({:name => name, :ch_id => row[1].to_i})
        print "."
        $stdout.flush

      end

    end

  end

  desc "Blah"
  task :object_images => :environment do


    Thing.where(:image => nil).find_each do |thing|

      options = {
        :body => {
          "method" => "cooperhewitt.objects.getInfo",
          "access_token" => "5c39afbf961a01785e6477be4879c93b",
          "id" => thing.ch_id
        }
      }

      @response = HTTParty.post('https://api.collection.cooperhewitt.org/rest/', options)

      images = @response["object"]["images"]
#      puts images
#      puts images.size
      if images.size > 0

        if images.first && images.first.size > 0

          thing.image = images.first["n"]["url"]
        elsif images[1] && images[1].size > 0

          thing.image = images[1]["n"]["url"]
        end
        thing.save

      end

    end

  end

  desc "import images from GitHub"
  task :object_images_from_github => :environment do |t, args|

    Thing.where(:image => nil).order('id DESC').find_each do |thing|

      id_s = thing.ch_id.to_s

      response  = HTTParty.get("https://raw.github.com/cooperhewitt/collection/master/objects/#{id_s[0,3]}/#{id_s[3,3]}/#{id_s[6,3]}/#{id_s}.json").parsed_response

      images = JSON.parse(response)["images"]

      print "."
      $stdout.flush


      if images.size > 0

        if images.first && images.first.size > 0

          thing.image = images.first["n"]["url"]
        elsif images[1] && images[1].size > 0

          thing.image = images[1]["n"]["url"]
        end
        thing.save

      end
      #@response = HTTParty.post('https://api.collection.cooperhewitt.org/rest/', options)
    end

  end


  desc "import a list of things from a CSV file"
  task :objects => :environment do |t, args|

    file_path = File.join(File.dirname(__FILE__), '..', '..', 'tmp', 'source_data', 'objects.csv')

    file = File.open(file_path)

    ic = Iconv.new("UTF-8//IGNORE", "US-ASCII")
    count = 0

    CSV.foreach(file_path) do |row|

      ch_id = row[8].to_s
      description = row[6].to_s
      department_id = row[5].to_i
      title = row[17]

      if department_id == 35347497 # Product Design

        thing = Thing.new({:name => title, :ch_id => ch_id, :description => description}, :without_protection => true)
        thing.save!

        type_of_thing = TypeOfThing.find_by_name(title.split(',').first.downcase)
        if type_of_thing
          thing.types_of_thing << type_of_thing
        end

        print "."
        $stdout.flush

      end

    end
    puts count.to_s + " in total"


  end
end
