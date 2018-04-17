class StudyGuide < ApplicationRecord
  has_many :sgfields, dependent: :destroy
  accepts_nested_attributes_for :sgfields,
                                allow_destroy: true,
                                reject_if: proc { |att| att['content'].blank? }



end
