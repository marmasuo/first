class Report < ApplicationRecord
  belongs_to :user
  has_many :comments

  def self.search(search)
    if search != ""
      Report.where('note LIKE(?)', "%#{search}%")
    else
      Report.all
    end
  end

end
