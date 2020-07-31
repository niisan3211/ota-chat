class Hope < ApplicationRecord
  validates :hope, presence: true
  validates :group, presence: true
  validates :group_reader,presence: true
  validates :comment,presence:true
end
