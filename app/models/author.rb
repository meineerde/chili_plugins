class Author < ActiveRecord::Base
  has_many :plugins

  def self.current
    self.new
  end

  def can_edit?(plugin)
    true
  end

  def to_s
    self.name
  end
end
