require 'babosa'
class Article < ApplicationRecord
include FriendlyId
friendly_id :title, :use => [:slugged, :history]
	#friendly_id :title, :use => [:slugged]
 
	def slug_candidates
		[
			:title,
			[:title, :category]
		]
	end
 
	def normalize_friendly_id(text)
		text.to_slug.normalize! :transliterations => [:russian, :latin]
	end


    def should_generate_new_friendly_id?
        title_changed? || super
    end


#def should_generate_new_friendly_id?
#new_record?
#end

#     def to_param
##{id}-#{slug}"
#end
     has_many :comments, dependent: :destroy
	validates :title, presence:true, length: {minimum: 5}
end
