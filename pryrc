Pry.config.editor = 'mvim -v'

if defined?(Rails) && defined?(self.reload!)
  Pry.hooks.add_hook(:before_eval, :reload_everything) { reload!(false) }
end

begin
  require 'awesome_print'
  # Pry.config.print = proc { |output, value| output.puts value.ai }
rescue
end
