# This migration comes from social_stream_events_engine (originally 20111101193523)
class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer  :activity_object_id
      t.string   :title
      t.datetime :start_at
      t.datetime :end_at
      t.boolean  :all_day

      t.timestamps
    end
  end
end
