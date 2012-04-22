desc "Setup Vim bundles"
task :vim do
  root = File.expand_path(File,join("..", File.dirname(__FILE__)))

  puts 'Installing Bundles'
  system "vim -c BundleInstall! -c q -c q -u bundles.vim"

  system cmds.join(' && ')
  puts "Vim setup done"
end

IGNORE    = %w(Gemfile Gemfile.lock githooks iterm scripts Rakefile _zshrc .git .gitignore)
NO_PREFIX = %w(bin)

desc "Create symlinks"
task :links do
  Dir.glob("*").each do |file|

    if IGNORE.include?(file)
      next
    elsif NO_PREFIX.include?(file)
      target = "~/#{file}"
    elsif file =~ /zsh-theme/
      target = "~/.oh-my-zsh/themes/#{file}"
    else
      target = "~/.#{file}"
    end

    file_target = File.expand_path(target)

    next if File.exists?(file_target) || File.symlink?(file_target)

    cmd = "ln -s #{File.join(Dir.pwd, file)} #{file_target}"
    puts "Executing: " + cmd

    %x{#{cmd}}
  end

  puts "Finished updating symlinks"
end

task :default => ['links']
