class Blog < ApplicationRecord
    validates :title,:content, presence: true
    validates :title,:content, length:{in:1..140}
    belongs_to :user
    has_many :favorites, dependent: :destroy
end
