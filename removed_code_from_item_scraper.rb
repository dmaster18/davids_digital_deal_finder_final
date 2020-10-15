def target_tech_page
  Nokogiri::HTML(open("https://www.target.com/c/electronics-deals/-/N-556x9"))
end

def target_tech_items
  target_items = target_tech_page.at("div[@data-test='product-card-default']")
  target_item_objects = []
  target_items.each do |target_item|
    target_title = target_item.css("a[@data-test='product-title']").text
    target_sale_price = target_item.css
    #target_original_price = target_item.at(
    #target_sale_percentage = target_item.at(
    target_link = target_item.at("a")["href"].to_s
    #new_target_item_object = Item.new(title: target_title, category: "Tech", sale_price: target_sale_price, original_price: target_original_price, sale_percentage: target_sale_percentage, link: target_link, retailer: "Target", source: "Target")
    #target_item_objects << new_target_item_object
  end
  target_item_objects
end

#<a href="/p/apple-airpods-with-charging-case/-/A-54191097#lnk=sametab" class="Link-sc-1khjl8b-0 styles__StyledTitleLink-mkgs8k-5 dJwaza jqiYMz h-display-block h-text-bold h-text-bs flex-grow-one" aria-label="Apple AirPods with Charging Case" data-test="product-title">Apple AirPods with Charging Case</a>


def ebay_fashion_page #Retrieves fashion deals page from eBay
  ebay_fashion_html = "https://www.ebay.com/deals/fashion"
  Nokogiri::HTML(open(ebay_fashion_html))
end

def ebay_fashion_items
  ebay_items = ebay_fashion_page.css("div.item")
  ebay_item_objects = []
  ebay_items.each do |ebay_item|
    ebay_title = ebay_item.at("[@itemprop = 'name']").text
    ebay_sale_price = ebay_item.at("[@itemprop = 'price']").text
    ebay_original_price = ebay_item.at("[@class = 'itemtile-price-strikethrough']").text
    ebay_sale_percentage = ebay_item.at("[@class = 'itemtile-price-bold']").text
    ebay_link = ebay_item.at("a")["href"].to_s
    #new_ebay_item_object = Item.new(title: ebay_title, category: "Fashion", sale_price: ebay_sale_price, original_price: ebay_original_price, sale_percentage: ebay_sale_percentage, link: ebay_link, retailer: "eBay", source: "eBay")
    #ebay_item_objects << new_ebay_item_object
  end
  ebay_item_objects
end

def ebay_home_garden_page
  ebay_home_garden_html = "https://www.ebay.com/deals/home-garden"
  Nokogiri::HTML(open(ebay_home_garden_html))
end

def ebay_home_garden_items
  ebay_items = ebay_home_garden_page.css("div.item")
  ebay_item_objects = []
  ebay_items.each do |ebay_item|
    ebay_title = ebay_item.at("[@itemprop = 'name']").text
    ebay_sale_price = ebay_item.at("[@itemprop = 'price']").text
    ebay_original_price = ebay_item.at("[@class = 'itemtile-price-strikethrough']").text
    ebay_sale_percentage = ebay_item.at("[@class = 'itemtile-price-bold']").text
    ebay_link = ebay_item.at("a")["href"].to_s
    #new_ebay_item_object = Item.new(title: ebay_title, category: "Home & Garden", sale_price: ebay_sale_price, original_price: ebay_original_price, sale_percentage: ebay_sale_percentage, link: ebay_link, retailer: "eBay", source: "eBay")
    #ebay_item_objects << new_ebay_item_object
  end
  ebay_item_objects
end

def ebay_sports_page
  ebay_sports_html = "https://www.ebay.com/deals/sporting-goods"
  Nokogiri::HTML(open(ebay_home_garden_html))
end

def ebay_sports_items
  ebay_items = ebay_sports_page.css("div.item")
  ebay_item_objects = []
  ebay_items.each do |ebay_item|
    ebay_title = ebay_item.at("[@itemprop = 'name']").text
    ebay_sale_price = ebay_item.at("[@itemprop = 'price']").text
    ebay_original_price = ebay_item.at("[@class = 'itemtile-price-strikethrough']").text
    ebay_sale_percentage = ebay_item.at("[@class = 'itemtile-price-bold']").text
    ebay_link = ebay_item.at("a")["href"].to_s
    #new_ebay_item_object = Item.new(title: ebay_title, category: "Sports", sale_price: ebay_sale_price, original_price: ebay_original_price, sale_percentage: ebay_sale_percentage, link: ebay_link, retailer: "eBay", source: "eBay")
    #ebay_item_objects << new_ebay_item_object
  end
  ebay_item_objects
end

def ebay_misc_page
  ebay_misc_html = "https://www.ebay.com/deals/other-deals"
  Nokogiri::HTML(open(ebay_home_garden_html))
end

