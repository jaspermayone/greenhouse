# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `attractor` gem.
# Please instead update this file by running `bin/tapioca gem attractor`.


# source://attractor//lib/attractor/version.rb#1
module Attractor
  private

  # source://attractor//lib/attractor.rb#45
  def all_registered_calculators(options = T.unsafe(nil)); end

  # source://attractor//lib/attractor.rb#37
  def calculators_for_type(type, **options); end

  # source://attractor//lib/attractor.rb#29
  def clear; end

  # source://attractor//lib/attractor.rb#24
  def init(calculators); end

  # source://attractor//lib/attractor.rb#33
  def register(registry_entry); end

  class << self
    # source://attractor//lib/attractor.rb#45
    def all_registered_calculators(options = T.unsafe(nil)); end

    # source://attractor//lib/attractor.rb#37
    def calculators_for_type(type, **options); end

    # source://attractor//lib/attractor.rb#29
    def clear; end

    # source://attractor//lib/attractor.rb#24
    def init(calculators); end

    # source://attractor//lib/attractor.rb#33
    def register(registry_entry); end
  end
end

# skeleton sinatra app
#
# source://attractor//lib/attractor/reporters/sinatra_reporter.rb#9
class Attractor::AttractorApp < ::Sinatra::Base
  # @return [AttractorApp] a new instance of AttractorApp
  #
  # source://attractor//lib/attractor/reporters/sinatra_reporter.rb#10
  def initialize(reporter); end

  class << self
    # source://sinatra/4.0.0/lib/sinatra/base.rb#1362
    def app_file; end

    # source://sinatra/4.0.0/lib/sinatra/base.rb#1361
    def app_file=(val); end

    def app_file?; end

    # source://sinatra/4.0.0/lib/sinatra/base.rb#1362
    def public_folder; end

    # source://sinatra/4.0.0/lib/sinatra/base.rb#1361
    def public_folder=(val); end

    def public_folder?; end
    def show_exceptions; end

    # source://sinatra/4.0.0/lib/sinatra/base.rb#1361
    def show_exceptions=(val); end

    def show_exceptions?; end
    def static; end

    # source://sinatra/4.0.0/lib/sinatra/base.rb#1361
    def static=(val); end

    def static?; end
  end
end

# calculates churn and complexity
#
# source://attractor//lib/attractor/calculators/base_calculator.rb#9
class Attractor::BaseCalculator
  # @return [BaseCalculator] a new instance of BaseCalculator
  #
  # source://attractor//lib/attractor/calculators/base_calculator.rb#12
  def initialize(file_prefix: T.unsafe(nil), ignores: T.unsafe(nil), file_extension: T.unsafe(nil), minimum_churn_count: T.unsafe(nil), start_ago: T.unsafe(nil), verbose: T.unsafe(nil)); end

  # source://attractor//lib/attractor/calculators/base_calculator.rb#21
  def calculate; end

  # Returns the value of attribute type.
  #
  # source://attractor//lib/attractor/calculators/base_calculator.rb#10
  def type; end

  private

  # source://attractor//lib/attractor/calculators/base_calculator.rb#64
  def git_history_for_file(file_path:, limit: T.unsafe(nil)); end
end

# source://attractor//lib/attractor/detectors/base_detector.rb#2
class Attractor::BaseDetector
  # @raise [NotImplementedError]
  #
  # source://attractor//lib/attractor/detectors/base_detector.rb#3
  def detect; end
end

