class Noob
  def initialize
    @exp = 110
    @level = 2
    @hp = 110
    @attack = 11
  end

  def summon_goblin
    # when the noob summons a mob, it will start a fight to the death!!!
    mob = Goblin.new
    start_fight mob
  end

  def summon_ninja
    # when the noob summons a mob, it will start a fight to the death!!!
    mob = Ninja.new
    start_fight mob
  end

  def level_to(level)
    # TODO make a cheat way to level us up
  end

  def sg
    summon_goblin
  end

  def start_fight(mob)
    while (self.alive? && mob.alive?) do
      attack(mob)
      mob.attack(self)
      puts "\tYou have #{@hp}hp : #{mob.class} has #{mob.hp}hp"
      sleep(1)
    end
    puts "The #{mob.class} dies in a pool of blood and guts!" unless mob.alive?
  end

  def attack(opponent)
    damage = 0
    if rand(10) < (2+@level)
      puts "You MASSACRE the #{opponent.class}"
      damage = @attack
    else
      puts "#{opponent.class} dodges your attack!"
    end
    opponent.take_damage(damage)
    award_exp(opponent.value_exp) unless opponent.alive?
  end

  def award_exp(award)
    @exp += award
    level_up if ding?
  end

  def ding?
    @exp > @level*100
  end

  def level_up
    @attack += 1
    @hp = @level*10 + 100
    @level += 1
    puts "Level up!"
  end

  def take_damage(dmg)
    @hp = @hp - dmg
    die if @hp < 1
  end

  def alive?
    @hp > 1
  end
end

################################################################################
class Mob
  def initialize
    @hp = 30
    @level = 1
    @attack = 6
    @value_exp = 30
  end
  attr_reader :value_exp, :hp

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
    @value_exp = 50
  end
end
