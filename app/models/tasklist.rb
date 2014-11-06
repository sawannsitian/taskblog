class Tasklist < ActiveRecord::Base
  attr_accessible :description, :status, :subject, :user_id
  has_many :comments
  belongs_to :user
  APPROVAL_LIST = {"Task Started" => 1,"Task Incompleted" => 2, "Task Completed" => 3}
  
end
