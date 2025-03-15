class User < ApplicationRecord
  has_secure_password  # Uses bcrypt to hash passwords
end