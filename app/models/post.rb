class Post < ApplicationRecord
  validates content: { presence: true, length: { minimum: 200 } }
end
