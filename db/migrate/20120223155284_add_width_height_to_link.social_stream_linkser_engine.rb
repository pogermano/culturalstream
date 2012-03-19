# This migration comes from social_stream_linkser_engine (originally 20111219122952)
class AddWidthHeightToLink < ActiveRecord::Migration
  def self.up
    change_table "links" do |t|
      t.integer "width",  :default => 470
      t.integer "height", :default => 353
    end
  end

  def self.down
    change_table :links do |t|
      t.remove "width"
      t.remove "height"
    end
  end
end
