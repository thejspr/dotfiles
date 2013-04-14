Pry.config.editor = 'mvim -v'

if defined?(Rails) && defined?(self.reload!)
  Pry.hooks.add_hook(:before_eval, :reload_everything) { reload!(false) }
end

# https://github.com/nixme/pry-nav
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
