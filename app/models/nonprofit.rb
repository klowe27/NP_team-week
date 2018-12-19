class Nonprofit < ActiveRecord::Base
  belongs_to :type
  has_many :favorites
  has_many :order_items

  validates :name, :presence => true
  validates :info, :presence => true

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

private

  def nonprofit_params
    params.require(:search).permit(:nonprofit, :nonprofit.name)
  end


end
