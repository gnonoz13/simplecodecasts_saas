class Profile < ActiveRecord::Base
    belongs_to :user
    
    has_attached_file :avatar, :styles => 
    { :medium => "x300", :thumb => "x100" },
        :default_url => "/images/:style/missing.png",
        :storage => :s3,
        :bucket => 'gnrailsimages',
        :s3_credentials => { 
            :bucket => ENV['S3_BUCKET_NAME'],
            :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
            :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
            
        }
        validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
        
end