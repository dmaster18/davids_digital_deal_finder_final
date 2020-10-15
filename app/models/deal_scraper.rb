require 'nokogiri'
require 'open-uri'
require 'pry'
require 'net/http'

class DealScraper

  def generate_items
    ebay_items
    best_buy_items
    walmart_items
    newegg_items
    slick_deals_items
    micro_center_items
  end

  def ebay_page #Retrieves tech deals page from eBay
    Nokogiri::HTML(Net::HTTP.get(URI("https://www.ebay.com/deals/tech")))
  end

  def ebay_items
    ebay_items = ebay_page.css("div.item")
    ebay_item_objects = []
    ebay_items.each do |ebay_item|
      if !ebay_item.at("[@itemprop = 'name']").nil? && !ebay_item.at("[@itemprop = 'price']").nil? && !ebay_item.at("[@class = 'itemtile-price-strikethrough']").nil? && !ebay_item.at("[@class = 'itemtile-price-bold']").nil? && !ebay_item.at("a")["href"].nil?
        ebay_title = ebay_item.at("[@itemprop = 'name']").text
        ebay_sale_price = ebay_item.at("[@itemprop = 'price']").text.delete("/%$, /").to_i  #Has $ sign
        ebay_original_price = ebay_item.at("[@class = 'itemtile-price-strikethrough']").text.delete("/%$, /").to_i #Has $ sign
        ebay_sale_percentage = ebay_item.at("[@class = 'itemtile-price-bold']").text.delete("/%$, /").to_i #Has % sign
        ebay_link = ebay_item.at("a")["href"].to_s
        new_ebay_item_object = Item.create(title: ebay_title, sale_price: ebay_sale_price, original_price: ebay_original_price, sale_percentage: ebay_sale_percentage, link: ebay_link, retailer: "eBay", source: "eBay")
        ebay_item_objects << new_ebay_item_object
      end
    end
    ebay_item_objects
  end

  def best_buy_page
    Nokogiri::HTML(Net::HTTP.get(URI("https://www.bestbuy.com/site/misc/deal-of-the-day/pcmcat248000050016.c?id=pcmcat248000050016")))
  end

  def best_buy_items
    best_buy_items = best_buy_page.css("div.wf-offer-content")
    best_buy_item_objects = []
    best_buy_items.each do |best_buy_item|
      if !best_buy_item.css("h3 a").nil? && !best_buy_item.css("div.priceView-hero-price span").children[3].nil? && !best_buy_item.css("div.pricing-price__regular-price").nil? && !best_buy_item.at("a")["href"].nil?
        best_buy_title = best_buy_item.css("h3 a").text
        best_buy_sale_price = best_buy_item.css("div.priceView-hero-price span").children[3].text.delete("/%$, /").to_i #Doesn't have $ sign
        best_buy_original_price = best_buy_item.css("div.pricing-price__regular-price").text.split(" ").select{|value| value.include?("$")}[1].delete("/%$, /").to_i #Has $ sign
        best_buy_sale_percentage = (best_buy_original_price.to_f - best_buy_sale_price.to_f)/best_buy_original_price.to_f
        best_buy_sale_percentage = (100*best_buy_sale_percentage).to_i
        best_buy_link = best_buy_item.at("a")["href"].to_s
        new_best_buy_item_object = Item.create(title: best_buy_title, sale_price: best_buy_sale_price, original_price: best_buy_original_price, sale_percentage: best_buy_sale_percentage, link: best_buy_link, retailer: "Best Buy", source: "Best Buy")
        best_buy_item_objects << new_best_buy_item_object
      end
    end
    best_buy_item_objects
  end

  def walmart_page
    Nokogiri::HTML(Net::HTTP.get(URI("https://www.walmart.com/browse/electronics/3944/?cat_id=3944&facet=special_offers%3AClearance%7C%7Cspecial_offers%3ARollback&grid=false")))
  end

  def walmart_items
    walmart_items = walmart_page.css("div.search-result-listview-item")
    walmart_item_objects = []
    walmart_items.each do |walmart_item|
      if !walmart_item.css("a")[1].children.nil? && !walmart_item.css("span.price-main-block span.visuallyhidden").nil? && !walmart_item.css("span.price span.visuallyhidden").nil? && !walmart_item.css("a")[0]["href"].nil?
        walmart_title = walmart_item.css("a")[1].children.text
        walmart_sale_price = walmart_item.css("span.price-main-block span.visuallyhidden").text.delete("/%$, /").to_i #Has $ sign
        walmart_original_price = walmart_item.css("span.price span.visuallyhidden").text.split("$")[2].delete("/%$, /").to_i #Doesn't have $ sign
        walmart_sale_percentage = (walmart_original_price.to_f - walmart_sale_price.to_f)/walmart_original_price.to_f
        walmart_sale_percentage = (100*walmart_sale_percentage).to_i
        walmart_link = "https://www.walmart.com" + walmart_item.css("a")[0]["href"].to_s
        new_walmart_item_object = Item.create(title: walmart_title, sale_price: walmart_sale_price, original_price: walmart_original_price, sale_percentage: walmart_sale_percentage, link: walmart_link, retailer: "Walmart", source: "Walmart")
        walmart_item_objects << new_walmart_item_object
      end
    end
    walmart_item_objects
  end

  def newegg_page
      Nokogiri::HTML(Net::HTTP.get(URI("https://www.newegg.com/todays-deals?cm_sp=%20homepage_dailydeal-_-%20head_navigation-_")))
  end

  def newegg_items
      newegg_items = newegg_page.css("div.item-cell")
      newegg_item_objects = []
      newegg_items.each do |newegg_item|
        if !newegg_item.css("a.item-title").nil? && !newegg_item.css("li.price-current strong").nil? && !newegg_item.css("li.price-was span.price-was-data").nil? && !newegg_item.css("span.price-save-percent").nil?
          newegg_title = newegg_item.css("a.item-title").text
          newegg_sale_price = newegg_item.css("li.price-current strong").text.delete("/%$, /").to_i #Doesn't have $ sign
          newegg_original_price = newegg_item.css("li.price-was span.price-was-data").text.strip.delete("/%$, /").to_i #Doesn't have a $ sign
          newegg_sale_percentage = newegg_item.css("span.price-save-percent").text.delete("/%$, /").to_i #Produces ""
          #newegg_active = newegg_item.css("div.product-inventory strong").text
          #if newegg_active.include?("In stock.")
          #  newegg_active = true
          #else
          #  newegg_active = false
          #end
          newegg_link = newegg_item.css("a.item-title")[0]["href"]
          new_newegg_item_object = Item.create(title: newegg_title, sale_price: newegg_sale_price, original_price: newegg_original_price, sale_percentage: newegg_sale_percentage, link: newegg_link, retailer: "Newegg", source: "Newegg")
          newegg_item_objects << new_newegg_item_object
        end
      end
      newegg_item_objects
  end

  def slick_deals_page
    Nokogiri::HTML(Net::HTTP.get(URI("https://slickdeals.net/deals/tech/")))
  end

  def slick_deals_items
    slick_deals_items = slick_deals_page.css("div.fpItem")
    slick_deals_item_objects = []
    slick_deals_items.each do |slick_deals_item|
      if !slick_deals_item.css(".itemTitle").children.nil? && !slick_deals_item.css("div.itemPrice").nil?
        slick_deals_title = slick_deals_item.css(".itemTitle").children.text
        slick_deals_sale_price = slick_deals_item.css("div.itemPrice").text.strip.delete("/%$, /").to_i #Has $ sign
        slick_deals_link = "https://slickdeals.net/#{slick_deals_item.css("a.itemTitle")[0]["href"]}"
        #slick_deals_retailer = slick_deals_item.css(".itemTitle").children["a"]
        new_slick_deals_item_object = Item.create(title: slick_deals_title, sale_price: slick_deals_sale_price, link: slick_deals_link, source: "SlickDeals")
        slick_deals_item_objects << new_slick_deals_item_object
      end
    end
    slick_deals_item_objects
  end

  def micro_center_page
    Nokogiri::HTML(Net::HTTP.get(URI("https://www.microcenter.com/search/search_results.aspx?N=4294966998+517&sortby=match&rpp=96")))
  end

  def micro_center_items
    micro_center_items = micro_center_page.css(".product_wrapper")
    micro_center_item_objects = []
    micro_center_items.each do |micro_center_item|
      if !micro_center_item.css("h2 a").nil? && !micro_center_item.css("span[@itemprop='price']").nil? && !micro_center_item.css("span.strike").nil? && micro_center_item.css("span.strike").text.delete("/%$, /").to_i != 0
        micro_center_title = micro_center_item.css("h2 a").text
        micro_center_sale_price = micro_center_item.css("span[@itemprop='price']").text.delete("/%$, /").to_i #Has $ sign
        micro_center_original_price = micro_center_item.css("span.strike").text.delete("/%$, /").to_i #Has $ sign
        micro_center_sale_percentage = (micro_center_original_price.to_f - micro_center_sale_price.to_f)/micro_center_original_price.to_f
        micro_center_sale_percentage = (100*micro_center_sale_percentage).to_i
        micro_center_link = "https://www.microcenter.com#{micro_center_item.css("h2 a")[0]["href"]}"
        new_micro_center_item_object = Item.create(title: micro_center_title, sale_price: micro_center_sale_price, original_price: micro_center_original_price, sale_percentage: micro_center_sale_percentage, link: micro_center_link, retailer: "Micro Center", source: "Micro Center")
        micro_center_item_objects << new_micro_center_item_object
      end
    end
    micro_center_item_objects
  end

end
