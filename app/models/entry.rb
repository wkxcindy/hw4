class Entry < ApplicationRecord
  has_one_attached :uploaded_image  # Allows file uploads
end

