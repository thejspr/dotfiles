desc "Create dotfile symlinks"
task :links do
  IGNORES = %w{Rakefile zsh_mods init UltiSnips}

  Dir.glob("*").each do |file|
    next if IGNORES.include?(file)

    if file == 'bin'
      target = "~/#{file}"
    else
      target = "~/.#{file}"
    end

    file_target = File.expand_path(target)
    puts file_target

    next if File.exists?(file_target) || File.symlink?(file_target)

    cmd = "ln -s #{File.expand_path(file)} #{file_target}"
    puts cmd
    system(cmd)
  end

  puts "Finished updating symlinks"
end

task default: :links

desc 'Install common gems'
task :gems do
  gems = %w{pry rbenv-rehash cheat gem-ctags}
  gems.each { |g| system("gem install #{g}") }
end

desc 'Install homebrew kegs'
task :brews do
  kegs = %w{drip ctags hub macvim mongodb mosh mysql rbenv
            redis the_silver_searcher tree z zsh curl wget}
  kegs.each { |k| system("brew install #{k}") }
end
