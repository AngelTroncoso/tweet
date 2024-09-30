class Nuevo < ApplicationRecord
  def self.search(search)
    where("description ILIKE ? OR username ILIKE ?", "%#{search}%", "%#{search}%")
  end
end
