class MlModel < ApplicationRecord
  validates :name, presence: true
  has_one_attached :model, service: :local
end
