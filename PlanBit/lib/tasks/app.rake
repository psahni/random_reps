namespace :db do
	task :production_dump => :environment do
		require File.join(Rails.root, 'lib/production_dump.rb')
		ProductionDump.new.dump
	end
end