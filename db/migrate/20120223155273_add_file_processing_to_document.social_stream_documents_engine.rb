# This migration comes from social_stream_documents_engine (originally 20110922173707)
class AddFileProcessingToDocument < ActiveRecord::Migration
    def self.up
      add_column :documents, :file_processing, :boolean
    end
    
    def self.down
      remove_column :documents, :file_processing
    end
end
