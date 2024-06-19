# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `react-rails` gem.
# Please instead update this file by running `bin/tapioca gem react-rails`.


# source://react-rails//lib/react.rb#3
module React
  class << self
    # Recursively camelize `props`, returning a new Hash
    #
    # @param props [Object] If it's a Hash or Array, it will be recursed. Otherwise it will be returned.
    # @return [Hash] a new hash whose keys are camelized strings
    #
    # source://react-rails//lib/react.rb#7
    def camelize_props(props); end
  end
end

# source://react-rails//lib/react/jsx/processor.rb#4
module React::JSX
  # source://react-rails//lib/react/jsx.rb#14
  def transform_options; end

  # source://react-rails//lib/react/jsx.rb#14
  def transform_options=(val); end

  # source://react-rails//lib/react/jsx.rb#14
  def transformer; end

  # source://react-rails//lib/react/jsx.rb#14
  def transformer=(val); end

  # source://react-rails//lib/react/jsx.rb#14
  def transformer_class; end

  # source://react-rails//lib/react/jsx.rb#14
  def transformer_class=(val); end

  class << self
    # @param code [String] JSX code to transform into JavaScript
    # @return [String] plain, browser-ready JavaScript code
    #
    # source://react-rails//lib/react/jsx.rb#24
    def transform(code); end

    # source://react-rails//lib/react/jsx.rb#14
    def transform_options; end

    # source://react-rails//lib/react/jsx.rb#14
    def transform_options=(val); end

    # source://react-rails//lib/react/jsx.rb#14
    def transformer; end

    # source://react-rails//lib/react/jsx.rb#14
    def transformer=(val); end

    # source://react-rails//lib/react/jsx.rb#14
    def transformer_class; end

    # source://react-rails//lib/react/jsx.rb#14
    def transformer_class=(val); end
  end
end

# A {React::JSX}-compliant transformer which uses `Babel::Transpiler` to transform JSX.
#
# source://react-rails//lib/react/jsx/babel_transformer.rb#7
class React::JSX::BabelTransformer
  # @return [BabelTransformer] a new instance of BabelTransformer
  #
  # source://react-rails//lib/react/jsx/babel_transformer.rb#10
  def initialize(options); end

  # source://react-rails//lib/react/jsx/babel_transformer.rb#23
  def transform(code); end
end

# source://react-rails//lib/react/jsx/babel_transformer.rb#9
React::JSX::BabelTransformer::DEFAULT_TRANSFORM_OPTIONS = T.let(T.unsafe(nil), Hash)

# source://react-rails//lib/react/jsx/babel_transformer.rb#8
React::JSX::BabelTransformer::DEPRECATED_OPTIONS = T.let(T.unsafe(nil), Array)

# source://react-rails//lib/react/jsx.rb#13
React::JSX::DEFAULT_TRANSFORMER = React::JSX::BabelTransformer

# A {React::JSX}-compliant transformer which uses the deprecated `JSXTransformer.js` to transform JSX.
#
# source://react-rails//lib/react/jsx/jsx_transformer.rb#6
class React::JSX::JSXTransformer
  # @return [JSXTransformer] a new instance of JSXTransformer
  #
  # source://react-rails//lib/react/jsx/jsx_transformer.rb#9
  def initialize(options); end

  # search for transformer file using sprockets - allows user to override
  # this file in their own application
  #
  # source://react-rails//lib/react/jsx/jsx_transformer.rb#30
  def jsx_transform_code; end

  # source://react-rails//lib/react/jsx/jsx_transformer.rb#23
  def transform(code); end
end

# source://react-rails//lib/react/jsx/jsx_transformer.rb#7
React::JSX::JSXTransformer::DEFAULT_ASSET_PATH = T.let(T.unsafe(nil), String)

# A Sprockets 3+-compliant processor
#
# source://react-rails//lib/react/jsx/processor.rb#6
class React::JSX::Processor
  class << self
    # source://react-rails//lib/react/jsx/processor.rb#7
    def call(input); end
  end
end

