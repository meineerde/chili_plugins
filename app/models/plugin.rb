class Plugin < ActiveRecord::Base
  belongs_to :author

  validates_presence_of :author, :identifier, :name

  has_friendly_id :identifier
  validates_uniqueness_of :identifier
  # the same as ChiliProject
  validates_format_of :identifier, :with => /^(?!\d+$)[a-z0-9\-_]*$/, :if => Proc.new { |p| p.identifier_changed? }

  has_one :screenshot
  has_many :screenshots

  def short_description
    # TODO: render this properly...
    first_line = description.split("\n\n").first
  end
end

