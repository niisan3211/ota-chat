class Tag < ApplicationRecord
  has_many :group_tags,dependent: :destroy
  has_many :groups,through: :group_tags

  def tag_rule
    if @tag =~ /^#/
      @tag.save
    else
      return
    end
  end

end
