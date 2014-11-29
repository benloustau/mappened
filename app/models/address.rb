class Address < ActiveRecord::Base
	has_and_belongs_to_many :users

	def address_title
    "#{title}"
  end
end