# Depending on the Sprockets version,
# attach JSX transformation the the Sprockets environment.
#
# You can override it with `config.sprockets_strategy`
#
# @example Specifying a Sprockets strategy
#   app.config.react.sprockets_strategy = :register_engine
# @example Opting out of any Sprockets strategy
#   app.config.react.sprockets_strategy = false
#
# source://react-rails//lib/react/jsx/sprockets_strategy.rb#15
module React::JSX::SprocketsStrategy
  private

  # @param the [Sprockets::Environment] environment to attach JSX to
  # @param A [Symbol, Nil] strategy name, or `nil` to detect a strategy
  #
  # source://react-rails//lib/react/jsx/sprockets_strategy.rb#20
  def attach_with_strategy(sprockets_env, strategy_or_nil); end

  # @return [Symbol] based on the environment, return a method name to call with the sprockets environment
  #
  # source://react-rails//lib/react/jsx/sprockets_strategy.rb#26
  def detect_strategy; end

  # source://react-rails//lib/react/jsx/sprockets_strategy.rb#37
  def register_engine(sprockets_env); end

  # source://react-rails//lib/react/jsx/sprockets_strategy.rb#41
  def register_engine_with_mime_type(sprockets_env); end

  # source://react-rails//lib/react/jsx/sprockets_strategy.rb#46
  def register_processors(sprockets_env); end

  class << self
    # @param the [Sprockets::Environment] environment to attach JSX to
    # @param A [Symbol, Nil] strategy name, or `nil` to detect a strategy
    #
    # source://react-rails//lib/react/jsx/sprockets_strategy.rb#20
    def attach_with_strategy(sprockets_env, strategy_or_nil); end

    # @return [Symbol] based on the environment, return a method name to call with the sprockets environment
    #
    # source://react-rails//lib/react/jsx/sprockets_strategy.rb#26
    def detect_strategy; end

    # source://react-rails//lib/react/jsx/sprockets_strategy.rb#37
    def register_engine(sprockets_env); end

    # source://react-rails//lib/react/jsx/sprockets_strategy.rb#41
    def register_engine_with_mime_type(sprockets_env); end

    # source://react-rails//lib/react/jsx/sprockets_strategy.rb#46
    def register_processors(sprockets_env); end
  end
end

# Sprockets 2-compliant processor
#
# source://react-rails//lib/react/jsx/template.rb#8
class React::JSX::Template < ::Tilt::Template
  # source://react-rails//lib/react/jsx/template.rb#13
  def evaluate(_scope, _locals); end

  # source://react-rails//lib/react/jsx/template.rb#11
  def prepare; end
end

# source://react-rails//lib/react/rails/asset_variant.rb#4
module React::Rails; end

# This class accepts some options for which build you want, then exposes where you can find
# them. In general, these paths should be added to the sprockets environment.
#
# source://react-rails//lib/react/rails/asset_variant.rb#7
class React::Rails::AssetVariant
  # @option variant
  # @param Options [Hash] for the asset variant
  # @param variant [Hash] a customizable set of options
  # @return [AssetVariant] a new instance of AssetVariant
  #
  # source://react-rails//lib/react/rails/asset_variant.rb#20
  def initialize(options = T.unsafe(nil)); end

  # @return [String] The path which contains the JSX Transformer
  #
  # source://react-rails//lib/react/rails/asset_variant.rb#16
  def jsx_directory; end

  # @return [String] "production" or "development"
  #
  # source://react-rails//lib/react/rails/asset_variant.rb#10
  def react_build; end

  # @return [String] The path which contains the specified React.js build as "react.js"
  #
  # source://react-rails//lib/react/rails/asset_variant.rb#13
  def react_directory; end
end

# source://react-rails//lib/react/rails/asset_variant.rb#8
React::Rails::AssetVariant::GEM_ROOT = T.let(T.unsafe(nil), Pathname)

