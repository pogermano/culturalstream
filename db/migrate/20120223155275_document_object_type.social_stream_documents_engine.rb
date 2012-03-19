# This migration comes from social_stream_documents_engine (originally 20120109155431)
class DocumentObjectType < ActiveRecord::Migration
  class ActivityObjectMigration < ActiveRecord::Base
    self.record_timestamps = false
    set_table_name "activity_objects"
  end

  def up
    ActivityObjectMigration.where(:object_type => %w( Picture Audio Video )).each do |a|
      a.object_type = "Document"
      a.save!
    end
  end

  def down
  end
end
