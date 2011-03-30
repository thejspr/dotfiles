task :links do
  Dir.glob("*").each do |file| 
    unless file =~ /^[R_.]/
      cmd = "ln -s #{Dir.pwd}/#{file} ~/.#{file}"
      %x{#{cmd}}
    end
  end 
end

task :default => ['links']
