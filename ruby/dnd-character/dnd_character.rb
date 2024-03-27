# Write your code for the 'D&D Character' exercise in this file. Make the tests in
# `dnd_character_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/dnd-character` directory.

class DndCharacter
  def self.modifier(constitution)
    ((constitution - 10) / 2).floor
  end

  def initialize
    @constitution = random_dice_sum
    @strength = random_dice_sum
    @dexterity = random_dice_sum
    @intelligence = random_dice_sum
    @wisdom = random_dice_sum
    @charisma = random_dice_sum
    @modifier = DndCharacter.modifier(@constitution)
  end

  attr_reader :constitution, :strength, :dexterity, :intelligence, :wisdom, :charisma

  def hitpoints
    10 + @modifier
  end

  private

  def random_dice_sum
    values = []
    until values.length == 4
      values.push(
        rand(1..6)
      )
    end
    values.delete_at(values.index(values.min))
    values.sum
  end
end
