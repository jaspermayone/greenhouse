# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `anyway_config` gem.
# Please instead update this file by running `bin/tapioca gem anyway_config`.


# source://anyway_config//lib/anyway/version.rb#3
module Anyway
  class << self
    # source://anyway_config//lib/anyway_config.rb#29
    def env; end

    # source://anyway_config//lib/anyway_config.rb#33
    def loaders; end
  end
end

module Anyway::AutoCast
  class << self
    def call(val); end
    def cast_hash(obj); end
    def coerce(_key, val); end
  end
end

# Regexp to detect array values
# Array value is a values that contains at least one comma
# and doesn't start/end with quote or curly braces
Anyway::AutoCast::ARRAY_RXP = T.let(T.unsafe(nil), Regexp)

# Base config class
# Provides `attr_config` method to describe
# configuration parameters and set defaults
class Anyway::Config
  include ::Anyway::Rails::Config
  include ::Anyway::OptparseConfig
  include ::Anyway::DynamicConfig
  extend ::Anyway::OptparseConfig::ClassMethods
  extend ::Anyway::DynamicConfig::ClassMethods
  extend ::Anyway::RBSGenerator
  extend ::Anyway::Rails::Config::ClassMethods

  # Instantiate config instance.
  #
  # Example:
  #
  #   my_config = Anyway::Config.new()
  #
  #   # provide some values explicitly
  #   my_config = Anyway::Config.new({some: :value})
  #
  # @raise [ArgumentError]
  # @return [Config] a new instance of Config
  def initialize(overrides = T.unsafe(nil)); end

  def as_env; end
  def clear; end

  # Returns the value of attribute config_name.
  def config_name; end

  def deconstruct_keys(keys); end
  def dig(*_arg0); end
  def dup; end

  # Returns the value of attribute env_prefix.
  def env_prefix; end

  def inspect; end
  def load(overrides = T.unsafe(nil)); end
  def load_from_sources(base_config, **opts); end
  def pretty_print(q); end
  def reload(overrides = T.unsafe(nil)); end
  def resolve_config_path(name, env_prefix); end
  def to_h; end
  def to_source_trace; end

  private

  # Returns the value of attribute __trace__.
  def __trace__; end

  def __type_caster__; end

  # @raise [ValidationError]
  def raise_validation_error(msg); end

  def validate_required_attributes!; end

  # Returns the value of attribute values.
  def values; end

  def write_config_attr(key, val); end

  class << self
    def attr_config(*args, **hargs); end
    def coerce_types(mapping); end
    def coercion_mapping; end
    def config_attributes; end
    def config_name(val = T.unsafe(nil)); end
    def defaults; end
    def disable_auto_cast!; end
    def env_prefix(val = T.unsafe(nil)); end
    def explicit_config_name; end

    # @return [Boolean]
    def explicit_config_name?; end

    def fallback_type_caster(val = T.unsafe(nil)); end
    def load_callbacks; end
    def loader_options(val = T.unsafe(nil)); end

    # source://anyway_config//lib/anyway/rails/config.rb#14
    def new_empty_config; end

    # @raise [ArgumentError]
    def on_load(*names, &block); end

    # @raise [ArgumentError]
    def required(*names, env: T.unsafe(nil), **nested); end

    def required_attributes; end
    def type_caster(val = T.unsafe(nil)); end

    private

    def accessors_module; end
    def build_config_name; end
    def define_config_accessor(*names); end

    # @raise [ArgumentError]
    def validate_param_names!(names); end
  end
end

class Anyway::Config::BlockCallback
  # @return [BlockCallback] a new instance of BlockCallback
  def initialize(block); end

  def apply_to(config); end

  # Returns the value of attribute block.
  def block; end
end

class Anyway::Config::Error < ::StandardError; end

class Anyway::Config::NamedCallback
  # @return [NamedCallback] a new instance of NamedCallback
  def initialize(name); end

  def apply_to(config); end

  # Returns the value of attribute name.
  def name; end
end

Anyway::Config::PARAM_NAME = T.let(T.unsafe(nil), Regexp)

# List of names that couldn't be used as config names
# (the class instance methods we use)
Anyway::Config::RESERVED_NAMES = T.let(T.unsafe(nil), Array)

class Anyway::Config::ValidationError < ::Anyway::Config::Error; end

# source://anyway_config//lib/anyway/railtie.rb#4
Anyway::DEFAULT_CONFIGS_PATH = T.let(T.unsafe(nil), String)

