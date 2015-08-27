class Subject < ActiveRecord::Base

  has_one :page

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, -> { order("subjects.position ASC")  }
  scope :newest_first, -> { order("subjects.created_at DESC")  }
  scope :search, lambda { |query|
    where(["name LIKE ?", "%#{query}%" ])
  }

end
