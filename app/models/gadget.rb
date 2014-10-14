class Gadget < ActiveRecord::Base
  belongs_to :user
  has_many :images, inverse_of: :gadget, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  def self.search(query)
    where('name LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
  end
end
