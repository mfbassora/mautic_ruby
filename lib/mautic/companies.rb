module Mautic
  class Company

    def self.list
      Mautic.token.get('/api/companies')
    end

    def self.get(company_id)
      Mautic.token.get("/api/companies/#{company_id}")
    end

    def self.create(json_data)
      Mautic.token.post('/api/companies/new', {body: json_data})
    end

    def self.update(company_id, json_data)
      # patch returns 404 if company not found
      Mautic.token.patch("/api/companies/#{company_id}/edit", {body: json_data})
    end

    def self.delete(company_id)
      Mautic.token.delete("/api/companies/#{company_id}/delete")
    end

    def self.add_contact(company_id, contact_id)
      Mautic.token.post("/api/companies/#{company_id}/contact/#{contact_id}/add")
    end

    def self.remove_contact(company_id, contact_id)
      Mautic.token.post("/api/companies/#{company_id}/contact/#{contact_id}/remove")
    end

  end
end
