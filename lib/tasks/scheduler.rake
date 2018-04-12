desc "This task is called by the Heroku scheduler add-on"

task :grab_images => :environment do
  ImageSearchService.search
end
