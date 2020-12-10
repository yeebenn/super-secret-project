class Survey < ApplicationRecord
    belongs_to :user, required: true

    validates :title, presence: true
    validates :questions, presence: true
end
