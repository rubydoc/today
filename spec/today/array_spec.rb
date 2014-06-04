require File.expand_path('../../spec_helper', __FILE__)

class Something
  attr_accessor :id, :created_at
  def initialize id, created_at
    @id = id
    @created_at = created_at
  end
end

describe Today do
  describe Array do
    let :today do
      Date.today
    end
    let :yesterday do
      Date.today - 1
    end
    context "#today" do
      it "should return only today hash array" do
        arr = [
          { id: 1, created_at: yesterday },
          { id: 2, created_at: today },
          { id: 3, created_at: yesterday },
          { id: 4, created_at: today },
        ]
        arr.today.should == [
          { id: 2, created_at: today },
          { id: 4, created_at: today }
        ]

        arr.today(at: yesterday).should == [
          { id: 1, created_at: yesterday },
          { id: 3, created_at: yesterday }
        ]
      end

      it "should return empty array" do
        [].today.should == []
      end

      it "should return object array" do 
        today_list = [
          Something.new(1, today),
          Something.new(2, yesterday),
          Something.new(3, today),
          Something.new(4, yesterday)
        ].today
        today_list[0].id.should == 1
        today_list[1].id.should == 3
        today_list.length.should == 2

      end

      it "should raise error when could't find by key" do 
        expect do 
          [
            Something.new(1, today),
            Something.new(2, yesterday),
            Something.new(3, today),
            Something.new(4, yesterday)
          ].today(:updated_at)
        end.to raise_error
      end
    end
    
    context '#yesterday' do
      it "should return only yesterday hash array" do
        yesterday_list = [
          Something.new(1, today),
          Something.new(2, yesterday),
          Something.new(3, today),
          Something.new(4, yesterday)
        ].yesterday
        yesterday_list[0].id.should == 2
        yesterday_list[1].id.should == 4
        yesterday_list.length.should == 2
      end
    end

  end
end
