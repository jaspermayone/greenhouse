# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `namae` gem.
# Please instead update this file by running `bin/tapioca gem namae`.


# Namae is a parser for human names. It recognizes personal names of
# various cultural backgrounds and tries to split them into their
# component parts (e.g., given and family names, honorifics etc.).
#
# The main use case of Namae is to use the {Namae.parse .parse} or
# {Namae.parse! .parse!} method to parse a string of names and return
# a list of {Namae::Name Name} objects.
#
# @example Name parsing
#   Namae.parse('Yukihiro "Matz" Matsumoto')
#   #=> [#<Name family="Matsumoto" given="Yukihiro" nick="Matz">]
#
#   Namae.parse('Torvalds, Linus and Cox, Alan')
#   #=> [#<Name family="Torvalds" given="Linus">, #<Name family="Cox" given="Alan">]
#
# source://namae//lib/namae/version.rb#1
module Namae
  private

  # @yield [Hash] the parser's default configuration.
  #
  # source://namae//lib/namae/utility.rb#48
  def configure; end

  # @return [Hash] the parser's current configuration.
  #
  # source://namae//lib/namae/utility.rb#43
  def options; end

  # Parses the passed-in string and returns a list of names. Behaves like
  # parse but returns an empty list for bad input without raising an error.
  #
  # @param names [String] the name or names to be parsed
  # @return [Array] the list of parsed names
  # @see parse!
  #
  # source://namae//lib/namae/utility.rb#28
  def parse(names); end

  # Parses the passed-in string and returns a list of names.
  #
  # @param names [String] the name or names to be parsed
  # @raise [ArgumentError] if the string cannot be parsed.
  # @return [Array] the list of parsed names
  #
  # source://namae//lib/namae/utility.rb#38
  def parse!(names); end

  class << self
    # @yield [Hash] the parser's default configuration.
    #
    # source://namae//lib/namae/utility.rb#48
    def configure; end

    # @return [Hash] the parser's current configuration.
    #
    # source://namae//lib/namae/utility.rb#43
    def options; end

    # Parses the passed-in string and returns a list of names. Behaves like
    # parse but returns an empty list for bad input without raising an error.
    #
    # @param names [String] the name or names to be parsed
    # @return [Array] the list of parsed names
    # @see parse!
    #
    # source://namae//lib/namae/utility.rb#28
    def parse(names); end

    # Parses the passed-in string and returns a list of names.
    #
    # @param names [String] the name or names to be parsed
    # @raise [ArgumentError] if the string cannot be parsed.
    # @return [Array] the list of parsed names
    #
    # source://namae//lib/namae/utility.rb#38
    def parse!(names); end
  end
end

# A Name represents a single personal name, exposing its constituent
# parts (e.g., family name, given name etc.). Name instances are typically
# created and returned from {Namae.parse Namae.parse}.
#
#     name = Namae.parse('Yukihiro "Matz" Matsumoto')[0]
#
#     name.family #=> Matsumoto
#     name.nick #=> Matz
#     name.given #=> Yukihiro
#
# source://namae//lib/namae/name.rb#86
class Namae::Name < ::Struct
  include ::Namae::NameFormatting

  # @example
  #   Name.new(:family => 'Matsumoto')
  # @param attributes [Hash] the individual parts of the name
  # @param sanitize [Boolean] whether or not to apply extra
  #   sanitation rules
  # @return [Name] a new instance of Name
  #
  # source://namae//lib/namae/name.rb#127
  def initialize(attributes = T.unsafe(nil), sanitize = T.unsafe(nil)); end

  # @return [Boolean] whether or not all the name components are nil.
  #
  # source://namae//lib/namae/name.rb#142
  def empty?; end

  # @return [String] a string representation of the name
  #
  # source://namae//lib/namae/name.rb#194
  def inspect; end

  # Merges the name with the passed-in name or hash.
  #
  # @param other [#each_pair] the other name or hash
  # @raise [ArgumentError]
  # @return [self]
  #
  # source://namae//lib/namae/name.rb#150
  def merge(other); end

  # source://namae//lib/namae/name.rb#186
  def merge_particles!; end

  # source://namae//lib/namae/name.rb#178
  def normalize_initials(options = T.unsafe(nil)); end

  # source://namae//lib/namae/name.rb#14
  def to_s; end

  # @example
  #   name.values_at(:family, :nick) #=> ['Matsumoto', 'Matz']
  # @overload values_at
  # @return [Array] the list of values
  # @see Struct#values_at
  #
  # source://namae//lib/namae/name.rb#174
  def values_at(*arguments); end

  class << self
    # Returns the value of attribute defaults.
    #
    # source://namae//lib/namae/name.rb#102
    def defaults; end

    # @param name [String] the name to be parsed
    # @return [Name] the parsed name
    #
    # source://namae//lib/namae/name.rb#114
    def parse(name); end

    # @param name [String] the name to be parsed
    # @raise [ArgumentError] if the name cannot be parsed or if the input
    #   contains more than a single name
    # @return [Name] the parsed name
    #
    # source://namae//lib/namae/name.rb#108
    def parse!(name); end

    # Returns the value of attribute parts.
    #
    # source://namae//lib/namae/name.rb#102
    def parts; end
  end
