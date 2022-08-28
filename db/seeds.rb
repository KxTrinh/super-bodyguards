# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"
require "nokogiri"

Booking.destroy_all
Hero.destroy_all
User.destroy_all

hero_img = []
regex = /^https:\/\/i0.wp.com\/topcomics.fr\/wp-content\/uploads\/2019\/11\/le-classement-des-100-persos-marvel-et-dc-preferes-des-lecteur/
hero_name = []
hero_address = []
i = 0
10.times do
  name = Faker::Name.first_name
  email = Faker::Internet.email
  password = "123456"
  user = User.create!(name: name, email: email, password: password)
end

html = URI.open("https://www.topcomics.fr/le-classement-des-100-persos-marvel-et-dc-preferes-des-lecteurs/10").read
# 1. Parse HTML
doc = Nokogiri::HTML(html, nil, "utf-8")
doc.search(".entry-content img").each_with_index do |ele, index|
  hero_img << ele.attr("src") if index.even? && ele.attr('src').match(regex)
end

doc.search(".entry-content h2").first(10).each do |ele|
  hero_name << ele.text.match(/[a-zA-Z]+|\(|\)|-/)
end

hero_address << "128 Boulevard de Clichy, 75018 Paris"
hero_address << "16 Villa Gaudelet, 75011 Paris"
hero_address << "15 Avenue de Choisy, 75013 Paris"
hero_address << "27 Avenue Aristide Briand, 94230 Cachan"
hero_address << "166 Boulevard de Stalingrad, 94200 Ivry-sur-Seine"

hero_address << "6 Rue Bobillot, 75013 Paris"
hero_address << "6 Rue de la Division Leclerc, 78460 Chevreuse"
hero_address << "40 Avenue du Colonel Rozanoff, 91220 Brétigny-sur-Orge"
hero_address << "9 Chemin des Mèches, 94000 Créteil"
hero_address << "60 Rue du Général de Gaulle, 77000 Melun"


heroes = []

10.times do
  file = URI.open(hero_img[i])
  hero = Hero.new(
    name: hero_name[i],
    address: hero_address[i],
    overview: Faker::ChuckNorris.fact,
    price: rand(50000..150000).to_s,
    user: User.all.sample
  )
  hero.save!
  i += 1
  heroes << hero

  puts "one more hero"
end

puts "finished"
