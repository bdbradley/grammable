class Comment < ApplicationRecord
  belongs_to :gram
  #since comments have a user_id
  belongs_to :user
end
