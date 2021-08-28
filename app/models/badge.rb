class Badge
  include ActiveModel::Model

  attr_accessor :name, :issue_date, :uuid
  validates :name, :issue_date, :uuid, presence: true

  def to_cryptographic_hash
    Digest::SHA1.hexdigest("#{self.uuid}#{self.name}#{self.issue_date}")
  end
end
