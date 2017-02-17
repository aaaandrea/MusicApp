# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  ord        :integer          not null
#  bonus      :boolean
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :name, :album_id, :ord, presence: true
  validates :bonus, inclusion: { in: [true, false] }

  belongs_to :album

  has_one :band,
          through: :album,
          source: :band
end
