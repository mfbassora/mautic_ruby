
module Mautic
 class Configuration
   attr_accessor :public_key,:secret_key,:mautic_url,:token_hash

   def initialize
     @public_key = nil
     @secret_key = nil
     @mautic_url = nil
     @token_hash = nil
   end

 end
end