require 'unicon/version'
require 'unicon/icons/actions'
require 'unicon/icons/aliases'
require 'unicon/icons/arrows'
require 'unicon/icons/charts'
require 'unicon/icons/commerce'
require 'unicon/icons/communication'
require 'unicon/icons/devices'
require 'unicon/icons/files'
require 'unicon/icons/layout'
require 'unicon/icons/media'
require 'unicon/icons/nature'
require 'unicon/icons/people'
require 'unicon/icons/places'
require 'unicon/icons/security'
require 'unicon/icons/status'
require 'unicon/icons/time'
require 'unicon/icons/tools'
require 'unicon/icons/transport'

# Names one concept's icon in three design systems, so an app states the concept and
# each client draws it from the set it already ships: `:bootstrap` for Bootstrap Icons,
# `:ios` for SF Symbols, `:android` for Material Symbols.
module Unicon
  # Every concept, keyed by what it means rather than by what any one system calls it
  MEANINGS = {
    **ACTIONS, **ARROWS, **CHARTS, **COMMERCE, **COMMUNICATION, **DEVICES, **FILES, **LAYOUT,
    **MEDIA, **NATURE, **PEOPLE, **PLACES, **SECURITY, **STATUS, **TIME, **TOOLS, **TRANSPORT,
  }.freeze

  # Every name the gem answers to: the concepts, and the model names borrowing from them
  ICONS = {
    **MEANINGS, **ALIASES.transform_values { |concept| MEANINGS.fetch concept },
  }.each_value(&:freeze).freeze

  # Those names in alphabetical order, so a picker built from them does not shuffle
  CONCEPTS = ICONS.keys.sort.freeze

  # The three names for a concept, or the circle's when nothing is known by that name
  def self.fetch(concept)
    ICONS.fetch concept.to_s.to_sym, ICONS.fetch(:circle)
  end

  # Shorthand for `fetch`
  def self.[](concept) = fetch concept

  # Every name `fetch` answers to, for a caller offering the whole list
  def self.concepts = CONCEPTS
end
