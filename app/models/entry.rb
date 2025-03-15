class Entry < ApplicationRecord
  has_one_attached :image  # Allows file uploads
end

