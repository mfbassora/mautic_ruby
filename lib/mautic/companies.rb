module Mautic
  class Company
    class << self
      def list
        Mautic.get_request('/api/companies')
      end

      def get(company_id)
        Mautic.get_request("/api/companies/#{company_id}")
      end

      def create(json_data)
        Mautic.post_request('/api/companies/new', {body: json_data})
      end

      def update(company_id, json_data)
        # patch returns 404 if company not found
        Mautic.patch_request("/api/companies/#{company_id}/edit", {body: json_data})
      end

      def delete(company_id)
        Mautic.delete_request("/api/companies/#{company_id}/delete")
      end

      def add_contact(company_id, contact_id)
        Mautic.post_request("/api/companies/#{company_id}/contact/#{contact_id}/add")
      end

      def remove_contact(company_id, contact_id)
        Mautic.post_request("/api/companies/#{company_id}/contact/#{contact_id}/remove")
      end
    end
  end
end
