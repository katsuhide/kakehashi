namespace :ping do
    desc "check the heroku"
    task :execute => :environment do
        require 'net/http'
        uri = URI.parse('http://kakehashi.herokuapp.com/')
        Net::HTTP.get(uri)
    end

end