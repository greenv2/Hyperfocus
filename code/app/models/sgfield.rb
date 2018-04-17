class Sgfield < ApplicationRecord
  belongs_to :study_guide, optional: true
  self.inheritance_column = :_type_disabled
end
