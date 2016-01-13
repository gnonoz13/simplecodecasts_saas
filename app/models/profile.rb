class Profile < ActiveRecord::Base
    belongs_to :user
    
    has_attached_file :avatar, :styles => 
    { :medium => "x300", :thumb => "x100" },
        :default_url => "/images/:style/missing.png",
        :storage => :s3,
        :bucket => 'gnrailsimages',
        :s3_credentials => { 
            :bucket => ENV['gnrailsimages'],
            :access_key_id => ENV['AKIAJHZBGB5ERIMBBBZQ'],
            :secret_access_key => ENV['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']
            
        }
        validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
        
end