# Adds ability to generate anonymous (class-less) config dynamicly
# (like Rails.application.config_for but using more data sources).
#
# source://anyway_config//lib/anyway/dynamic_config.rb#6
module Anyway::DynamicConfig
  mixes_in_class_methods ::Anyway::DynamicConfig::ClassMethods

  class << self
    # @private
    #
    # source://anyway_config//lib/anyway/dynamic_config.rb#27
    def included(base); end
  end
end

# source://anyway_config//lib/anyway/dynamic_config.rb#7
module Anyway::DynamicConfig::ClassMethods
  # Load config as Hash by any name
  #
  # Example:
  #
  #   my_config = Anyway::Config.for(:my_app)
  #   # will load data from config/my_app.yml, secrets.my_app, ENV["MY_APP_*"]
  #
  # source://anyway_config//lib/anyway/dynamic_config.rb#15
  def for(name, auto_cast: T.unsafe(nil), **options); end
end

# source://anyway_config//lib/anyway/ejson_parser.rb#9
class Anyway::EJSONParser
  # @return [EJSONParser] a new instance of EJSONParser
  #
  # source://anyway_config//lib/anyway/ejson_parser.rb#12
  def initialize(bin_path = T.unsafe(nil)); end

  # Returns the value of attribute bin_path.
  #
  # source://anyway_config//lib/anyway/ejson_parser.rb#10
  def bin_path; end

  # source://anyway_config//lib/anyway/ejson_parser.rb#16
  def call(file_path); end
end

# Parses environment variables and provides
# method-like access
#
# source://anyway_config//lib/anyway/env.rb#6
class Anyway::Env
  include ::Anyway::Tracing

  # @return [Env] a new instance of Env
  #
  # source://anyway_config//lib/anyway/env.rb#31
  def initialize(type_cast: T.unsafe(nil), env_container: T.unsafe(nil)); end

  # source://anyway_config//lib/anyway/env.rb#38
  def clear; end

  # Returns the value of attribute data.
  #
  # source://anyway_config//lib/anyway/env.rb#29
  def data; end

  # Returns the value of attribute env_container.
  #
  # source://anyway_config//lib/anyway/env.rb#29
  def env_container; end

  # source://anyway_config//lib/anyway/env.rb#43
  def fetch(prefix); end

  # source://anyway_config//lib/anyway/env.rb#55
  def fetch_with_trace(prefix); end

  # Returns the value of attribute traces.
  #
  # source://anyway_config//lib/anyway/env.rb#29
  def traces; end

  # Returns the value of attribute type_cast.
  #
  # source://anyway_config//lib/anyway/env.rb#29
  def type_cast; end

  private

  # source://anyway_config//lib/anyway/env.rb#61
  def parse_env(prefix); end

  class << self
    # source://anyway_config//lib/anyway/env.rb#12
    def from_hash(hash, prefix: T.unsafe(nil), memo: T.unsafe(nil)); end
  end
end

# source://anyway_config//lib/anyway/ext/deep_dup.rb#4
module Anyway::Ext; end

# Extend Object through refinements
#
# source://anyway_config//lib/anyway/ext/deep_dup.rb#6
module Anyway::Ext::DeepDup; end

# Add #deep_freeze to hashes and arrays
#
# source://anyway_config//lib/anyway/ext/deep_freeze.rb#6
module Anyway::Ext::DeepFreeze; end

# Convert Hash with mixed array and hash values to an
# array of paths.
#
# source://anyway_config//lib/anyway/ext/flatten_names.rb#7
module Anyway::Ext::FlattenNames; end

# Extend Hash through refinements
#
# source://anyway_config//lib/anyway/ext/hash.rb#6
module Anyway::Ext::Hash; end

# source://anyway_config//lib/anyway/loaders.rb#6
module Anyway::Loaders; end

# source://anyway_config//lib/anyway/loaders/base.rb#5
class Anyway::Loaders::Base
  include ::Anyway::Tracing

  # @return [Base] a new instance of Base
  #
  # source://anyway_config//lib/anyway/loaders/base.rb#14
  def initialize(local:); end

  # @return [Boolean]
  #
  # source://anyway_config//lib/anyway/loaders/base.rb#18
  def use_local?; end

  class << self
    # source://anyway_config//lib/anyway/loaders/base.rb#9
    def call(local: T.unsafe(nil), **_arg1); end
  end
