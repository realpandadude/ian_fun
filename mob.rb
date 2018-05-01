class Mob
  def initialize
    @hp = 30
    @level = 1
    @attack = 6
    @value_exp = 30
  end
  attr_reader :value_exp, :hp, :level, :level_exp

  def attack(opponent)
    damage = 0
    if rand(10) < 2
      puts "#{self.class} rips you for #{@attack}"
      damage = @attack
    else
      puts "#{self.class} misses"
    end
    opponent.take_damage(damage)
  end

  def take_damage(dmg)
    @hp = @hp - dmg
  end

  def alive?
    @hp > 1
  end
end
#############################################################################
