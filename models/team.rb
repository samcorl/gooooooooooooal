class Team
  attr_accessor :name, :points

  def initialize(name)
    @name = name
    @points = 0
  end

  def sortval
    "#{sprintf("%4.4d", 1000-points.to_i)}#{name}"
  end
end
