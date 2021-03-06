class Author < ApplicationRecord
  has_many :books

  def full_name
    "#{self.last_name}, #{self.first_name}"
  end
end
