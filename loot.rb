class Loot
  def initialize
    @value = 10
    @wield = false
    @wear = false
  end
  attr_reader :wield, :wear, :value
end

class Weapon < Loot
  def initialize
    @value = 1
    @wield = true
    @damage = 1
    @wear = false
    @damage_type = 'poke'
  end
  attr_reader :damage_type, :damage
end

class Katana < Weapon
  def initialize
    @value = 6
    @damage = 6
    @damage_type = 'slice'
  end
end

class PoopAxe < Weapon
  def initialize
    @value = 6
    @damage = 7
    @damage_type = 'slice of stench'
  end
end

class Spear < Weapon
  def initialize
    @value = 7
    @damage = 6
    @damage_type = 'stab'
  end
end


class Claw < Weapon
  def initialize
    @value = 0
    @damage = 1
    @damage_type = 'scratch'
  end
end
