# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `name_of_person` gem.
# Please instead update this file by running `bin/tapioca gem name_of_person`.


# source://name_of_person//lib/name_of_person.rb#1
module NameOfPerson; end

# source://name_of_person//lib/name_of_person/assignable_name.rb#4
module NameOfPerson::AssignableName
  # Returns a PersonName object created from the first_name and last_name attributes.
  #
  # source://name_of_person//lib/name_of_person/assignable_name.rb#12
  def name; end

  # Assigns first_name and last_name attributes as extracted from a supplied full name.
  #
  # source://name_of_person//lib/name_of_person/assignable_name.rb#6
  def name=(name); end
end

# source://name_of_person//lib/name_of_person/has_person_name.rb#4
module NameOfPerson::HasPersonName
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::NameOfPerson::HasPersonName::ClassMethods
end

# source://name_of_person//lib/name_of_person/has_person_name.rb#0
module NameOfPerson::HasPersonName::ClassMethods
  # source://name_of_person//lib/name_of_person/has_person_name.rb#9
  def has_person_name; end
end

# source://name_of_person//lib/name_of_person/person_name.rb#5
class NameOfPerson::PersonName < ::String
  # @raise [ArgumentError]
  # @return [PersonName] a new instance of PersonName
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#13
  def initialize(first, last = T.unsafe(nil)); end

  # Returns first initial + last, such as "J. Fried".
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#30
  def abbreviated; end

  # Override to_yaml to serialize as a plain string.
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#63
  def encode_with(coder); end

  # Returns first + last initial, such as "Jason F.".
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#25
  def familiar; end

  # Returns the value of attribute first.
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#6
  def first; end

  # Returns first + last, such as "Jason Fried".
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#20
  def full; end

  # Returns just the initials.
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#53
  def initials; end

  # Returns the value of attribute last.
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#6
  def last; end

  # Returns a mentionable version of the familiar name
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#58
  def mentionable; end

  # Returns full name with with trailing 's or ' if name ends in s.
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#40
  def possessive(method = T.unsafe(nil)); end

  # Returns last + first for sorting.
  #
  # source://name_of_person//lib/name_of_person/person_name.rb#35
  def sorted; end

  class << self
    # source://name_of_person//lib/name_of_person/person_name.rb#8
    def full(full_name); end
  end
end
