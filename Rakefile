task :links do
  Dir.glob("*").each do |file| 
    file_target = "/home/jesper/.#{file}"
    file_target = "/home/jesper/#{file}" if file == 'vimwiki'
    unless file =~ /^[R_.]/ or File.file? file_target or File.directory? file_target 
      cmd = "ln -s #{Dir.pwd}/#{file} #{file_target}"
      puts "Executing: " + cmd
      %x{#{cmd}}
    end
  end 
end

task :default => ['links']
