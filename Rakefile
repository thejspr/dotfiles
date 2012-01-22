desc "Setup Vim bundles"
task :vim do
  root = File.expand_path(File,join("..", File.dirname(__FILE__)))

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
    next if file =~ /^[R_.]/ || File.directory?(file)

    file_target = "~/.#{file}"
    file_target = "~/.oh-my-zsh/themes/#{file}" if file == 'thejspr.zsh-theme'
    file_target = File.expand_path(file_target)

    next if File.exists?(file_target) || File.symlink?(file_target)

    cmd = "ln -s #{File.join(Dir.pwd, file)} #{file_target}"
    puts "Executing: " + cmd

    %x{#{cmd}}
  end

  puts "Finished updating symlinks"
end

task :default => ['links']
