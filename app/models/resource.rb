class Resource < ActiveRecord::Base
  acts_as_eventful
  acts_as_active

  belongs_to :platform, inverse_of: :resources

  validates_uniqueness_of :reference, scope: :platform_id

  def self.find_or_create(platform, reference)
    return nil unless reference
    r = where(platform_id: platform.try(:id), reference: reference).first
    unless r
      r = new
      r.platform = platform
      r.reference = reference
      r.save!
    end
    r
  end
end
