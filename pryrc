Pry.config.should_load_plugins = false
Pry.config.editor = 'mvim -v'

if defined?(Rails)
  Pry.config.prompt = [proc { env }, "     | "]
end

def env
  Rails.env.production? ? "\e[1;31m#{Rails.env}\e[0m > " : "#{Rails.env} > "
end