# This is the default view helper implementation.
# It just inserts HTML into the DOM (see {#react_component}).
#
# You can extend this class or provide your own implementation
# by assigning it to `config.react.view_helper_implementation`.
#
# source://react-rails//lib/react/rails/component_mount.rb#10
class React::Rails::ComponentMount
  include ::ActionView::Helpers::CaptureHelper
  include ::ActionView::Helpers::OutputSafetyHelper
  include ::ActionView::Helpers::TagHelper
  include ::ActionView::Helpers::SanitizeHelper
  include ::ActionView::Helpers::TextHelper
  extend ::ActionView::Helpers::SanitizeHelper::ClassMethods

  # @return [ComponentMount] a new instance of ComponentMount
  #
  # source://react-rails//lib/react/rails/component_mount.rb#17
  def initialize; end

  # source://react-rails//lib/react/rails/component_mount.rb#15
  def camelize_props_switch; end

  # source://react-rails//lib/react/rails/component_mount.rb#15
  def camelize_props_switch=(val); end

  # Returns the value of attribute output_buffer.
  #
  # source://react-rails//lib/react/rails/component_mount.rb#13
  def output_buffer; end

  # Sets the attribute output_buffer
  #
  # @param value the value to set the attribute output_buffer to.
  #
  # source://react-rails//lib/react/rails/component_mount.rb#13
  def output_buffer=(_arg0); end

  # Render a UJS-type HTML tag annotated with data attributes, which
  # are used by react_ujs to actually instantiate the React component
  # on the client.
  #
  # source://react-rails//lib/react/rails/component_mount.rb#32
  def react_component(name, props = T.unsafe(nil), options = T.unsafe(nil), &block); end

  # {ControllerLifecycle} calls these hooks
  # You can use them in custom helper implementations
  #
  # source://react-rails//lib/react/rails/component_mount.rb#23
  def setup(controller); end

  # source://react-rails//lib/react/rails/component_mount.rb#27
  def teardown(controller); end

  private

  # source://react-rails//lib/react/rails/component_mount.rb#53
  def generate_html_options(name, options, props, prerender_options); end

  # If this controller has checked out a renderer, use that one.
  # Otherwise, use {React::ServerRendering} directly (which will check one out for this rendering).
  #
  # source://react-rails//lib/react/rails/component_mount.rb#48
  def prerender_component(component_name, props, prerender_options); end

  # source://react-rails//lib/react/rails/component_mount.rb#70
  def rendered_tag(html_options, &block); end

  class << self
    # source://react-rails//lib/react/rails/component_mount.rb#15
    def camelize_props_switch; end

    # source://react-rails//lib/react/rails/component_mount.rb#15
    def camelize_props_switch=(val); end
  end
end

# This module is included into ActionController so that
# per-request hooks can be called in the view helper.
#
# source://react-rails//lib/react/rails/controller_lifecycle.rb#7
module React::Rails::ControllerLifecycle
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::React::Rails::ControllerLifecycle::ClassMethods

  # If you want a per-request renderer, add this method as an around-action
  #
  # (`.per_request_react_rails_prerenderer` does this for you)
  #
  # @example Having one renderer instance for each controller action
  #   around_action :per_request_react_rails_prerenderer
  #
  # source://react-rails//lib/react/rails/controller_lifecycle.rb#42
  def per_request_react_rails_prerenderer; end

  # An instance of a server renderer, for use during this request
  #
  # source://react-rails//lib/react/rails/controller_lifecycle.rb#50
  def react_rails_prerenderer; end

  # Instantiate the ViewHelper implementation and call its #setup method
  # then let the controller action run,
  # then call the ViewHelper implementation's #teardown method
  #
  # source://react-rails//lib/react/rails/controller_lifecycle.rb#29
  def use_react_component_helper; end
end

# source://react-rails//lib/react/rails/controller_lifecycle.rb#17
module React::Rails::ControllerLifecycle::ClassMethods
  # Call this in the controller to check out a prerender for the whole request.
  # You can access the renderer with {#react_rails_prerenderer}.
  #
  # source://react-rails//lib/react/rails/controller_lifecycle.rb#20
  def per_request_react_rails_prerenderer; end
end

