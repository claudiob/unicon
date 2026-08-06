require 'unicon/version'
require 'unicon/icons/actions/editing'
require 'unicon/icons/actions/playing'
require 'unicon/icons/actions/pointing'
require 'unicon/icons/actions/sending'
require 'unicon/icons/actions/switching'
require 'unicon/icons/aliases'
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
  # Concepts naming something an app has, which is what a picker offers as a model's icon
  MEANINGS = {
    **CHARTS, **COMMERCE, **COMMUNICATION, **DEVICES, **FILES, **LAYOUT, **MEDIA, **NATURE,
    **PEOPLE, **PLACES, **SECURITY, **STATUS, **TIME, **TOOLS, **TRANSPORT,
  }.freeze

  # Concepts naming something an app does, which a toolbar draws and no model is named after
  ACTIONS = { **EDITING, **PLAYING, **POINTING, **SENDING, **SWITCHING }.freeze

  # Every name a lookup answers to: both of those, and the model names borrowing from them
  ICONS = {
    **MEANINGS, **ACTIONS,
    **ALIASES.transform_values { |concept| MEANINGS[concept] || ACTIONS.fetch(concept) },
  }.each_value { |names| names.each_value(&:freeze).freeze }.freeze

  # Every name in `ICONS`, alphabetically, so no order depends on the merge above
  CONCEPT_NAMES = ICONS.keys.sort.freeze

  # The names in `MEANINGS` alone, alphabetically
  MEANING_NAMES = MEANINGS.keys.sort.freeze

  # The names in `ACTIONS` alone, alphabetically
  ACTION_NAMES = ACTIONS.keys.sort.freeze

  # The three names for a concept, or the circle's when nothing is known by that name
  def self.fetch(concept)
    ICONS.fetch concept.to_s.to_sym, ICONS.fetch(:circle)
  end

  # Shorthand for `fetch`
  def self.[](concept) = fetch concept

  # Every name `fetch` answers to, actions and model names included: what to check against
  def self.concepts = CONCEPT_NAMES

  # The concepts an app has a model of: what to offer somebody choosing a model's icon
  def self.meanings = MEANING_NAMES

  # The concepts an app does rather than has: fetchable, never offered as a model's icon
  def self.actions = ACTION_NAMES
end
