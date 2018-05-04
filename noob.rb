class Noob
  def initialize
    @exp = 0
    @level = 1
    @hp = 100
    @attack = 10
    @inventory = []
    @max_inventory = 5
    @wield = Spear.new
  end

  def summon_goblin
    # when the noob summons a mob, it will start a fight to the death!!!
    mob = Goblin.new
    start_fight mob
  end

  def summon_poop
    mob = Poop.new
    start_fight mob
  end


  def summon_shadow
    # when the noob summons a mob, it will start a fight to the death!!!
    mob = Shadow.new
    start_fight mob
  end

  def summon_ninja
    # when the noob summons a mob, it will start a fight to the death!!!
    mob = Ninja.new
    start_fight mob
  end

  def summon_weakling
    # when the noob summons a mob, it will start a fight to the death!!!
    mob = Weakling.new
    start_fight mob
  end

  def summon_dark_chick
    # when the noob summons a mob, it will start a fight to the death!!!
    mob = Dark_Chick.new
    start_fight mob
  end

  def summon_elder_dragon
    # when the noob summons a mob, it will start a fight to the death!!!
    mob = Elder_Dragon.new
    start_fight mob
  end

  def level_to(level)
    @exp = level*100
    while ding? do
      level_up
    end
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

  def die
    puts "YOU ARE DEAD!!!"
  end

  def attack(opponent)
    damage = 0
    if rand(10) < 2 + (@level / 5)
      puts "Your #{@wield.damage_type} mauls the #{opponent.class}"
      damage = @attack + @wield.damage
    else
      puts "#{opponent.class} dodges your attack!"
    end
    opponent.take_damage(damage)
    award_exp(opponent) unless opponent.alive?
  end

  def award_exp(opponent)
    award = opponent.value_exp - ((@level - opponent.level) * 10)
    award = (award > 0) ? award : 0
    puts "You receive #{award} exp!"
    @exp += award
    while ding?
      level_up
    end
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
    @hp > 0
  end
end
