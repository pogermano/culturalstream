# This migration comes from social_stream_base_engine (originally 20111221103509)
class AddLanguageField < ActiveRecord::Migration
  def self.up
    change_table "users" do |t|
      t.string "language", :default => "en"
    end
  end

  def self.down
    change_table :users do |t|
      t.remove "language"
    end
  end
end