end

# source://anyway_config//lib/anyway/loaders/doppler.rb#11
class Anyway::Loaders::Doppler < ::Anyway::Loaders::Base
  # source://anyway_config//lib/anyway/loaders/doppler.rb#25
  def call(env_prefix:, **_options); end

  private

  # source://anyway_config//lib/anyway/loaders/doppler.rb#48
  def fetch_doppler_config(url, token); end

  # source://anyway_config//lib/anyway/loaders/doppler.rb#38
  def parse_doppler_response(url:, token:); end

  class << self
    # Returns the value of attribute download_url.
    #
    # source://anyway_config//lib/anyway/loaders/doppler.rb#15
    def download_url; end

    # Sets the attribute download_url
    #
    # @param value the value to set the attribute download_url to.
    #
    # source://anyway_config//lib/anyway/loaders/doppler.rb#15
    def download_url=(_arg0); end

    # source://anyway_config//lib/anyway/loaders/doppler.rb#18
    def token; end

    # Sets the attribute token
    #
    # @param value the value to set the attribute token to.
    #
    # source://anyway_config//lib/anyway/loaders/doppler.rb#16
    def token=(_arg0); end
  end
end

# source://anyway_config//lib/anyway/loaders/doppler.rb#12
class Anyway::Loaders::Doppler::RequestError < ::StandardError; end

# source://anyway_config//lib/anyway/loaders/ejson.rb#7
class Anyway::Loaders::EJSON < ::Anyway::Loaders::Base
  # source://anyway_config//lib/anyway/loaders/ejson.rb#14
  def call(name:, ejson_namespace: T.unsafe(nil), ejson_parser: T.unsafe(nil), **_options); end

  private

  # source://anyway_config//lib/anyway/loaders/ejson.rb#69
  def default_rel_config_path; end

  # source://anyway_config//lib/anyway/loaders/ejson.rb#57
  def environmental_rel_config_path; end

  # source://anyway_config//lib/anyway/loaders/ejson.rb#73
  def extract_hash_from_rel_config_path(ejson_parser:, rel_config_path:); end

  # source://anyway_config//lib/anyway/loaders/ejson.rb#49
  def rel_config_paths; end

  class << self
    # Returns the value of attribute bin_path.
    #
    # source://anyway_config//lib/anyway/loaders/ejson.rb#9
    def bin_path; end

    # Sets the attribute bin_path
    #
    # @param value the value to set the attribute bin_path to.
    #
    # source://anyway_config//lib/anyway/loaders/ejson.rb#9
    def bin_path=(_arg0); end
  end
end

# source://anyway_config//lib/anyway/loaders/env.rb#7
class Anyway::Loaders::Env < ::Anyway::Loaders::Base
  # source://anyway_config//lib/anyway/loaders/env.rb#8
  def call(env_prefix:, **_options); end
end

# source://anyway_config//lib/anyway/loaders.rb#7
class Anyway::Loaders::Registry
  # @return [Registry] a new instance of Registry
  #
  # source://anyway_config//lib/anyway/loaders.rb#10
  def initialize; end

  # source://anyway_config//lib/anyway/loaders.rb#19
  def append(id, handler = T.unsafe(nil), &block); end

  # source://anyway_config//lib/anyway/loaders.rb#47
  def delete(id); end

  # source://anyway_config//lib/anyway/loaders.rb#54
  def each(&block); end

  # source://anyway_config//lib/anyway/loaders.rb#58
  def freeze; end

  # @raise [ArgumentError]
  #
  # source://anyway_config//lib/anyway/loaders.rb#32
  def insert_after(another_id, id, handler = T.unsafe(nil), &block); end

  # @raise [ArgumentError]
  #
  # source://anyway_config//lib/anyway/loaders.rb#24
  def insert_before(another_id, id, handler = T.unsafe(nil), &block); end

  # source://anyway_config//lib/anyway/loaders.rb#40
  def override(id, handler); end

  # source://anyway_config//lib/anyway/loaders.rb#14
  def prepend(id, handler = T.unsafe(nil), &block); end

  # Returns the value of attribute registry.
  #
  # source://anyway_config//lib/anyway/loaders.rb#8
  def registry; end

  private

  # source://anyway_config//lib/anyway/loaders.rb#68
  def find(id); end

  # @raise [ArgumentError]
  #
  # source://anyway_config//lib/anyway/loaders.rb#62
  def insert_at(index, id, handler); end
