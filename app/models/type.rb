class Type < ActiveRecord::Base
  has_many :nonprofits
  
    scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}
end
