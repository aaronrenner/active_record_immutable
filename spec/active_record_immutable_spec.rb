require 'spec_helper'
require 'active_record_immutable'


describe ActiveRecordImmutable do
  Temping.create :klass do
    with_columns do |t|
      t.string :attr
    end

    extend ActiveRecordImmutable
  end

  let(:instance) { Klass.create }

  describe 'from saved' do
    it 'is unsavable after save' do
      expect{instance.save}.to raise_error(ActiveRecord::ReadOnlyRecord)
    end

    it 'is undestroyable after save' do
      expect{instance.destroy}.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end

  describe 'from find' do
    let(:from_db) { Klass.first }

    it 'is unsavable from record find' do
      expect{from_db.save}.to raise_error(ActiveRecord::ReadOnlyRecord)
    end

    it 'is undestroyable from record find' do
      expect{from_db.destroy}.to raise_error(ActiveRecord::ReadOnlyRecord)
    end
  end
end
