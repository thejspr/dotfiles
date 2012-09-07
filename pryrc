Pry.config.editor = 'mvim -v'

rails = File.join Dir.getwd, 'config', 'environment.rb'

if File.exist?(rails)
  Pry.config.prompt = [proc { "#{Rails.env}> " }, proc { "     | " }]
end
