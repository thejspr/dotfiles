Pry.config.should_load_plugins = false
Pry.config.editor = 'mvim -v'

if defined?(Rails)
  Pry.hooks.add_hook(:before_eval, :reload_everything) { reload!(false) }
end
