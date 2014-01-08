  task :read_csv_net_http => :environment do
    require "csv"
    require 'net/http'
    desc "This class will read a csv file and display its contents on the screen"

    uri = URI('http://s3.amazonaws.com/app0521/amulekar@gmail.com/2012-07-11/csv_tester.csv?1342015275')
    csv_text = Net::HTTP.get(uri)
    csv = CSV.parse(csv_text, :headers=>true)
    csv.each do |row|
      puts row
    end

  end


  task :read_csv_open_uri => :environment do
    require "csv"
    require 'open-uri'

    csv_text = open('http://s3.amazonaws.com/app0521/amulekar@gmail.com/2012-07-11/csv_tester.csv?1342015275')
    csv = CSV.parse(csv_text, :headers=>true)
    csv.each do |row|
      puts row
    end

  end


