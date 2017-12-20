module Mautic
	class Contact
		def self.list
      Mautic.token.get('/api/contacts')
    end

    def self.get(contact_id)
      Mautic.token.get("/api/contacts/#{contact_id}")
    end

		def self.create(json_data)
      Mautic.token.post('/api/contacts/new', {body: json_data})
    end

    def self.update(contact_id, json_data)
      # patch returns 404 if contact not found
      Mautic.token.patch("/api/contacts/#{contact_id}/edit", {body: json_data})
    end


    def self.create_contact(json_data)
      response = Mautic.token.post('/api/contacts/new', {body: json_data})
    end

		def self.delete(contact_id)
			Mautic.token.delete("/api/contacts/#{contact_id}/delete")
		end
	end
end