end

# source://anyway_config//lib/anyway/loaders/yaml.rb#11
class Anyway::Loaders::YAML < ::Anyway::Loaders::Base
  # source://anyway_config//lib/anyway/loaders/yaml.rb#18
  def call(config_path:, **_options); end

  private

  # source://anyway_config//lib/anyway/loaders/yaml.rb#45
  def config_with_env(config); end

  # @return [Boolean]
  #
  # source://anyway_config//lib/anyway/loaders/yaml.rb#34
  def environmental?(parsed_yml); end

  # source://anyway_config//lib/anyway/loaders/yaml.rb#53
  def load_base_yml(path); end

  # source://anyway_config//lib/anyway/loaders/yaml.rb#53
  def load_local_yml(path); end

  # source://anyway_config//lib/anyway/loaders/yaml.rb#78
  def local_config_path(path); end

  # source://anyway_config//lib/anyway/loaders/yaml.rb#53
  def parse_yml(path); end

  # source://anyway_config//lib/anyway/loaders/yaml.rb#82
  def relative_config_path(path); end

  class << self
    # source://anyway_config//lib/anyway/loaders/yaml.rb#15
    def permitted_classes; end
  end
end

module Anyway::NoCast
  class << self
    def call(val); end
    def coerce(_key, val); end
  end
end

# Initializes the OptionParser instance using the given configuration
#
# source://anyway_config//lib/anyway/option_parser_builder.rb#7
class Anyway::OptionParserBuilder
  class << self
    # source://anyway_config//lib/anyway/option_parser_builder.rb#9
    def call(options); end

    private

    # source://anyway_config//lib/anyway/option_parser_builder.rb#21
    def option_parser_on_args(key, flag: T.unsafe(nil), desc: T.unsafe(nil), type: T.unsafe(nil)); end
  end
end

# Adds ability to use script options as the source
# of configuration (via optparse)
#
# source://anyway_config//lib/anyway/optparse_config.rb#12
module Anyway::OptparseConfig
  mixes_in_class_methods ::Anyway::OptparseConfig::ClassMethods

  # source://anyway_config//lib/anyway/optparse_config.rb#72
  def option_parser; end

  # source://anyway_config//lib/anyway/optparse_config.rb#82
  def parse_options!(options); end

  class << self
    # @private
    #
    # source://anyway_config//lib/anyway/optparse_config.rb#88
    def included(base); end
  end
end

# source://anyway_config//lib/anyway/optparse_config.rb#13
module Anyway::OptparseConfig::ClassMethods
  # source://anyway_config//lib/anyway/optparse_config.rb#20
  def describe_options(**hargs); end

  # source://anyway_config//lib/anyway/optparse_config.rb#36
  def extend_options(&block); end

  # source://anyway_config//lib/anyway/optparse_config.rb#30
  def flag_options(*args); end

  # source://anyway_config//lib/anyway/optparse_config.rb#14
  def ignore_options(*args); end

  # source://anyway_config//lib/anyway/optparse_config.rb#60
  def option_parser_descriptors; end

  # source://anyway_config//lib/anyway/optparse_config.rb#49
  def option_parser_extensions; end

  # source://anyway_config//lib/anyway/optparse_config.rb#40
  def option_parser_options; end
end

# source://anyway_config//lib/anyway/rbs.rb#4
module Anyway::RBSGenerator
  # Generate RBS signature from a config class
  #
  # source://anyway_config//lib/anyway/rbs.rb#16
  def to_rbs; end
end

# source://anyway_config//lib/anyway/rbs.rb#5
Anyway::RBSGenerator::TYPE_TO_CLASS = T.let(T.unsafe(nil), Hash)

# source://anyway_config//lib/anyway/rails.rb#4
module Anyway::Rails; end

# Enhance config to be more Railsy-like:
# – accept hashes with indeferent access
# - load data from secrets
# - recognize Rails env when loading from YML
#
# source://anyway_config//lib/anyway/rails/config.rb#11
module Anyway::Rails::Config; end

# source://anyway_config//lib/anyway/rails/config.rb#12
module Anyway::Rails::Config::ClassMethods
  # Make defaults to be a Hash with indifferent access
  #
  # source://anyway_config//lib/anyway/rails/config.rb#14
  def new_empty_config; end
end

# source://anyway_config//lib/anyway/rails/loaders/yaml.rb#5
module Anyway::Rails::Loaders; end

