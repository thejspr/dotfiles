load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

require 'irbtools' unless ENV['RAILS_ENV']
