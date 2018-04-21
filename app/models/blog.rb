class Blog < ApplicationRecord
    validates :title,:content, presence: true
    validates :title,:content, length:{in:1..140}
end
