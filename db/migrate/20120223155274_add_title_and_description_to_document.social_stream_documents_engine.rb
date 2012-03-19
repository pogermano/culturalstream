# This migration comes from social_stream_documents_engine (originally 20111005112707)
class AddTitleAndDescriptionToDocument < ActiveRecord::Migration
    def self.up
      add_column :documents, :title, :string
      add_column :documents, :description, :text
    end
    
    def self.down
      remove_column :documents, :title
      remove_column :documents, :description
    end
end
