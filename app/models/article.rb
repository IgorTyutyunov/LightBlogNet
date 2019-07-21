class Article < ApplicationRecord
     def to_param
"#{id}-#{slug}"
end
     has_many :comments, dependent: :destroy
	validates :title, presence:true, length: {minimum: 5}
end
