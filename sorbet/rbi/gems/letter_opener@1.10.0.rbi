# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `letter_opener` gem.
# Please instead update this file by running `bin/tapioca gem letter_opener`.


# source://letter_opener//lib/letter_opener.rb#1
module LetterOpener
  class << self
    # source://letter_opener//lib/letter_opener.rb#6
    def configuration; end

    # @yield [configuration]
    #
    # source://letter_opener//lib/letter_opener.rb#10
    def configure; end
  end
end

# source://letter_opener//lib/letter_opener/configuration.rb#2
class LetterOpener::Configuration
  # @return [Configuration] a new instance of Configuration
  #
  # source://letter_opener//lib/letter_opener/configuration.rb#5
  def initialize; end

  # Returns the value of attribute file_uri_scheme.
  #
  # source://letter_opener//lib/letter_opener/configuration.rb#3
  def file_uri_scheme; end

  # Sets the attribute file_uri_scheme
  #
  # @param value the value to set the attribute file_uri_scheme to.
  #
  # source://letter_opener//lib/letter_opener/configuration.rb#3
  def file_uri_scheme=(_arg0); end

  # Returns the value of attribute location.
  #
  # source://letter_opener//lib/letter_opener/configuration.rb#3
  def location; end

  # Sets the attribute location
  #
  # @param value the value to set the attribute location to.
  #
  # source://letter_opener//lib/letter_opener/configuration.rb#3
  def location=(_arg0); end

  # Returns the value of attribute message_template.
  #
  # source://letter_opener//lib/letter_opener/configuration.rb#3
  def message_template; end

  # Sets the attribute message_template
  #
  # @param value the value to set the attribute message_template to.
  #
  # source://letter_opener//lib/letter_opener/configuration.rb#3
  def message_template=(_arg0); end
end

# source://letter_opener//lib/letter_opener/delivery_method.rb#5
class LetterOpener::DeliveryMethod
  # @raise [InvalidOption]
  # @return [DeliveryMethod] a new instance of DeliveryMethod
  #
  # source://letter_opener//lib/letter_opener/delivery_method.rb#10
  def initialize(options = T.unsafe(nil)); end

  # source://letter_opener//lib/letter_opener/delivery_method.rb#20
  def deliver!(mail); end

  # Returns the value of attribute settings.
  #
  # source://letter_opener//lib/letter_opener/delivery_method.rb#8
  def settings; end

  # Sets the attribute settings
  #
  # @param value the value to set the attribute settings to.
  #
  # source://letter_opener//lib/letter_opener/delivery_method.rb#8
  def settings=(_arg0); end

  private

  # source://letter_opener//lib/letter_opener/delivery_method.rb#30
  def validate_mail!(mail); end
end

# source://letter_opener//lib/letter_opener/delivery_method.rb#6
class LetterOpener::DeliveryMethod::InvalidOption < ::StandardError; end

# source://letter_opener//lib/letter_opener/message.rb#7
class LetterOpener::Message
  # @raise [ArgumentError]
  # @return [Message] a new instance of Message
  #
  # source://letter_opener//lib/letter_opener/message.rb#21
  def initialize(mail, options = T.unsafe(nil)); end

  # source://letter_opener//lib/letter_opener/message.rb#134
  def <=>(other); end

  # source://letter_opener//lib/letter_opener/message.rb#127
  def attachment_filename(attachment); end

  # source://letter_opener//lib/letter_opener/message.rb#117
  def auto_link(text); end

  # source://letter_opener//lib/letter_opener/message.rb#101
  def bcc; end

  # source://letter_opener//lib/letter_opener/message.rb#69
  def body; end

  # source://letter_opener//lib/letter_opener/message.rb#97
  def cc; end

  # source://letter_opener//lib/letter_opener/message.rb#65
  def content_type; end

  # source://letter_opener//lib/letter_opener/message.rb#113
  def encoding; end

  # source://letter_opener//lib/letter_opener/message.rb#61
  def filepath; end

  # source://letter_opener//lib/letter_opener/message.rb#81
  def from; end

  # source://letter_opener//lib/letter_opener/message.rb#123
  def h(content); end

  # Returns the value of attribute mail.
  #
  # source://letter_opener//lib/letter_opener/message.rb#8
  def mail; end

  # source://letter_opener//lib/letter_opener/message.rb#32
  def render; end

  # source://letter_opener//lib/letter_opener/message.rb#105
  def reply_to; end

  # source://letter_opener//lib/letter_opener/message.rb#85
  def sender; end

  # source://letter_opener//lib/letter_opener/message.rb#89
  def subject; end

  # source://letter_opener//lib/letter_opener/message.rb#57
  def template; end

  # source://letter_opener//lib/letter_opener/message.rb#93
  def to; end

  # source://letter_opener//lib/letter_opener/message.rb#109
  def type; end

  class << self
    # source://letter_opener//lib/letter_opener/message.rb#10
    def rendered_messages(mail, options = T.unsafe(nil)); end
  end
end

# source://letter_opener//lib/letter_opener/message.rb#19
LetterOpener::Message::ERROR_MSG = T.let(T.unsafe(nil), String)

# source://letter_opener//lib/letter_opener/railtie.rb#2
class LetterOpener::Railtie < ::Rails::Railtie; end