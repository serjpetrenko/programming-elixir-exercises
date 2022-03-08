import Config

import_config "#{config_env()}.exs"

config :logger,
  compile_time_purge_matching: [
    [level_lower_than: :info]
  ]
