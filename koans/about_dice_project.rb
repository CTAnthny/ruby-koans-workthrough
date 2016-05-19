require File.expand_path(File.dirname(__FILE__) + '/neo')

# Implement a DiceSet Class here:
#
class DiceSet
  attr_reader :dice_roll

  def roll(number_of_dice)
    if number_of_dice >= 1 && number_of_dice <= 6
      @dice_roll = []
      number_of_dice.times do
        @dice_roll << rand(6) + 1
      end
    else
      raise StandardError, "number of dice to roll #{number_of_dice} must be between 1 and 6"
    end
  end
end

class AboutDiceProject < Neo::Koan
  def test_can_create_a_dice_set
    dice = DiceSet.new
    assert_not_nil dice
  end

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    dice = DiceSet.new

    dice.roll(5)
    assert dice.dice_roll.is_a?(Array), "should be an array"
    assert_equal 5, dice.dice_roll.size
    dice.dice_roll.each do |value|
      assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
    end
  end

  def test_dice_values_do_not_change_unless_explicitly_rolled
    dice = DiceSet.new
    dice.roll(5)
    first_time = dice.dice_roll
    second_time = dice.dice_roll
    assert_equal first_time, second_time
  end

  def test_dice_values_should_change_between_rolls
    dice = DiceSet.new

    dice.roll(5)
    first_time = dice.dice_roll

    dice.roll(5)
    second_time = dice.dice_roll

    assert_not_equal first_time, second_time,
      "Two rolls should not be equal"

    # THINK ABOUT IT:
    #
    # If the rolls are random, then it is possible (although not
    # likely) that two consecutive rolls are equal.  What would be a
    # better way to test this?
  end

  def test_you_can_roll_different_numbers_of_dice
    dice = DiceSet.new

    dice.roll(3)
    assert_equal 3, dice.dice_roll.size

    dice.roll(1)
    assert_equal 1, dice.dice_roll.size
  end

end