def ebay_misc_items
  ebay_items = ebay_misc_page.css("div.item")
  ebay_item_objects = []
  ebay_items.each do |ebay_item|
    ebay_title = ebay_item.at("[@itemprop = 'name']").text
    ebay_sale_price = ebay_item.at("[@itemprop = 'price']").text
    ebay_original_price = ebay_item.at("[@class = 'itemtile-price-strikethrough']").text
    ebay_sale_percentage = ebay_item.at("[@class = 'itemtile-price-bold']").text
    ebay_link = ebay_item.at("a")["href"].to_s
    #new_ebay_item_object = Item.new(title: ebay_title, category: "Miscellaneous", sale_price: ebay_sale_price, original_price: ebay_original_price, sale_percentage: ebay_sale_percentage, link: ebay_link, retailer: "eBay", source: "eBay")
    #ebay_item_objects << new_ebay_item_object
  end
  ebay_item_objects
end

def amazon_tech_page
  amazon_tech_html = "https://www.amazon.com/gp/goldbox/ref=gbps_ftr_s-5_cd34_wht_229534?gb_f_deals1=enforcedCategories:172282%252C541966%252C2335752011%252C468642%252C502394%252C2102313011%252C667846011%252C1266092011%252C133140011%252C172541%252C229534,dealStates:AVAILABLE%252CWAITLIST%252CWAITLISTFULL%252CUPCOMING,sortOrder:BY_SCORE,includedAccessTypes:GIVEAWAY_DEAL&pf_rd_p=fd51d8cf-b5df-4144-8086-80096db8cd34&pf_rd_s=slot-5&pf_rd_t=701&pf_rd_i=gb_main&pf_rd_m=ATVPDKIKX0DER&pf_rd_r=3ECTAANY6PBGSPDQVCMA&nocache=1601996970398&ie=UTF8"
  Nokogiri::HTML(open("https://www.amazon.com/gp/goldbox/ref=gbps_ftr_s-5_cd34_wht_229534?gb_f_deals1=enforcedCategories:172282%252C541966%252C2335752011%252C468642%252C502394%252C2102313011%252C667846011%252C1266092011%252C133140011%252C172541%252C229534,dealStates:AVAILABLE%252CWAITLIST%252CWAITLISTFULL%252CUPCOMING,sortOrder:BY_SCORE,includedAccessTypes:GIVEAWAY_DEAL&pf_rd_p=fd51d8cf-b5df-4144-8086-80096db8cd34&pf_rd_s=slot-5&pf_rd_t=701&pf_rd_i=gb_main&pf_rd_m=ATVPDKIKX0DER&pf_rd_r=3ECTAANY6PBGSPDQVCMA&nocache=1601996970398&ie=UTF8"))
end

def amazon_tech_items
  amazon_items = amazon_tech_page.css("div#101_dealView")
  amazon_item_objects = []
  amazon_items.each do |amazon_item|
    #amazon_title = amazon_item.at(
    #amazon_sale_price = amazon_item.at(
    #amazon_original_price = amazon_item.at(
    #amazon_sale_percentage = amazon_item.at(
    #amazon_link = amazon_item.at(
    #new_amazon_item_object = Item.new(title: amazon_title, category: "Tech", sale_price: amazon_sale_price, original_price: amazon_original_price, sale_percentage: amazon_sale_percentage, link: amazon_link, retailer: "Amazon", source: "Amazon")
    #amazon_item_objects << new_amazon_item_object
  end
  amazon_item_objects
end

def amazon_home_garden_page
  amazon_home_garden_html = "https://www.amazon.com/gp/goldbox/ref=gbps_ftr_s-5_cd34_wht_284507?gb_f_deals1=enforcedCategories:1055398%252C328182011%252C1064954%252C2972638011%252C667846011%252C2619525011%252C228013%252C9479199011%252C2617941011%252C284507,dealStates:AVAILABLE%252CWAITLIST%252CWAITLISTFULL%252CUPCOMING,sortOrder:BY_SCORE,includedAccessTypes:GIVEAWAY_DEAL&pf_rd_p=fd51d8cf-b5df-4144-8086-80096db8cd34&pf_rd_s=slot-5&pf_rd_t=701&pf_rd_i=gb_main&pf_rd_m=ATVPDKIKX0DER&pf_rd_r=RZN6DA8GR5F2B637BQRK&nocache=1601996970398&ie=UTF8"
  Nokogiri::HTML(open(amazon_home_garden_html))
end

def amazon_fashion_page
  amazon_fashion_html = "https://www.amazon.com/gp/goldbox/ref=gbps_ftr_s-5_cd34_wht_71411230?gb_f_deals1=dealStates:AVAILABLE%252CWAITLIST%252CWAITLISTFULL%252CUPCOMING,sortOrder:BY_SCORE,includedAccessTypes:GIVEAWAY_DEAL,enforcedCategories:7586165011%252C7147443011%252C7192394011%252C7147440011%252C1040660%252C6358543011%252C679337011%252C679255011%252C6358539011%252C1040658%252C7147441011%252C7147442011%252C3760911%252C7147444011%252C7141123011&pf_rd_p=fd51d8cf-b5df-4144-8086-80096db8cd34&pf_rd_s=slot-5&pf_rd_t=701&pf_rd_i=gb_main&pf_rd_m=ATVPDKIKX0DER&pf_rd_r=3ECTAANY6PBGSPDQVCMA&nocache=1601996970398&ie=UTF8"
  Nokogiri::HTML(open(amazon_fashion_html))
