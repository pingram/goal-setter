class Goal < ActiveRecord::Base
  include Commentable

  validates :name, :user_id, :privacy, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :privacy, inclusion: { in: ["private", "public"] }

  belongs_to :user
end
