# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `invisible_captcha` gem.
# Please instead update this file by running `bin/tapioca gem invisible_captcha`.


# source://invisible_captcha//lib/invisible_captcha/version.rb#3
module InvisibleCaptcha
  class << self
    # source://invisible_captcha//lib/invisible_captcha.rb#73
    def css_strategy; end

    # source://invisible_captcha//lib/invisible_captcha.rb#81
    def encode(value); end

    # source://invisible_captcha//lib/invisible_captcha.rb#65
    def generate_random_honeypot; end

    # source://invisible_captcha//lib/invisible_captcha.rb#69
    def get_honeypot; end

    # Returns the value of attribute honeypots.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#61
    def honeypots; end

    # Sets the attribute honeypots
    #
    # @param value the value to set the attribute honeypots to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def honeypots=(_arg0); end

    # source://invisible_captcha//lib/invisible_captcha.rb#22
    def init!; end

    # Returns the value of attribute injectable_styles.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def injectable_styles; end

    # Sets the attribute injectable_styles
    #
    # @param value the value to set the attribute injectable_styles to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def injectable_styles=(_arg0); end

    # Returns the value of attribute secret.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def secret; end

    # Sets the attribute secret
    #
    # @param value the value to set the attribute secret to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def secret=(_arg0); end

    # source://invisible_captcha//lib/invisible_captcha.rb#49
    def sentence_for_humans; end

    # Sets the attribute sentence_for_humans
    #
    # @param value the value to set the attribute sentence_for_humans to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#11
    def sentence_for_humans=(_arg0); end

    # @yield [_self]
    # @yieldparam _self [InvisibleCaptcha] the object that the method was called on
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#57
    def setup; end

    # Returns the value of attribute spinner_enabled.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def spinner_enabled; end

    # Sets the attribute spinner_enabled
    #
    # @param value the value to set the attribute spinner_enabled to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def spinner_enabled=(_arg0); end

    # Returns the value of attribute timestamp_enabled.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def timestamp_enabled; end

    # Sets the attribute timestamp_enabled
    #
    # @param value the value to set the attribute timestamp_enabled to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def timestamp_enabled=(_arg0); end

    # source://invisible_captcha//lib/invisible_captcha.rb#53
    def timestamp_error_message; end

    # Sets the attribute timestamp_error_message
    #
    # @param value the value to set the attribute timestamp_error_message to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#11
    def timestamp_error_message=(_arg0); end

    # Returns the value of attribute timestamp_threshold.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def timestamp_threshold; end

    # Sets the attribute timestamp_threshold
    #
    # @param value the value to set the attribute timestamp_threshold to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def timestamp_threshold=(_arg0); end

    # Returns the value of attribute visual_honeypots.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def visual_honeypots; end

    # Sets the attribute visual_honeypots
    #
    # @param value the value to set the attribute visual_honeypots to.
    #
    # source://invisible_captcha//lib/invisible_captcha.rb#14
    def visual_honeypots=(_arg0); end

    private

    # source://invisible_captcha//lib/invisible_captcha.rb#87
    def call_lambda_or_return(obj); end
  end
end

# source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#4
module InvisibleCaptcha::ControllerExt
  private

  # source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#21
  def detect_spam(options = T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#87
  def honeypot_spam?(options = T.unsafe(nil)); end

  # source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#41
  def on_spam(options = T.unsafe(nil)); end

  # source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#32
  def on_timestamp_spam(options = T.unsafe(nil)); end

  # @return [Boolean]
  #
  # source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#78
  def spinner_spam?; end

  # @return [Boolean]
  #
  # source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#49
  def timestamp_spam?(options = T.unsafe(nil)); end

  # source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#115
  def warn_spam(message); end
end

# source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#5
module InvisibleCaptcha::ControllerExt::ClassMethods
  # source://invisible_captcha//lib/invisible_captcha/controller_ext.rb#6
  def invisible_captcha(options = T.unsafe(nil)); end
end

# source://invisible_captcha//lib/invisible_captcha/form_helpers.rb#4
module InvisibleCaptcha::FormHelpers
  # source://invisible_captcha//lib/invisible_captcha/form_helpers.rb#5
  def invisible_captcha(honeypot = T.unsafe(nil), options = T.unsafe(nil)); end
end

# source://invisible_captcha//lib/invisible_captcha/railtie.rb#4
class InvisibleCaptcha::Railtie < ::Rails::Railtie; end

# source://invisible_captcha//lib/invisible_captcha/version.rb#4
InvisibleCaptcha::VERSION = T.let(T.unsafe(nil), String)

# source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#4
module InvisibleCaptcha::ViewHelpers
  # Builds the honeypot html
  #
  # @param honeypot [Symbol] name of honeypot, ie: subtitle => input name: subtitle
  # @param scope [Symbol] name of honeypot scope, ie: topic => input name: topic[subtitle]
  # @param options [Hash] html_options for input and invisible_captcha options
  # @return [String] the generated html
  #
  # source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#12
  def invisible_captcha(honeypot = T.unsafe(nil), scope = T.unsafe(nil), options = T.unsafe(nil)); end

  # source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#27
  def invisible_captcha_styles; end

  private

  # source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#89
  def build_input_name(honeypot, scope = T.unsafe(nil)); end

  # source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#39
  def build_invisible_captcha(honeypot = T.unsafe(nil), scope = T.unsafe(nil), options = T.unsafe(nil)); end

  # source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#81
  def build_label_name(honeypot, scope = T.unsafe(nil)); end

  # source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#35
  def current_request; end

  # source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#97
  def default_honeypot_options; end

  # source://invisible_captcha//lib/invisible_captcha/view_helpers.rb#65
  def visibility_css(css_class, options); end
end
