require 'rake/testtask'
require_relative 'tictactoe'

task :default => :run

task :run do
  TicTacToe.new './input_teste'
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['tests/test*.rb']
  t.verbose = true
end