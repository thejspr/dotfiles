desc "Create dotfile symlinks"
task :links do
  IGNORES = %w{Rakefile zsh_mods}

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
    system(cmd)
  end

  puts "Finished updating symlinks"
end

task default: :links

desc 'Install common gems'
task :gems do
  gems = %w{pry rbenv-rehash cheat}
  gems.each { |g| system("gem install #{g}") }
end