# A renderer class suitable for `ActionController::Renderers`.
# It is associated to `:component` in the Railtie.
#
# It is prerendered by default with {React::ServerRendering}.
# Set options[:prerender] to `false` to disable prerendering.
#
# @example Rendering a component from a controller
#   class TodosController < ApplicationController
#   def index
#   @todos = Todo.all
#   render component: 'TodoList', props: { todos: @todos }, tag: 'span', class: 'todo'
#   end
#   end
#
# source://react-rails//lib/react/rails/controller_renderer.rb#18
class React::Rails::ControllerRenderer
  include ::React::Rails::ViewHelper
  include ::ActionView::Helpers::CaptureHelper
  include ::ActionView::Helpers::OutputSafetyHelper
  include ::ActionView::Helpers::TagHelper
  include ::ActionView::Helpers::SanitizeHelper
  include ::ActionView::Helpers::TextHelper
  extend ::ActionView::Helpers::SanitizeHelper::ClassMethods

  # @return [ControllerRenderer] a new instance of ControllerRenderer
  #
  # source://react-rails//lib/react/rails/controller_renderer.rb#25
  def initialize(options = T.unsafe(nil)); end

  # @return [String] HTML for `component_name` with `options[:props]`
  #
  # source://react-rails//lib/react/rails/controller_renderer.rb#31
  def call(component_name, options, &block); end

  # Returns the value of attribute output_buffer.
  #
  # source://react-rails//lib/react/rails/controller_renderer.rb#23
  def output_buffer; end

  # Sets the attribute output_buffer
  #
  # @param value the value to set the attribute output_buffer to.
  #
  # source://react-rails//lib/react/rails/controller_renderer.rb#23
  def output_buffer=(_arg0); end

  private

  # source://react-rails//lib/react/rails/controller_renderer.rb#39
  def default_options; end
end

# source://react-rails//lib/react/rails/railtie.rb#7
class React::Rails::Railtie < ::Rails::Railtie; end

# source://react-rails//lib/react/rails/test_helper.rb#5
module React::Rails::TestHelper
  extend ::ActiveSupport::Concern

  # assert react_component render
  #
  # assert_react_component("HelloWorld") do |props|
  #   assert_equal "Hello world", props[:message]
  # end
  #
  # source://react-rails//lib/react/rails/test_helper.rb#13
  def assert_react_component(name); end
end

# If you change this, make sure to update VERSIONS.md
# and republish the UJS by updating package.json and `bundle exec rake ujs:publish`
#
# source://react-rails//lib/react/rails/version.rb#7
React::Rails::VERSION = T.let(T.unsafe(nil), String)

# source://react-rails//lib/react/rails/view_helper.rb#5
module React::Rails::ViewHelper
  # source://react-rails//lib/react/rails/view_helper.rb#12
  def helper_implementation_class; end

  # source://react-rails//lib/react/rails/view_helper.rb#12
  def helper_implementation_class=(val); end

  # Render a React component into the view
  # using the {helper_implementation_class}
  #
  # If called during a Rails controller-managed request, use the instance
  # created by the controller.
  #
  # Otherwise, make a new instance.
  #
  # source://react-rails//lib/react/rails/view_helper.rb#21
  def react_component(*args, &block); end

  class << self
    # source://react-rails//lib/react/rails/view_helper.rb#12
    def helper_implementation_class; end

    # source://react-rails//lib/react/rails/view_helper.rb#12
    def helper_implementation_class=(val); end
  end
end

# source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#4
module React::ServerRendering
  # source://react-rails//lib/react/server_rendering.rb#9
  def pool_size; end

  # source://react-rails//lib/react/server_rendering.rb#9
  def pool_size=(val); end

  # source://react-rails//lib/react/server_rendering.rb#9
  def pool_timeout; end

  # source://react-rails//lib/react/server_rendering.rb#9
  def pool_timeout=(val); end

  # source://react-rails//lib/react/server_rendering.rb#9
  def renderer; end

  # source://react-rails//lib/react/server_rendering.rb#9
  def renderer=(val); end

  # source://react-rails//lib/react/server_rendering.rb#9
  def renderer_options; end

  # source://react-rails//lib/react/server_rendering.rb#9
  def renderer_options=(val); end

  class << self
    # source://react-rails//lib/react/server_rendering.rb#9
    def pool_size; end

    # source://react-rails//lib/react/server_rendering.rb#9
    def pool_size=(val); end

    # source://react-rails//lib/react/server_rendering.rb#9
    def pool_timeout; end

    # source://react-rails//lib/react/server_rendering.rb#9
    def pool_timeout=(val); end

    # Check a renderer out of the pool and use it to render the component.
    #
    # @param component_name [String] Component identifier, looked up by UJS
    # @param props [String, Hash] Props for this component
    # @param prerender_options [Hash] Renderer-specific options
    # @return [String] Prerendered HTML from `component_name`
    #
    # source://react-rails//lib/react/server_rendering.rb#27
    def render(component_name, props, prerender_options); end

    # source://react-rails//lib/react/server_rendering.rb#9
    def renderer; end

    # source://react-rails//lib/react/server_rendering.rb#9
    def renderer=(val); end

    # source://react-rails//lib/react/server_rendering.rb#9
    def renderer_options; end

    # source://react-rails//lib/react/server_rendering.rb#9
    def renderer_options=(val); end

    # Discard the old ConnectionPool & create a new one.
    # This will clear all state such as loaded code, JS VM state, or options.
    #
    # @return [void]
    #
    # source://react-rails//lib/react/server_rendering.rb#17
    def reset_pool; end

    # Yield a renderer for an arbitrary block
    #
    # source://react-rails//lib/react/server_rendering.rb#34
    def with_renderer(&block); end
  end