# source://anyway_config//lib/anyway/rails/loaders/credentials.rb#8
class Anyway::Rails::Loaders::Credentials < ::Anyway::Loaders::Base
  # source://anyway_config//lib/anyway/rails/loaders/credentials.rb#11
  def call(name:, **_options); end

  private

  # source://anyway_config//lib/anyway/rails/loaders/credentials.rb#54
  def credentials_path; end

  # source://anyway_config//lib/anyway/rails/loaders/credentials.rb#41
  def local_credentials(name); end
end

# source://anyway_config//lib/anyway/rails/loaders/credentials.rb#9
Anyway::Rails::Loaders::Credentials::LOCAL_CONTENT_PATH = T.let(T.unsafe(nil), String)

# source://anyway_config//lib/anyway/rails/loaders/secrets.rb#8
class Anyway::Rails::Loaders::Secrets < ::Anyway::Loaders::Base
  # source://anyway_config//lib/anyway/rails/loaders/secrets.rb#9
  def call(name:, **_options); end

  private

  # source://anyway_config//lib/anyway/rails/loaders/secrets.rb#26
  def secrets; end
end

# source://anyway_config//lib/anyway/rails/loaders/yaml.rb#6
class Anyway::Rails::Loaders::YAML < ::Anyway::Loaders::YAML; end

# source://anyway_config//lib/anyway/railtie.rb#7
class Anyway::Railtie < ::Rails::Railtie; end

# Use Settings name to not confuse with Config.
#
# Settings contain the library-wide configuration.
#
# source://anyway_config//lib/anyway/settings.rb#9
class Anyway::Settings
  class << self
    # source://anyway_config//lib/anyway/rails/settings.rb#72
    def app_root; end

    # Returns the value of attribute autoload_static_config_path.
    #
    # source://anyway_config//lib/anyway/rails/settings.rb#13
    def autoload_static_config_path; end

    # source://anyway_config//lib/anyway/rails/settings.rb#16
    def autoload_static_config_path=(val); end

    # source://anyway_config//lib/anyway/rails/settings.rb#62
    def autoload_via_zeitwerk; end

    # Sets the attribute autoload_via_zeitwerk
    #
    # @param value the value to set the attribute autoload_via_zeitwerk to.
    #
    # source://anyway_config//lib/anyway/rails/settings.rb#14
    def autoload_via_zeitwerk=(_arg0); end

    # Returns the value of attribute autoloader.
    #
    # source://anyway_config//lib/anyway/rails/settings.rb#13
    def autoloader; end

    # source://anyway_config//lib/anyway/rails/settings.rb#55
    def cleanup_autoload_paths; end

    # Define whether to load data from
    # *.yml.local (or credentials/local.yml.enc)
    #
    # source://anyway_config//lib/anyway/rails/settings.rb#68
    def current_environment; end

    # Define whether to load data from
    # *.yml.local (or credentials/local.yml.enc)
    #
    # source://anyway_config//lib/anyway/settings.rb#50
    def current_environment=(_arg0); end

    # A proc returning a path to YML config file given the config name
    #
    # source://anyway_config//lib/anyway/settings.rb#56
    def default_config_path; end

    # source://anyway_config//lib/anyway/settings.rb#58
    def default_config_path=(val); end

    # Define whether to load data from
    # *.yml.local (or credentials/local.yml.enc)
    #
    # source://anyway_config//lib/anyway/settings.rb#50
    def default_environmental_key; end

    # Define whether to load data from
    # *.yml.local (or credentials/local.yml.enc)
    #
    # source://anyway_config//lib/anyway/settings.rb#50
    def default_environmental_key=(_arg0); end

    # @return [Boolean]
    #
    # source://anyway_config//lib/anyway/settings.rb#80
    def default_environmental_key?; end

    # source://anyway_config//lib/anyway/settings.rb#72
    def future; end

    # Define whether to load data from
    # *.yml.local (or credentials/local.yml.enc)
    #
    # source://anyway_config//lib/anyway/settings.rb#50
    def known_environments; end

    # Define whether to load data from
    # *.yml.local (or credentials/local.yml.enc)
    #
    # source://anyway_config//lib/anyway/settings.rb#50
    def known_environments=(_arg0); end

    # @return [Boolean]
    #
    # source://anyway_config//lib/anyway/settings.rb#84
    def matching_env?(env); end

    # Enable source tracing
    #
    # source://anyway_config//lib/anyway/settings.rb#70
    def tracing_enabled; end

    # Enable source tracing
    #
    # source://anyway_config//lib/anyway/settings.rb#70
    def tracing_enabled=(_arg0); end

    # Define whether to load data from
    # *.yml.local (or credentials/local.yml.enc)
    #
    # source://anyway_config//lib/anyway/settings.rb#50
    def use_local_files; end

    # Define whether to load data from
    # *.yml.local (or credentials/local.yml.enc)
    #
    # source://anyway_config//lib/anyway/settings.rb#50
    def use_local_files=(_arg0); end
  end
