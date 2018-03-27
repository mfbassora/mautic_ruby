module Mautic
  class Contact
    class << self
      def list
        Mautic.get_request('/api/contacts')
      end

      def get(contact_id)
        Mautic.get_request("/api/contacts/#{contact_id}")
      end

      def create(json_data)
        Mautic.post_request('/api/contacts/new', {body: json_data})
      end

      def update(contact_id, json_data)
        # patch returns 404 if contact not found
        Mautic.patch_request("/api/contacts/#{contact_id}/edit", {body: json_data})
      end

      def create_contact(json_data)
        Mautic.post_request('/api/contacts/new', {body: json_data})
      end

      def delete(contact_id)
        Mautic.delete_request("/api/contacts/#{contact_id}/delete")
      end
    end
  end
end