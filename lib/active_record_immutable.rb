require "active_record_immutable/version"

module ActiveRecordImmutable
  def self.extended(base)
    base.after_save do |record|
      record.readonly!
    end

    base.after_find do |record|
      record.readonly!
    end
  end
end
