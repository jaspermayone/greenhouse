# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rails-pg-extras` gem.
# Please instead update this file by running `bin/tapioca gem rails-pg-extras`.


# source://rails-pg-extras//lib/rails_pg_extras/diagnose_data.rb#3
module RailsPgExtras
  class << self
    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def add_extensions(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def all_locks(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def bloat(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def blocking(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def buffercache_stats(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def buffercache_usage(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def cache_hit(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def calls(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#22
    def configuration; end

    # @yield [configuration]
    #
    # source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#26
    def configure; end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#151
    def connection; end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def connections(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def db_settings(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#55
    def diagnose(in_format: T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def duplicate_indexes(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def extensions(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def index_cache_hit(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#123
    def index_info(args: T.unsafe(nil), in_format: T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def index_scans(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def index_size(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def index_usage(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def indexes(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def kill_all(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def kill_pid(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def locks(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def long_running_queries(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def mandelbrot(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#67
    def measure_duration(&block); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#74
    def measure_queries(&block); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def null_indexes(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def outliers(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def pg_stat_statements_reset(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def records_rank(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#27
    def run_query(query_name:, in_format:, args: T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def seq_scans(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def ssl_used(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def table_cache_hit(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def table_index_scans(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def table_indexes_size(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#137
    def table_info(args: T.unsafe(nil), in_format: T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def table_size(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def tables(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def total_index_size(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def total_table_size(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def unused_indexes(options = T.unsafe(nil)); end

    # source://rails-pg-extras//lib/rails-pg-extras.rb#18
    def vacuum_stats(options = T.unsafe(nil)); end
  end
end

# source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#6
class RailsPgExtras::Configuration
  # @return [Configuration] a new instance of Configuration
  #
  # source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#12
  def initialize(attrs); end

  # Returns the value of attribute enabled_web_actions.
  #
  # source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#9
  def enabled_web_actions; end

  # source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#17
  def enabled_web_actions=(*actions); end

  # Returns the value of attribute public_dashboard.
  #
  # source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#10
  def public_dashboard; end

  # Sets the attribute public_dashboard
  #
  # @param value the value to set the attribute public_dashboard to.
  #
  # source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#10
  def public_dashboard=(_arg0); end
end

# source://rails-pg-extras//lib/rails_pg_extras/configuration.rb#7
RailsPgExtras::Configuration::DEFAULT_CONFIG = T.let(T.unsafe(nil), Hash)

# source://rails-pg-extras//lib/rails-pg-extras.rb#14
RailsPgExtras::DEFAULT_ARGS = T.let(T.unsafe(nil), Hash)

# source://rails-pg-extras//lib/rails_pg_extras/diagnose_data.rb#4
class RailsPgExtras::DiagnoseData < ::RubyPgExtras::DiagnoseData
  private

  # source://rails-pg-extras//lib/rails_pg_extras/diagnose_data.rb#8
  def query_module; end
end

# source://rails-pg-extras//lib/rails_pg_extras/diagnose_print.rb#4
class RailsPgExtras::DiagnosePrint < ::RubyPgExtras::DiagnosePrint
  private

  # source://rails-pg-extras//lib/rails_pg_extras/diagnose_print.rb#8
  def title; end
end

# source://rails-pg-extras//lib/rails_pg_extras/index_info.rb#4
class RailsPgExtras::IndexInfo < ::RubyPgExtras::IndexInfo
  private

  # source://rails-pg-extras//lib/rails_pg_extras/index_info.rb#7
  def query_module; end
end

# source://rails-pg-extras//lib/rails_pg_extras/index_info_print.rb#4
class RailsPgExtras::IndexInfoPrint < ::RubyPgExtras::IndexInfoPrint; end

# source://rails-pg-extras//lib/rails-pg-extras.rb#15
RailsPgExtras::NEW_PG_STAT_STATEMENTS = T.let(T.unsafe(nil), String)

# source://rails-pg-extras//lib/rails-pg-extras.rb#13
RailsPgExtras::QUERIES = T.let(T.unsafe(nil), Array)

# source://rails-pg-extras//lib/rails_pg_extras/railtie.rb#3
class RailsPgExtras::Railtie < ::Rails::Railtie; end

# source://rails-pg-extras//lib/rails_pg_extras/table_info.rb#4
class RailsPgExtras::TableInfo < ::RubyPgExtras::TableInfo
  private

  # source://rails-pg-extras//lib/rails_pg_extras/table_info.rb#7
  def query_module; end
end

# source://rails-pg-extras//lib/rails_pg_extras/table_info_print.rb#4
class RailsPgExtras::TableInfoPrint < ::RubyPgExtras::TableInfoPrint; end

# source://rails-pg-extras//lib/rails_pg_extras/version.rb#4
RailsPgExtras::VERSION = T.let(T.unsafe(nil), String)

# source://rails-pg-extras//lib/rails_pg_extras/web/engine.rb#3
module RailsPgExtras::Web
  class << self
    # @return [Boolean]
    #
    # source://rails-pg-extras//lib/rails_pg_extras/web.rb#7
    def action_enabled?(action_name); end

    # source://railties/7.1.3.4/lib/rails/engine.rb#412
    def railtie_helpers_paths; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#395
    def railtie_namespace; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#416
    def railtie_routes_url_helpers(include_path_helpers = T.unsafe(nil)); end

    # source://railties/7.1.3.4/lib/rails/engine.rb#401
    def table_name_prefix; end

    # source://railties/7.1.3.4/lib/rails/engine.rb#408
    def use_relative_model_naming?; end
  end
end

# source://rails-pg-extras//lib/rails_pg_extras/web.rb#5
RailsPgExtras::Web::ACTIONS = T.let(T.unsafe(nil), Array)

class RailsPgExtras::Web::ActionsController < ::RailsPgExtras::Web::ApplicationController
  def add_extensions; end
  def kill_all; end
  def pg_stat_statements_reset; end

  private

  # source://actionview/7.1.3.4/lib/action_view/layouts.rb#330
  def _layout(lookup_context, formats); end

  def run(action); end
  def validate_action!; end

  class << self
    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks; end

    # source://actionpack/7.1.3.4/lib/action_controller/metal.rb#262
    def middleware_stack; end
  end
end

class RailsPgExtras::Web::ApplicationController < ::ActionController::Base
  def validate_credentials!; end

  private

  # source://actionview/7.1.3.4/lib/action_view/layouts.rb#330
  def _layout(lookup_context, formats); end

  def _layout_from_proc; end

  class << self
    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks; end

    # source://actionview/7.1.3.4/lib/action_view/layouts.rb#211
    def _layout; end

    # source://actionview/7.1.3.4/lib/action_view/layouts.rb#212
    def _layout_conditions; end

    # source://actionpack/7.1.3.4/lib/action_controller/metal.rb#262
    def middleware_stack; end
  end
end

RailsPgExtras::Web::ApplicationController::ACTIONS = T.let(T.unsafe(nil), Array)
RailsPgExtras::Web::ApplicationController::REQUIRED_EXTENSIONS = T.let(T.unsafe(nil), Hash)

# source://rails-pg-extras//lib/rails_pg_extras/web/engine.rb#4
class RailsPgExtras::Web::Engine < ::Rails::Engine
  class << self
    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks; end
  end
end

class RailsPgExtras::Web::QueriesController < ::RailsPgExtras::Web::ApplicationController
  def index; end

  private

  # source://actionview/7.1.3.4/lib/action_view/layouts.rb#330
  def _layout(lookup_context, formats); end

  def load_queries; end
  def query_disabled?(query_name); end
  def unavailable_extensions; end

  class << self
    # source://activesupport/7.1.3.4/lib/active_support/callbacks.rb#70
    def __callbacks; end

    # source://actionpack/7.1.3.4/lib/abstract_controller/helpers.rb#12
    def _helper_methods; end

    # source://actionpack/7.1.3.4/lib/action_controller/metal.rb#262
    def middleware_stack; end
  end
end

module RailsPgExtras::Web::QueriesController::HelperMethods
  include ::ActionText::ContentHelper
  include ::ActionText::TagHelper
  include ::Importmap::ImportmapTagsHelper
  include ::Turbo::DriveHelper
  include ::Turbo::FramesHelper
  include ::Turbo::IncludesHelper
  include ::Turbo::StreamsHelper
  include ::ActionView::Helpers::CaptureHelper
  include ::ActionView::Helpers::OutputSafetyHelper
  include ::ActionView::Helpers::TagHelper
  include ::Turbo::Streams::ActionHelper
  include ::Debugbar::TagHelpers
  include ::ActionController::Base::HelperMethods

  def unavailable_extensions(*args, **_arg1, &block); end
end
