class Nuevo < ApplicationRecord
  def self.search(search)
    where("description ILIKE ? OR user_name ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
