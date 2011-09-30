#!/usr/bin/env ruby

require 'date'

date = Date.today

puts "Backup/commit dotfiles to github"
Dir.chdir("/home/jesper/dotfiles")
`git add -A && git commit -m "Automatic backup" && git push`

puts "Update z"
Dir.chdir("/home/jesper/repos/z")
`git pull`

puts "Update rvm"
`rvm get head`
