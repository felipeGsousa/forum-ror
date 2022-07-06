class Forun < ApplicationRecord
    has_many :posts, dependent: :delete_all

    has_many :user_forun, dependent: :delete_all
    has_many :users, through: :user_forun
end
