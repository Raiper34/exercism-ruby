require 'prime'

class Raindrops

  RAINDROPS_MAP = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong',
  }

  def self.convert(num)
    raindrops = RAINDROPS_MAP.select{ |key| num % key == 0}.values
    raindrops.empty? ? num.to_s : raindrops.join
  end

end
