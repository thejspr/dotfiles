def new_p(attrs = {})
  require 'spec/spec_helper' unless Property.respond_to?(:make)
  Property.make({:published => false,
                 :auto_publishing_enabled => true,
                 :user => User.find(1008356)}.merge(attrs))
end
