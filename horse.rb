#!/usr/bin/env ruby

require 'date'

date = Date.today

puts "Backup/commit dotfiles to github"
Dir.chdir("/home/jesper/dotfiles")
system("git add -A && git commit -m 'Automatic backup' && git push")

puts "Update z"
Dir.chdir("/home/jesper/repos/z")
system("git pull")

puts "Update rvm"
system(`rvm get head`)