# base reporter
#
# source://attractor//lib/attractor/reporters/base_reporter.rb#11
class Attractor::BaseReporter
  extend ::Forwardable

  # @return [BaseReporter] a new instance of BaseReporter
  #
  # source://attractor//lib/attractor/reporters/base_reporter.rb#18
  def initialize(calculators:, file_prefix: T.unsafe(nil), ignores: T.unsafe(nil), open_browser: T.unsafe(nil)); end

  # Returns the value of attribute file_prefix.
  #
  # source://attractor//lib/attractor/reporters/base_reporter.rb#13
  def file_prefix; end

  # Sets the attribute file_prefix
  #
  # @param value the value to set the attribute file_prefix to.
  #
  # source://attractor//lib/attractor/reporters/base_reporter.rb#13
  def file_prefix=(_arg0); end

  # source://attractor//lib/attractor/reporters/base_reporter.rb#42
  def render; end

  # source://attractor//lib/attractor/reporters/base_reporter.rb#37
  def report; end

  # source://attractor//lib/attractor/reporters/base_reporter.rb#31
  def suggestions(quantile:, type: T.unsafe(nil)); end

  # Returns the value of attribute types.
  #
  # source://attractor//lib/attractor/reporters/base_reporter.rb#14
  def types; end

  # source://attractor//lib/attractor/reporters/base_reporter.rb#46
  def values(type: T.unsafe(nil)); end

  # Sets the attribute values
  #
  # @param value the value to set the attribute values to.
  #
  # source://attractor//lib/attractor/reporters/base_reporter.rb#15
  def values=(_arg0); end

  # source://forwardable/1.3.3/forwardable.rb#231
  def watch(*args, **_arg1, &block); end
end

# source://attractor//lib/attractor/cache.rb#7
class Attractor::Cache
  class << self
    # source://attractor//lib/attractor/cache.rb#21
    def clear; end

    # source://attractor//lib/attractor/cache.rb#17
    def persist!; end

    # source://attractor//lib/attractor/cache.rb#9
    def read(file_path:); end

    # source://attractor//lib/attractor/cache.rb#13
    def write(file_path:, value:); end

    private

    # source://attractor//lib/attractor/cache.rb#27
    def adapter; end
  end
end

# source://attractor//lib/attractor/cache.rb#33
module Attractor::CacheAdapter; end

# source://attractor//lib/attractor/cache.rb#34
class Attractor::CacheAdapter::Base
  include ::Singleton
  extend ::Singleton::SingletonClassMethods

  class << self
    private

    def allocate; end
    def new(*_arg0); end
  end
end

# source://attractor//lib/attractor/cache.rb#38
class Attractor::CacheAdapter::JSON < ::Attractor::CacheAdapter::Base
  # @return [JSON] a new instance of JSON
  #
  # source://attractor//lib/attractor/cache.rb#39
  def initialize; end

  # source://attractor//lib/attractor/cache.rb#73
  def clear; end

  # source://attractor//lib/attractor/cache.rb#77
  def filename; end

  # source://attractor//lib/attractor/cache.rb#69
  def persist!; end

  # source://attractor//lib/attractor/cache.rb#53
  def read(file_path:); end

  # source://attractor//lib/attractor/cache.rb#62
  def write(file_path:, value:); end
end

# console reporter
#
# source://attractor//lib/attractor/reporters/console_reporter.rb#5
class Attractor::ConsoleReporter < ::Attractor::BaseReporter
  # @return [ConsoleReporter] a new instance of ConsoleReporter
  #
  # source://attractor//lib/attractor/reporters/console_reporter.rb#79
  def initialize(format:, **other); end

  # source://attractor//lib/attractor/reporters/console_reporter.rb#91
  def report; end
end

# source://attractor//lib/attractor/reporters/console_reporter.rb#29
class Attractor::ConsoleReporter::CSVFormatter
  # source://attractor//lib/attractor/reporters/console_reporter.rb#30
  def call(calculators); end
end

# source://attractor//lib/attractor/reporters/console_reporter.rb#52
class Attractor::ConsoleReporter::JSONFormatter
  # source://attractor//lib/attractor/reporters/console_reporter.rb#53
  def call(calculators); end
end

# source://attractor//lib/attractor/reporters/console_reporter.rb#6
class Attractor::ConsoleReporter::TableFormatter
  # source://attractor//lib/attractor/reporters/console_reporter.rb#7
  def call(calculators); end
end

# converts a duration string into an amount of days
#
# source://attractor//lib/attractor/duration_parser.rb#5
class Attractor::DurationParser
  # @return [DurationParser] a new instance of DurationParser
  #
  # source://attractor//lib/attractor/duration_parser.rb#15
  def initialize(input); end

  # Returns the value of attribute duration.
  #
  # source://attractor//lib/attractor/duration_parser.rb#13
  def duration; end

  # source://attractor//lib/attractor/duration_parser.rb#23
  def parse; end
end

# source://attractor//lib/attractor/duration_parser.rb#6
Attractor::DurationParser::TOKENS = T.let(T.unsafe(nil), Hash)

