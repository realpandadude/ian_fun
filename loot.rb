class Loot
  def initialize
    @value = 10
    @wield = false
    @wear = false
  end
  attr_reader :wield, :wear
end

class Weapon < Loot
  def initialize
    @value = 1
    @wield = true
    @damage = 1
    @wear = false
    @damage_type = 'poke'
  end
end

class Katana < Weapon
  def initialize
    @value = 6
    @damage = 6
    @damage_type = 'slice'
  end
end
