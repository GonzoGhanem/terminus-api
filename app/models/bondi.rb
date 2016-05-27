class Bondi < ActiveRecord::Base
  
  scope :from_to, ->(origin,destination) { where("origin = ? AND destination = ?", origin, destination) }
  scope :next_three_from_now, -> { where('departure > ?', Time.current).first(3) } 

end
