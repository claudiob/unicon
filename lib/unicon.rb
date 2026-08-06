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
  # One entry per distinct picture, keyed by the thing it draws
  ICONS = {
    **CHARTS, **COMMERCE, **COMMUNICATION, **DEVICES, **FILES, **LAYOUT, **MEDIA, **NATURE,
    **PEOPLE, **PLACES, **SECURITY, **STATUS, **TIME, **TOOLS, **TRANSPORT,
  }.freeze

  # The pictures for what an app does rather than has, which no record is ever named after
  ACTIONS = { **EDITING, **PLAYING, **POINTING, **SENDING, **SWITCHING }.freeze

  # Everything a lookup resolves, keyed to its picture: the icons, the actions, and the
  # model synonyms borrowing one
  TABLE = {
    **ICONS, **ACTIONS,
    **ALIASES.transform_values { |concept| ICONS[concept] || ACTIONS.fetch(concept) },
  }.each_value { |names| names.each_value(&:freeze).freeze }.freeze

  # What to show in a picker: one name per picture, so no two entries draw the same thing
  ICON_NAMES = ICONS.keys.sort.freeze

  # Every key of `TABLE`, alphabetically: icons, actions and model synonyms together
  NAMES = TABLE.keys.sort.freeze

  # The doing words among them, which `ICON_NAMES` leaves out on purpose
  ACTION_NAMES = ACTIONS.keys.sort.freeze

  # The three names for a concept, or the circle's when nothing is known by that name
  def self.fetch(concept)
    TABLE.fetch concept.to_s.to_sym, TABLE.fetch(:circle)
  end

  # Shorthand for `fetch`
  def self.[](concept) = fetch concept

  # One name per distinct picture: the list to offer somebody choosing an icon
  def self.icons = ICON_NAMES

  # The union of all three groups — icons, actions and model synonyms — and so every name
  # `fetch` resolves. Ask for this to find out whether a name draws something; ask for
  # `icons` when somebody is choosing one.
  def self.names = NAMES

  # The pictures for what an app does: fetchable by name, never offered as a choice
  def self.actions = ACTION_NAMES
end
