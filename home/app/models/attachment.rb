class Attachment < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :file_container, polymorphic: true
end

