task :links do
  Dir.glob("*").each do |file| 
    cmd = "ln -s #{Dir.pwd}/#{file} ~/.#{file}"
    %x{#{cmd}}
  end 
end

task :default => ['links']
