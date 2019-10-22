Pry.config.editor = 'nvim'

if defined?(Rails) && defined?(self.reload!)
  Pry.hooks.add_hook(:before_eval, :reload_everything) { reload!(false) }
end

Pry.config.commands.alias_command "d", "disable-pry"