end

# Extends ExecJSRenderer for the Rails environment
# - fetches JS code from the Rails app (Shakapacker or Sprockets)
# - stringifies props
# - implements console replay
#
# source://react-rails//lib/react/server_rendering/bundle_renderer.rb#14
class React::ServerRendering::BundleRenderer < ::React::ServerRendering::ExecJSRenderer
  # @return [BundleRenderer] a new instance of BundleRenderer
  #
  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#21
  def initialize(options = T.unsafe(nil)); end

  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#49
  def after_render(_component_name, _props, _prerender_options); end

  # Get an object which exposes assets by their logical path.
  #
  # Out of the box, it supports a Sprockets::Environment (application.assets)
  # and a Sprockets::Manifest (application.assets_manifest), which covers the
  # default Rails setups.
  #
  # You can provide a custom asset container
  # with `React::ServerRendering::BundleRenderer.asset_container_class = MyAssetContainer`.
  #
  # @return [#find_asset(logical_path)] An object that returns asset contents by logical path
  #
  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#67
  def asset_container; end

  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#45
  def before_render(_component_name, _props, _prerender_options); end

  # Prerender options are expected to be a Hash however might also be a symbol.
  # pass prerender: :static to use renderToStaticMarkup
  # pass prerender: true to enable default prerender
  # pass prerender: {} to proxy some custom options
  #
  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#39
  def render(component_name, props, prerender_options); end

  private

  # Detect what kind of asset system is in use and choose that container.
  # Or, if the user has provided {.asset_container_class}, use that.
  #
  # @return [Class] suitable for {#asset_container}
  #
  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#103
  def asset_container_class; end

  # @return [Boolean]
  #
  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#96
  def assets_precompiled?; end

  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#73
  def prepare_options(options); end

  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#92
  def prepare_props(props); end

  # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#84
  def render_function(opts); end

  class << self
    # Returns the value of attribute asset_container_class.
    #
    # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#54
    def asset_container_class; end

    # Sets the attribute asset_container_class
    #
    # @param value the value to set the attribute asset_container_class to.
    #
    # source://react-rails//lib/react/server_rendering/bundle_renderer.rb#54
    def asset_container_class=(_arg0); end
  end
end

# Reimplement console methods for replaying on the client
#
# source://react-rails//lib/react/server_rendering/bundle_renderer.rb#16
React::ServerRendering::BundleRenderer::CONSOLE_POLYFILL = T.let(T.unsafe(nil), String)

# source://react-rails//lib/react/server_rendering/bundle_renderer.rb#17
React::ServerRendering::BundleRenderer::CONSOLE_REPLAY = T.let(T.unsafe(nil), String)

# source://react-rails//lib/react/server_rendering/bundle_renderer.rb#18
React::ServerRendering::BundleRenderer::CONSOLE_RESET = T.let(T.unsafe(nil), String)

# source://react-rails//lib/react/server_rendering/bundle_renderer.rb#19
React::ServerRendering::BundleRenderer::TIMEOUT_POLYFILL = T.let(T.unsafe(nil), String)

