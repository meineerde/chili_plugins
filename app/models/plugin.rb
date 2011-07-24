class Plugin < ActiveRecord::Base
  belongs_to :author

  validates_presence_of :author
  validates_presence_of :identifier, :name
  validates_uniqueness_of :identifier

  before_validation do
    self.identifier.downcase!
  end

end

