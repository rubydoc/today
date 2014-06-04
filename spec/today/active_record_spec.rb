require 'spec_helper'
ActiveRecord::Base
  .establish_connection(
    adapter: "sqlite3", 
    database: File.dirname(__FILE__) + "/../today.sqlite3"
  )

load File.dirname(__FILE__) + '/../support/schema.rb'
load File.dirname(__FILE__) + '/../support/data.rb'

describe Today do
  describe ActiveRecord do
    context :today do
      it "shoud return created_at today objects" do 
        Post.today.ids.should == Post.where(id: [1, 3]).ids
        Post.today.count.should == 2
      end

      it "shoud return updated_at today objects" do 
        Post.today(:updated_at).ids.should == Post.where(id: [2, 4]).ids
        Post.today(:updated_at).count.should == 2
      end

      it "shoud return created_at yesterday objects" do 
        at = Date.today - 1
        Post.today(at: at).ids.should == Post.where(id: [2, 4]).ids
        Post.today.count.should == 2
      end
    end

    context :yesterday do 
      it "shoud return created_at yesterday objects" do 
        Post.yesterday.ids.should == Post.where(id: [2, 4]).ids
        Post.yesterday.count.should == 2
      end
    end


  end
end