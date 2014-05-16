# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create dummy asset

AssetManager.create(:version => 1.0, :asset_path => '/assets/ruby_std.pdf')

PoolType.create(:name => "DogeCoin", :algo => "scrypt") if PoolType.where("name = ?", "DogeCoin").blank?

Pool.create(:pool_type_id => 1, :hostname => "stratum.fast-pool.com", :port => "3002", :username => 'paresto.paresto_1', :password => "anypass")

cpu_types_attributes = [{:processor => 'Intel(R) Core(TM) i3 CPU       M 380  @ 2.53GHz', :core_amount => "4", :cpu_conf_id => 1}]

pc = Pc.create({:mac => "33389", :os_ver => '7.5', :computer_name => 'test name', :system_type => 'win7' , :ram_size => '50', :ip_address => '10.10.0.1', :cpu_types_attributes => cpu_types_attributes })


#PcCpuType.create(:pc => pc, :cpu_type => CpuType.first)

