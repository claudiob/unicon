require_relative 'test_helper'

class TestUnicon < Minitest::Test
  def test_it_answers_the_circle_when_nothing_is_known_by_that_name
    assert_equal Unicon.fetch(:circle), Unicon.fetch(:nothing_by_this_name)
  end

  def test_it_names_icons_in_frozen_strings_under_symbol_keys
    house = Unicon['home']

    assert_equal({ bootstrap: 'house', ios: 'house', android: 'home' }, house)
    assert_equal Unicon[:house], house
    assert_predicate house.fetch(:android), :frozen?
  end

  def test_it_offers_one_name_per_picture_and_resolves_many_more
    assert_includes Unicon.icons, :house
    assert_includes Unicon.actions, :close
    refute_includes Unicon.icons, :close
    assert_includes Unicon.names, :home
    refute_includes Unicon.icons, :home
    assert_equal Unicon.names.sort, Unicon.names
  end
end
