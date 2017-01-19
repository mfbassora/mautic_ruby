module Mautic
	class Contact 
		def self.get_contacts
		end 
		def self.create_contact(json_data)
			response = Mautic.token.post('/api/contacts/new', {body: json_data})
		end
	end
end