end

def amazon_sports_page
  amazon_sports_html = "https://www.amazon.com/gp/goldbox/ref=gbps_ftr_s-5_cd34_wht_3375251?gb_f_deals1=dealStates:AVAILABLE%252CWAITLIST%252CWAITLISTFULL%252CUPCOMING,sortOrder:BY_SCORE,includedAccessTypes:GIVEAWAY_DEAL,enforcedCategories:3375251&pf_rd_p=fd51d8cf-b5df-4144-8086-80096db8cd34&pf_rd_s=slot-5&pf_rd_t=701&pf_rd_i=gb_main&pf_rd_m=ATVPDKIKX0DER&pf_rd_r=3ECTAANY6PBGSPDQVCMA&nocache=1601996970398&ie=UTF8"
  Nokogiri::HTML(open(amazon_sports_html))
end

def amazon_misc_page
  amazon_misc_html = "https://www.amazon.com/gp/goldbox/ref=gbps_ftr_s-5_cd34_wht_16579301?gb_f_deals1=dealStates:AVAILABLE%252CWAITLIST%252CWAITLISTFULL%252CUPCOMING,sortOrder:BY_SCORE,includedAccessTypes:GIVEAWAY_DEAL,enforcedCategories:10272111%252C11091801%252C15684181%252C9479199011%252C165793011&pf_rd_p=fd51d8cf-b5df-4144-8086-80096db8cd34&pf_rd_s=slot-5&pf_rd_t=701&pf_rd_i=gb_main&pf_rd_m=ATVPDKIKX0DER&pf_rd_r=3ECTAANY6PBGSPDQVCMA&nocache=1601996970398&ie=UTF8"
  Nokogiri::HTML(open(amazon_misc_html))
end

def bh_page
  Nokogiri::HTML(open("https://www.bhphotovideo.com/find/dealZone.jsp"))
end

def bh_page_2
  Nokogiri::HTML(open("https://www.bhphotovideo.com/c/buy/rebates-promotions/ci/22144/N/4019732813"))
end


def bh_items
    bh_items = bh_page.css("div.dz-dealItem")
    bh_item_objects = []
    bh_items.each do |bh_item|
      #bh_title = bh_item.at(
      #bh_sale_price = bh_item.at(
      #bh_sale_price = bh_item.css(
      #bh_original_price = bh_item.at(
      #bh_sale_percentage = bh_item.at(
      #bh_link = bh_item.at("a")["href"].to_s
      #new_bh_item_object = Item.new(title: bh_title, category: "Tech", sale_price: bh_sale_price, original_price: bh_original_price, sale_percentage: bh_sale_percentage, link: bh_link, retailer: "B&H", source: "B&H")
      #bh_item_objects << new_bh_item_object
    end
    bh_item_objects
end

def bh_items_2
    bh_items = bh_page.css("div.savings_item_container")
    bh_item_objects = []
    bh_items.each do |bh_item|
      #bh_title = bh_item.at(
      #bh_sale_price = bh_item.at(
      #bh_sale_price = bh_item.css(
      #bh_original_price = bh_item.at(
      #bh_sale_percentage = bh_item.at(
      #bh_link = bh_item.at("a")["href"].to_s
      #new_bh_item_object = Item.new(title: bh_title, category: "Tech", sale_price: bh_sale_price, original_price: bh_original_price, sale_percentage: bh_sale_percentage, link: bh_link, retailer: "B&H", source: "B&H")
      #bh_item_objects << new_bh_item_object
    end
    bh_item_objects
end

def tech_bargains_page
    Nokogiri::HTML(open("https://www.techbargains.com/"))
end

def tech_bargains_items
  tech_bargains_items = tech_bargains_page.css("div[data-ga-element='deal_tile']")
  tech_bargains_item_objects = []
  tech_bargains_items.each do |tech_bargains_item|
    tech_bargains_title = tech_bargains.css("h3[data-ga-item='deal_name'] a").text
    tech_bargains_sale_price = tech_bargains.css("strong.text-red d-block font-size-h2")
    #tech_bargains_sale_price = tech_bargains_item.at(
    #tech_bargains_original_price = tech_bargains_item.at(
    #tech_bargains_sale_percentage = tech_bargains_item.at(
    #tech_bargains_link = tech_bargains_item.at("a")["href"].to_s
    #new_tech_item_object = Item.new(title: tech_bargains_title, category: "Tech", sale_price: tech_bargains_sale_price, original_price: tech_bargains_original_price, sale_percentage: tech_bargains_sale_percentage, link: tech_bargains_link, retailer: tech_bargains_retailer, source: "Tech Bargains")
    #tech_item_objects << new_tech_item_object
  end
  tech_bargains_items_objects
end
