class Like < ApplicationRecord
    validates :liker_id, :likeable_id, :likeable_type, presence: true
    validates :liker_id, uniqueness: {scope: [:likeable_type, :likeable_id]}

    belongs_to :likeable, polymorphic: true

    belongs_to :liker,
        primary_key: :id,
        foreign_key: :liker_id,
        class_name: :User
end
