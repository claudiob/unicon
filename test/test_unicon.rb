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

  def test_it_offers_the_things_an_app_has_and_withholds_what_it_does
    assert_includes Unicon.meanings, :house
    assert_includes Unicon.actions, :close
    refute_includes Unicon.meanings, :close
    assert_includes Unicon.concepts, :home
    refute_includes Unicon.meanings, :home
    assert_equal Unicon.concepts.sort, Unicon.concepts
  end
end
