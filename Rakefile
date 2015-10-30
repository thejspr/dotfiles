desc "Create dotfile symlinks"
task :links do
  IGNORES = %w{Gemfile Gemfile.lock Rakefile Brewfile zsh_mods init UltiSnips README.md rbenv tmux private.xml}

  Dir.glob("*").each do |file|
    next if IGNORES.include?(file)

    if file == 'bin'
      target = "~/#{file}"
    else
      target = "~/.#{file}"
    end

    file_target = File.expand_path(target)

    next if File.exists?(file_target) || File.symlink?(file_target)

    cmd = "ln -s #{File.expand_path(file)} #{file_target}"
    puts cmd
    system(cmd)
  end

  puts "Finished updating symlinks"
end

task default: :links
