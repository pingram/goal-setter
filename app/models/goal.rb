class Goal < ActiveRecord::Base
  validates :name, :user_id, :privacy, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :privacy, inclusion: { in: ["private", "public"] }

  belongs_to :user
  has_many :comments, as: :commentable
end
