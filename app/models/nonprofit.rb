class Nonprofit < ActiveRecord::Base
  belongs_to :type
  has_many :order_items

  validates :name, :presence => true
  validates :info, :presence => true

  scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}

  def self.search(search)

  if search
    find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  else
    "none"
  end
end


end
