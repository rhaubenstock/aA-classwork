# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :string
#  album_id   :integer          not null
#  is_bonus   :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Track < ApplicationRecord
  validates :title, :ord, :album_id, :is_bonus, presence: true
  validates :title, uniqueness: {scope: :album_id}
  validates :ord, uniqueness: {scope: :album_id}
  validates :is_bonus, inclusion: [true, false]

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band
  
  has_many :notes,
    dependent: :destroy
end
