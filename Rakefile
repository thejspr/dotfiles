desc "Setup Vim bundles"
task :install do
  root = File.expand_path(File.dirname(__FILE__))

  puts 'Installing Bundles'
  system "vim -c BundleInstall! -c q -c q -u bundles.vim"

  puts 'Compile command-t extensions'
  cmds = [
    "cd #{File.join(root, 'bundle', 'command-t', 'ruby', 'command-t')}",
    "ruby extconf.rb",
    "make",
    "make install"
  ]

  system cmds.join(' && ')
  puts "Vim setup done"
end

desc "Create symlinks"
task :links do
  Dir.glob("*").each do |file| 
    file_target = "/home/jesper/.#{file}"
    file_target = "/home/jesper/#{file}" if file == 'vimwiki'
    unless file =~ /^[R_.]/ or file == "scripts" or File.file? file_target or File.directory? file_target 
      cmd = "ln -s #{Dir.pwd}/#{file} #{file_target}"
      puts "Executing: " + cmd
      %x{#{cmd}}
    end
  end 
end

task :default => ['links']
