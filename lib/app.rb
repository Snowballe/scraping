require 'dotenv' 
require 'nokogiri'
require 'open-uri'
Dotenv.load

page=Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
all_devise_links=[]
all_price_links=[]
final_array=[]
for i in 1..200
all_devise_links<<page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div").text
all_price_links<<page.xpath("/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/a").text
final_array<<all_devise_links.zip(all_price_links)
end
puts final_array