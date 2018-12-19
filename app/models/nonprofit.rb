class Nonprofit < ActiveRecord::Base
  belongs_to :type
  belongs_to :favorites
  has_many :order_items

  validates :name, :presence => true
  validates :info, :presence => true
end
