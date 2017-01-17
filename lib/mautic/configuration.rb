
module Mautic
 class Configuration
   attr_accessor :public_key,:secret_key,:mautic_url

   def initialize
     @public_key = nil
     @secret_key = nil
     @mautic_url = nil
   end

 end
end