end

# NameFormatting can be mixed in by an object providing individual
# name parts (family, given, suffix, particle, etc.) to add support
# for name formatting.
#
# source://namae//lib/namae/name.rb#6
module Namae::NameFormatting
  # @return [String] the name in display order
  #
  # source://namae//lib/namae/name.rb#14
  def display_order; end

  # @option options
  # @option options
  # @option options
  # @param options [Hash] the options to create the initials
  # @return [String] the name's initials.
  #
  # source://namae//lib/namae/name.rb#25
  def initials(options = T.unsafe(nil)); end

  # @return [String] the name in sort order
  #
  # source://namae//lib/namae/name.rb#9
  def sort_order(delimiter = T.unsafe(nil)); end

  private

  # @param name [String] a name or part of a name
  # @return [String] the passed-in name with normalized initials
  #
  # source://namae//lib/namae/name.rb#55
  def existing_initials_of(name, options = T.unsafe(nil)); end

  # source://namae//lib/namae/name.rb#37
  def family_part; end

  # source://namae//lib/namae/name.rb#41
  def given_part; end

  # @param name [String] a name or part of a name
  # @return [String] the initials of the passed-in name
  #
  # source://namae//lib/namae/name.rb#47
  def initials_of(name, options = T.unsafe(nil)); end
end

# source://namae//lib/namae/parser.rb#12
class Namae::Parser < ::Racc::Parser
  def initialize(options = T.unsafe(nil)); end

  def _reduce_1(val, _values, result); end
  def _reduce_10(val, _values, result); end
  def _reduce_11(val, _values, result); end
  def _reduce_12(val, _values, result); end
  def _reduce_13(val, _values, result); end
  def _reduce_14(val, _values, result); end
  def _reduce_15(val, _values, result); end
  def _reduce_16(val, _values, result); end
  def _reduce_17(val, _values, result); end
  def _reduce_18(val, _values, result); end
  def _reduce_2(val, _values, result); end
  def _reduce_20(val, _values, result); end
  def _reduce_21(val, _values, result); end
  def _reduce_26(val, _values, result); end
  def _reduce_27(val, _values, result); end
  def _reduce_28(val, _values, result); end
  def _reduce_29(val, _values, result); end
  def _reduce_3(val, _values, result); end
  def _reduce_31(val, _values, result); end
  def _reduce_35(val, _values, result); end
  def _reduce_4(val, _values, result); end
  def _reduce_47(val, _values, result); end
  def _reduce_51(val, _values, result); end
  def _reduce_6(val, _values, result); end
  def _reduce_7(val, _values, result); end
  def _reduce_9(val, _values, result); end

  # source://namae//lib/namae/parser.rb#676
  def _reduce_none(val, _values, result); end

  def appellation; end
  def comma; end
  def debug?; end
  def include_particle_in_family?; end
  def input; end
  def normalize(string); end
  def options; end
  def parse(string); end
  def parse!(string); end
  def prefer_comma_as_separator?; end
  def reset; end
  def separator; end
  def stops; end
  def suffix; end
  def title; end
  def uppercase_particle; end

  private

  def consume_comma; end
  def consume_separator; end
  def consume_word(type, word); end
  def last_token; end
  def next_token; end
  def on_error(tid, value, stack); end
  def seen_full_name?; end
  def seen_separator?; end
  def stack; end
  def suffix?; end
  def will_see_initial?; end
  def will_see_suffix?; end

  class << self
    def defaults; end
    def instance; end
  end
end

# source://namae//lib/namae/parser.rb#367
Namae::Parser::Racc_arg = T.let(T.unsafe(nil), Array)

# source://namae//lib/namae/parser.rb#419
Namae::Parser::Racc_debug_parser = T.let(T.unsafe(nil), FalseClass)

# source://namae//lib/namae/parser.rb#384
Namae::Parser::Racc_token_to_s_table = T.let(T.unsafe(nil), Array)

# source://namae//lib/namae/version.rb#2
module Namae::Version; end

# source://namae//lib/namae/version.rb#6
Namae::Version::BUILD = T.let(T.unsafe(nil), T.untyped)

# source://namae//lib/namae/version.rb#3
Namae::Version::MAJOR = T.let(T.unsafe(nil), Integer)

# source://namae//lib/namae/version.rb#4
Namae::Version::MINOR = T.let(T.unsafe(nil), Integer)

# source://namae//lib/namae/version.rb#5
Namae::Version::PATCH = T.let(T.unsafe(nil), Integer)

# source://namae//lib/namae/version.rb#8
Namae::Version::STRING = T.let(T.unsafe(nil), String)
