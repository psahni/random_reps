

#            [1]               [2]   [3]           [4]                  [5]     [6]           [7]
#  => ["a0-48-1c-eb-b6-8f", "6.1", "CATA-PC", "32-bit Operating System", "3991", "89.33.77.76", "true"]


class ProductionDump

	def dump

		file = File.open(File.join(Rails.root, 'pc_data_planbit'), 'r')
		file.each_line do |line|
			attributes = line.split("\t")
			p attributes
			Pc.create(:mac => attributes[1], :os_ver => attributes[2], :computer_name => attributes[3],
			          :system_type => attributes[4], :ram_size => attributes[5], :ip_address => attributes[6])
		end
	end


end


