class Nonprofit < ActiveRecord::Base


  def self.search(search)
    if search
      where('name LIKE ?', "%#{params[:search]}%")
    else
      scoped
    end
  end
  #
  # scope :search, -> (name_parameter) { where("name like ?", "%#{name_parameter}%")}
  #


end
