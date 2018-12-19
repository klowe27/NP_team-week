class Nonprofit < ActiveRecord::Base
  belongs_to :type
  has_many :order_items

  validates :name, :presence => true
  validates :info, :presence => true

  # scope :name, -> (name_parameter) { where("name like ?", "%#{name_parameter}%") }

end
