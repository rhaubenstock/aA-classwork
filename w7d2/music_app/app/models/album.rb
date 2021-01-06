# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  is_live    :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  validates :title, :year, :is_live, :band_id, presence: true
  validates :title, uniqueness: {scope: :band_id}
  validates :is_live, inclusion: [true, false]

  belongs_to :band
  has_many :tracks,
    dependent: :destroy
  

end
