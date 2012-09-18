Pry.config.editor = 'mvim -v'

rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails) && defined?(Rails)
  Pry.config.prompt = [proc { env }, proc { "     | " }]
end

def env
  Rails.env.production? ? "\e[1;31m#{Rails.env}\e[0m > " : "#{Rails.env}> "
end

