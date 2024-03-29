Letsdine::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )
  config.assets.precompile += ['bootstrap.css','bootstrap-responsive.css','style.css','datepicker.css','custom.css','prettify.css','bootstrap-timepicker.css', 'bootstrap.js','bootstrap-datepicker.js','bootstrap-timepicker.js','jquery.bootstrap.wizard.js','jquery-1.10.2.min.js','jquery.gallery.js','zoomflow.css','zoomflow/zoomflow.dev.js','closed-event-overlay.js', 'admin/admin.css', 'application.css', 'dashboard.css', 'event.css','admin/application.js','admin/highcharts.js', 'events.js','restaurant_picker.js','bootstrap-multiselect.js','font-awesome.css','font-awesome-ie7.css', 'cycle.js', 'buttons.css','select2.css','select2.js','nanoscroller.css','jquery.nanoscroller.min.js','bootstrap-markdown.min.css','bootstrap-markdown.js','markdown.js','to-markdown.js','datepicker.css','bootstrap-formhelpers.css','bootstrap-formhelpers-datepicker.js','bootstrap-formhelpers-datepicker.js','bootstrap-formhelpers-datepicker.en_US.js','bootstrap-datepicker.js','bootstrap-datepicker.js','jquery-ui-1.10.3.custom.js','admin/newEvent.js']

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5
  config.action_mailer.default_url_options = { :host => 'letsdine.co' }

end
