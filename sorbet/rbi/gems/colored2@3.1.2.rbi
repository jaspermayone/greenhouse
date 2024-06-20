# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `colored2` gem.
# Please instead update this file by running `bin/tapioca gem colored2`.


# source://colored2//lib/colored2/codes.rb#1
module Colored2
  class << self
    # source://colored2//lib/colored2/ascii_decorator.rb#11
    def background_next!; end

    # @return [Boolean]
    #
    # source://colored2//lib/colored2/ascii_decorator.rb#17
    def background_next?; end

    # source://colored2//lib/colored2.rb#5
    def decorate(a_class); end

    # source://colored2//lib/colored2/ascii_decorator.rb#8
    def disable!; end

    # source://colored2//lib/colored2/ascii_decorator.rb#5
    def enable!; end

    # source://colored2//lib/colored2/ascii_decorator.rb#14
    def foreground_next!; end

    # @private
    #
    # source://colored2//lib/colored2.rb#9
    def included(from_class); end
  end
end

# source://colored2//lib/colored2/ascii_decorator.rb#21
class Colored2::AsciiDecorator
  extend ::Forwardable

  # @return [AsciiDecorator] a new instance of AsciiDecorator
  #
  # source://colored2//lib/colored2/ascii_decorator.rb#51
  def initialize(a_string); end

  # options[:start] = :color
  # options[:end]   = :color | :no_color
  #
  # source://colored2//lib/colored2/ascii_decorator.rb#58
  def decorate(options = T.unsafe(nil)); end

  # source://forwardable/1.3.3/forwardable.rb#231
  def disable!(*args, **_arg1, &block); end

  # source://forwardable/1.3.3/forwardable.rb#231
  def enable!(*args, **_arg1, &block); end

  # Returns the value of attribute my_class.
  #
  # source://colored2//lib/colored2/ascii_decorator.rb#49
  def my_class; end

  # Sets the attribute my_class
  #
  # @param value the value to set the attribute my_class to.
  #
  # source://colored2//lib/colored2/ascii_decorator.rb#49
  def my_class=(_arg0); end

  # Returns the value of attribute string.
  #
  # source://colored2//lib/colored2/ascii_decorator.rb#49
  def string; end

  # Sets the attribute string
  #
  # @param value the value to set the attribute string to.
  #
  # source://colored2//lib/colored2/ascii_decorator.rb#49
  def string=(_arg0); end

  # source://colored2//lib/colored2/ascii_decorator.rb#76
  def un_decorate; end

  private

  # source://colored2//lib/colored2/ascii_decorator.rb#82
  def no_color; end

  class << self
    # Returns the value of attribute __background_next.
    #
    # source://colored2//lib/colored2/ascii_decorator.rb#25
    def __background_next; end

    # Sets the attribute __background_next
    #
    # @param value the value to set the attribute __background_next to.
    #
    # source://colored2//lib/colored2/ascii_decorator.rb#25
    def __background_next=(_arg0); end

    # Returns the value of attribute __colors_disabled.
    #
    # source://colored2//lib/colored2/ascii_decorator.rb#25
    def __colors_disabled; end

    # Sets the attribute __colors_disabled
    #
    # @param value the value to set the attribute __colors_disabled to.
    #
    # source://colored2//lib/colored2/ascii_decorator.rb#25
    def __colors_disabled=(_arg0); end

    # source://colored2//lib/colored2/ascii_decorator.rb#35
    def background_next!; end

    # @return [Boolean]
    #
    # source://colored2//lib/colored2/ascii_decorator.rb#41
    def background_next?; end

    # source://colored2//lib/colored2/ascii_decorator.rb#32
    def disable!; end

    # source://colored2//lib/colored2/ascii_decorator.rb#26
    def enable!; end

    # @return [Boolean]
    #
    # source://colored2//lib/colored2/ascii_decorator.rb#29
    def enabled?; end

    # source://colored2//lib/colored2/ascii_decorator.rb#38
    def foreground_next!; end
  end
end

# source://colored2//lib/colored2/codes.rb#57
class Colored2::BackgroundColor < ::Colored2::TextColor
  # source://colored2//lib/colored2/codes.rb#58
  def value; end
end

# source://colored2//lib/colored2/codes.rb#3
Colored2::COLORS = T.let(T.unsafe(nil), Hash)

# source://colored2//lib/colored2/codes.rb#25
class Colored2::Code
  # @raise [ArgumentError]
  # @return [Code] a new instance of Code
  #
  # source://colored2//lib/colored2/codes.rb#27
  def initialize(name); end

  # Returns the value of attribute escape.
  #
  # source://colored2//lib/colored2/codes.rb#26
  def escape; end

  # Sets the attribute escape
  #
  # @param value the value to set the attribute escape to.
  #
  # source://colored2//lib/colored2/codes.rb#26
  def escape=(_arg0); end

  # Returns the value of attribute name.
  #
  # source://colored2//lib/colored2/codes.rb#26
  def name; end

  # Sets the attribute name
  #
  # @param value the value to set the attribute name to.
  #
  # source://colored2//lib/colored2/codes.rb#26
  def name=(_arg0); end

  # source://colored2//lib/colored2/codes.rb#40
  def to_s; end

  # source://colored2//lib/colored2/codes.rb#34
  def value(shift = T.unsafe(nil)); end
end

# source://colored2//lib/colored2/codes.rb#14
Colored2::EFFECTS = T.let(T.unsafe(nil), Hash)

# source://colored2//lib/colored2/codes.rb#45
class Colored2::Effect < ::Colored2::Code
  # source://colored2//lib/colored2/codes.rb#46
  def codes; end
end

# source://colored2//lib/colored2/codes.rb#51
class Colored2::TextColor < ::Colored2::Code
  # source://colored2//lib/colored2/codes.rb#52
  def codes; end
end

class String
  include ::Comparable
  include ::Colored2
end