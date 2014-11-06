class Comment < ActiveRecord::Base
  belongs_to :tasklist
  belongs_to :user, :foreign_key => "commenter_id"
  attr_accessible :body, :commenter_id
end
