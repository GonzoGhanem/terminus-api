class Destination < ActiveRecord::Base
  
  def self.possible_paths
    ##Example output [[[944, 2000], [2000, 944]], [[944, 122], [122, 944]], [[2000, 122], [122, 2000]]]
    combinations = Destination.all.pluck(:code).combination(2).map do |x|
      [x, x.reverse]
    end
    combinations.reduce :concat
  end

end