# Return asset contents by getting them from a Sprockets::Environment instance.
#
# This is good for Rails development but bad for production because:
# - It compiles the asset lazily, not ahead-of-time
# - Rails 5 / Sprockets 3 doesn't expose a Sprockets::Environment in production.
#
# source://react-rails//lib/react/server_rendering/environment_container.rb#10
class React::ServerRendering::EnvironmentContainer
  # @return [EnvironmentContainer] a new instance of EnvironmentContainer
  #
  # source://react-rails//lib/react/server_rendering/environment_container.rb#11
  def initialize; end

  # source://react-rails//lib/react/server_rendering/environment_container.rb#15
  def find_asset(logical_path); end
end

# A bare-bones renderer for React.js + Exec.js
# - Depends on global ReactRailsUJS in the ExecJS context
# - No Rails dependency
# - No browser concerns
#
# source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#9
class React::ServerRendering::ExecJSRenderer
  # @return [ExecJSRenderer] a new instance of ExecJSRenderer
  #
  # source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#13
  def initialize(options = T.unsafe(nil)); end

  # source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#34
  def after_render(_component_name, _props, _prerender_options); end

  # Hooks for inserting JS before/after rendering
  #
  # source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#30
  def before_render(_component_name, _props, _prerender_options); end

  # @return [ExecJS::Runtime::Context] The JS context for this renderer
  #
  # source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#11
  def context; end

  # source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#20
  def render(component_name, props, prerender_options); end

  private

  # source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#56
  def compose_js(before, main, after); end

  # source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#51
  def main_render(component_name, props, prerender_options); end

  # source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#46
  def render_from_parts(before, main, after); end
end

# Handle Node.js & other ExecJS contexts
#
# source://react-rails//lib/react/server_rendering/exec_js_renderer.rb#39
React::ServerRendering::ExecJSRenderer::GLOBAL_WRAPPER = T.let(T.unsafe(nil), String)

# Get asset content by reading the compiled file from disk using a Sprockets::Manifest.
#
# This is good for Rails production when assets are compiled to public/assets
# but sometimes, they're compiled to other directories (or other servers)
#
# source://react-rails//lib/react/server_rendering/manifest_container.rb#9
class React::ServerRendering::ManifestContainer
  # @return [ManifestContainer] a new instance of ManifestContainer
  #
  # source://react-rails//lib/react/server_rendering/manifest_container.rb#10
  def initialize; end

  # source://react-rails//lib/react/server_rendering/manifest_container.rb#14
  def find_asset(logical_path); end

  class << self
    # sprockets-rails < 2.2.2 does not have `application.assets_manifest`
    #
    # @return [Boolean]
    #
    # source://react-rails//lib/react/server_rendering/manifest_container.rb#23
    def compatible?; end
  end
end

# Raised when something went wrong during server rendering.
#
# source://react-rails//lib/react/server_rendering.rb#39
class React::ServerRendering::PrerenderError < ::RuntimeError
  # @return [PrerenderError] a new instance of PrerenderError
  #
  # source://react-rails//lib/react/server_rendering.rb#40
  def initialize(component_name, props, js_message); end
end

# Get a compiled file from Shakapacker's output path
#
# source://react-rails//lib/react/server_rendering/separate_server_bundle_container.rb#8
class React::ServerRendering::SeparateServerBundleContainer
  # source://react-rails//lib/react/server_rendering/separate_server_bundle_container.rb#13
  def find_asset(filename); end

  class << self
    # @return [Boolean]
    #
    # source://react-rails//lib/react/server_rendering/separate_server_bundle_container.rb#9
    def compatible?; end
  end
end

# Get asset content by reading the compiled file from disk using the generated manifest.yml file
#
# This is good for Rails production when assets are compiled to public/assets
# but sometimes, they're compiled to other directories (or other servers)
#
# source://react-rails//lib/react/server_rendering/yaml_manifest_container.rb#9
class React::ServerRendering::YamlManifestContainer
  # @return [YamlManifestContainer] a new instance of YamlManifestContainer
  #
  # source://react-rails//lib/react/server_rendering/yaml_manifest_container.rb#10
  def initialize; end

  # source://react-rails//lib/react/server_rendering/yaml_manifest_container.rb#14
  def find_asset(logical_path); end

  private

  # source://react-rails//lib/react/server_rendering/yaml_manifest_container.rb#25
  def public_asset_path(asset_name); end

  class << self
    # @return [Boolean]
    #
    # source://react-rails//lib/react/server_rendering/yaml_manifest_container.rb#19
    def compatible?; end
  end
end
