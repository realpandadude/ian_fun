class Goblin < Mob
end

class Poop < Mob
  def initialize
    @hp = 1
    @level = 1
    @attack = 1
    @value_exp = 10
  end
end

class Ninja < Mob
  def initialize
    @hp = 50
    @level = 2
    @attack = 12
    @value_exp = 40
    @wield = Katana.new
  end
end

class Weakling < Mob
  def initialize
    @hp = 21
    @level = 1
    @attack = 1
    @value_exp = 35
  end
end

class Dark_Chick < Mob
  def initialize
    @hp = 40
    @level = 3
    @attack = 19
    @value_exp = 40
  end
end

class Shadow < Mob
  def initialize
    @hp = 119
    @level = 5
    @attack = 12
    @value_exp = 43
  end
end

class Elder_Dragon < Mob
  def initialize
    @hp = 1000
    @level = 100
    @attack = 200
    @value_exp = 2000
  end
end
