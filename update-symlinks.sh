#!/usr/bin/env ruby

IGNORES = %w{zsh_mods ctags README.md update-symlinks.sh}

Dir.glob("*").each do |file|
  next if IGNORES.include?(file)

  if file == 'bin'
    target = "~/#{file}"
  else
    target = "~/.#{file}"
  end

  file_target = File.expand_path(target)

  if File.symlink?(file_target)
    puts "#{file} symlink, skipping"
    next
  elsif File.exists?(file_target)
    puts "#{file} exists in root. [d]elete? [c]opy? [i]gnore?"
    prompt = STDIN.gets.chomp

    if prompt == 'd'
      system "rm -f #{file_target}"
    elsif prompt == 'c'
      puts "Copying and removing #{file_target}"
      system "cp #{file_target} ."
      system "rm -f #{file_target}"
    else
      puts 'Ignoring...'
      next
    end
  end

  cmd = "ln -sf #{File.expand_path(file)} #{file_target}"
  puts cmd
  system(cmd)
end

puts "Finished updating symlinks"
