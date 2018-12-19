class Nonprofit < ActiveRecord::Base
  belongs_to :type
  has_many :favorites
  has_many :order_items

  validates :name, :presence => true
  validates :info, :presence => true

  include HTTParty
    base_uri 'https://api.data.charitynavigator.org/v2/'

  def posts_environment
    options = {
      query: {
        app_id: '2b1ffdad',
        app_key: ENV['CN_APP_KEY'],
        rated: 'true',
        categoryID: '4'
      }
    }

    self.class.get("/Organizations/", options)
  end

  def posts_health
    options = {
      query: {
        app_id: '2b1ffdad',
        app_key: ENV['CN_APP_KEY'],
        rated: 'true',
        categoryID: '5'
      }
    }

    self.class.get("/Organizations/", options)
  end

  def self.store
    nonprofit = Nonprofit.new
    environment_response = nonprofit.posts_environment
    health_response = nonprofit.posts_health
    environment_response.first(10).each do |item|
      name = item['charityName']
      info = item['mission']
      website = item['websiteURL']
      this = Nonprofit.new(name: name, info: info, website: website, image: "nonprofit1.jpg", type_id: Type.all[4].id)
      this.save!
      end
    health_response.first(10).each do |item|
      name = item['charityName']
      info = item['mission']
      website = item['websiteURL']
      this = Nonprofit.new(name: name, info: info, website: website, image: "nonprofit1.jpg", type_id: Type.all[5].id)
      this.save!
    end
  end

end
