class UserForun < ApplicationRecord
  belongs_to :user
  belongs_to :forun
end
