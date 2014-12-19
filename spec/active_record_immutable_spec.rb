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

  describe 'when unsaved' do
    it 'can be saved' do
      klass = Klass.new
      expect{ klass.save }.not_to raise_error
    end

    it 'can set attributes' do
      klass = Klass.new
      klass.attr = 'value'
      expect(klass.attr).to eq('value')
    end
  end

  describe 'from saved' do
    it 'is unsavable after save' do
      expect{instance.save}.to raise_error(ActiveRecord::ReadOnlyRecord)
    end

    it 'is undestroyable after save' do
      expect{instance.destroy}.to raise_error(ActiveRecord::ReadOnlyRecord)
    end

    it 'raises an error if trying to set an attribute when immutable' do
      expect{ instance.attr = 'value' }.to raise_error(ActiveRecordImmutable::ReadOnlyAttributeError, ":attr is read-only")
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

    it 'raises an error if trying to set an attribute when immutable' do
      expect{ from_db.attr = 'value' }.to raise_error(ActiveRecordImmutable::ReadOnlyAttributeError, ":attr is read-only")
    end
  end
end