# source://attractor//lib/attractor.rb#20
class Attractor::Error < ::StandardError; end

# from https://github.com/prontolabs/pronto/blob/master/lib/pronto/gem_names.rb
#
# source://attractor//lib/attractor/gem_names.rb#3
class Attractor::GemNames
  # source://attractor//lib/attractor/gem_names.rb#4
  def to_a; end

  private

  # source://attractor//lib/attractor/gem_names.rb#10
  def gems; end
end

# HTML reporter
#
# source://attractor//lib/attractor/reporters/html_reporter.rb#5
class Attractor::HtmlReporter < ::Attractor::BaseReporter
  # source://attractor//lib/attractor/reporters/html_reporter.rb#57
  def css; end

  # source://attractor//lib/attractor/reporters/html_reporter.rb#53
  def favicon; end

  # source://attractor//lib/attractor/reporters/html_reporter.rb#65
  def javascript; end

  # source://attractor//lib/attractor/reporters/html_reporter.rb#61
  def javascript_pack; end

  # source://attractor//lib/attractor/reporters/html_reporter.rb#49
  def logo; end

  # source://attractor//lib/attractor/reporters/html_reporter.rb#70
  def render; end

  # source://attractor//lib/attractor/reporters/html_reporter.rb#6
  def report; end
end

# serving the HTML locally
#
# source://attractor//lib/attractor/reporters/sinatra_reporter.rb#45
class Attractor::SinatraReporter < ::Attractor::BaseReporter
  # source://attractor//lib/attractor/reporters/sinatra_reporter.rb#46
  def report; end

  # source://attractor//lib/attractor/reporters/sinatra_reporter.rb#61
  def watch; end
end

# makes suggestions for refactorings
#
# source://attractor//lib/attractor/suggester.rb#5
class Attractor::Suggester
  # @return [Suggester] a new instance of Suggester
  #
  # source://attractor//lib/attractor/suggester.rb#8
  def initialize(values = T.unsafe(nil)); end

  # source://attractor//lib/attractor/suggester.rb#12
  def suggest(threshold = T.unsafe(nil)); end

  # Returns the value of attribute values.
  #
  # source://attractor//lib/attractor/suggester.rb#6
  def values; end

  # Sets the attribute values
  #
  # @param value the value to set the attribute values to.
  #
  # source://attractor//lib/attractor/suggester.rb#6
  def values=(_arg0); end
end

# source://attractor//lib/attractor/version.rb#2
Attractor::VERSION = T.let(T.unsafe(nil), String)

# holds a churn/complexity value
#
# source://attractor//lib/attractor/value.rb#7
class Attractor::Value
  # @return [Value] a new instance of Value
  #
  # source://attractor//lib/attractor/value.rb#10
  def initialize(file_path: T.unsafe(nil), churn: T.unsafe(nil), complexity: T.unsafe(nil), details: T.unsafe(nil), history: T.unsafe(nil)); end

  # Returns the value of attribute churn.
  #
  # source://attractor//lib/attractor/value.rb#8
  def churn; end

  # Returns the value of attribute complexity.
  #
  # source://attractor//lib/attractor/value.rb#8
  def complexity; end

  # source://attractor//lib/attractor/value.rb#18
  def current_commit; end

  # Returns the value of attribute details.
  #
  # source://attractor//lib/attractor/value.rb#8
  def details; end

  # Returns the value of attribute file_path.
  #
  # source://attractor//lib/attractor/value.rb#8
  def file_path; end

  # Returns the value of attribute history.
  #
  # source://attractor//lib/attractor/value.rb#8
  def history; end

  # source://attractor//lib/attractor/value.rb#22
  def score; end

  # source://attractor//lib/attractor/value.rb#30
  def to_h; end

  # source://attractor//lib/attractor/value.rb#34
  def to_json(_opt); end

  # source://attractor//lib/attractor/value.rb#26
  def to_s; end
end

# functionality for watching file system changes
#
# source://attractor//lib/attractor/watcher.rb#7
class Attractor::Watcher
  # @return [Watcher] a new instance of Watcher
  #
  # source://attractor//lib/attractor/watcher.rb#8
  def initialize(file_prefix, ignores, callback); end

  # source://attractor//lib/attractor/watcher.rb#14
  def watch; end
end
