class Destination < ActiveRecord::Base

  ROSARIO_CODE = 2000

  def self.possible_paths
    self.all
    .reject { |x| x.code == Destination::ROSARIO_CODE }
    .map { |y| [ [ROSARIO_CODE, y.code], [y.code, ROSARIO_CODE] ] }
    .reduce :concat
  end

end