end

# Future encapsulates settings that will be introduced in the upcoming version
# with the default values, which could break compatibility
#
# source://anyway_config//lib/anyway/settings.rb#12
class Anyway::Settings::Future
  # @return [Future] a new instance of Future
  #
  # source://anyway_config//lib/anyway/settings.rb#31
  def initialize; end

  # source://anyway_config//lib/anyway/settings.rb#17
  def unwrap_known_environments; end

  # source://anyway_config//lib/anyway/settings.rb#21
  def unwrap_known_environments=(val); end

  # source://anyway_config//lib/anyway/settings.rb#35
  def use(*names); end

  private

  # Returns the value of attribute store.
  #
  # source://anyway_config//lib/anyway/settings.rb#44
  def store; end

  class << self
    # source://anyway_config//lib/anyway/settings.rb#14
    def setting(name, default_value); end

    # source://anyway_config//lib/anyway/settings.rb#26
    def settings; end
  end
end

# Provides method to trace values association
module Anyway::Tracing
  private

  def trace!(type, *path, **_arg2); end

  class << self
    def capture; end
    def current_trace; end
    def current_trace_source; end
    def source_stack; end
    def trace!(type, *path, **_arg2); end
    def trace_stack; end
    def tracing?; end
    def with_trace_source(src); end

    private

    def accessor_source(location); end
  end
end

class Anyway::Tracing::Trace
  # @return [Trace] a new instance of Trace
  def initialize(type = T.unsafe(nil), value = T.unsafe(nil), **source); end

  def clear; end
  def dig(*_arg0, **_arg1, &_arg2); end
  def dup; end

  # @raise [ArgumentError]
  def keep_if(*_arg0, **_arg1, &_arg2); end

  # @raise [ArgumentError]
  def merge!(another_trace); end

  def merge_values(hash, **opts); end
  def pretty_print(q); end
  def record_key(key, key_trace); end
  def record_value(val, *path, **opts); end

  # Returns the value of attribute source.
  def source; end

  def to_h; end

  # @return [Boolean]
  def trace?; end

  # Returns the value of attribute type.
  def type; end

  # Returns the value of attribute value.
  def value; end
end

Anyway::Tracing::Trace::UNDEF = T.let(T.unsafe(nil), Object)

# TypeCaster is an object responsible for type-casting.
# It uses a provided types registry and mapping, and also
# accepts a fallback typecaster.
class Anyway::TypeCaster
  # @return [TypeCaster] a new instance of TypeCaster
  def initialize(mapping, registry: T.unsafe(nil), fallback: T.unsafe(nil)); end

  def coerce(key, val, config: T.unsafe(nil)); end

  private

  # Returns the value of attribute fallback.
  def fallback; end

  # Returns the value of attribute mapping.
  def mapping; end

  # Returns the value of attribute registry.
  def registry; end
end

# Contains a mapping between type IDs/names and deserializers
class Anyway::TypeRegistry
  # @return [TypeRegistry] a new instance of TypeRegistry
  def initialize; end

  def accept(name_or_object, &block); end
  def deserialize(raw, type_id, array: T.unsafe(nil)); end
  def dup; end

  private

  # Returns the value of attribute registry.
  def registry; end

  class << self
    def default; end
  end
end

# source://anyway_config//lib/anyway/utils/deep_merge.rb#6
module Anyway::Utils
  class << self
    # source://anyway_config//lib/anyway/utils/deep_merge.rb#7
    def deep_merge!(source, other); end

    # Cross-platform solution
    # taken from https://stackoverflow.com/a/5471032
    #
    # source://anyway_config//lib/anyway/utils/which.rb#7
    def which(cmd); end
  end
end

# source://anyway_config//lib/anyway/version.rb#4
Anyway::VERSION = T.let(T.unsafe(nil), String)
