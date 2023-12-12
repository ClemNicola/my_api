class Booking < ApplicationRecord

belongs_to :listing
has_one :reservation, dependent: :destroy
end
