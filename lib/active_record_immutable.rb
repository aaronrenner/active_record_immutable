require "active_record_immutable/version"

module ActiveRecordImmutable
  class ReadOnlyAttributeError < StandardError; end

  def self.extended(base)
    make_immutable = lambda do |record|
      record.readonly!

      record.attributes.each do |attr, _ |
        record.define_singleton_method :"#{attr}=" do |_|
          raise ReadOnlyAttributeError, ":#{attr} is read-only"
        end
      end
    end

    base.after_save do |record|
      make_immutable.call(record)
    end

    base.after_find do |record|
      make_immutable.call(record)
    end
  end
end
