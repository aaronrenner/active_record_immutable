require 'spec_helper'
require 'active_record_immutable'


describe ActiveRecordImmutable do
  let(:klass) do
    klass = Temping.create :klass
    klass.send(:extend, ActiveRecordImmutable)
  end

  it 'is saveable after new' do
    instance = klass.new
    instance.save.should be_true
  end
end
