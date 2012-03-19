# This migration comes from social_stream_linkser_engine (originally 20111129100618)
class CreateSocialStreamLinkser < ActiveRecord::Migration
  def self.up
    create_table "links", :force => true do |t|
      t.integer  "activity_object_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "url"
      t.string   "callback_url"
      t.string   "title"
      t.string   "image"
      t.text     "description"
    end

    add_index "links", "activity_object_id"
  end

  def self.down
    remove_foreign_key "links", :name => "links_on_activity_object_id"
    drop_table :links
  end
end
