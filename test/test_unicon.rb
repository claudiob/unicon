require_relative 'test_helper'

class TestUnicon < Minitest::Test
  def test_it_answers_the_circle_when_nothing_is_known_by_that_name
    assert_equal Unicon.fetch(:circle), Unicon.fetch(:nothing_by_this_name)
  end

  def test_it_reads_a_model_name_as_the_concept_it_borrows_from
    assert_equal Unicon[:house], Unicon['home']
  end

  def test_it_lists_names_to_check_against_and_meanings_to_choose_from
    assert_equal Unicon.concepts.sort, Unicon.concepts
    assert_includes Unicon.concepts, :home
    refute_includes Unicon.meanings, :home
  end
end
