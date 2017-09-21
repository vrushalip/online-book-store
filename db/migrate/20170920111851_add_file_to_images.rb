class AddFileToImages < ActiveRecord::Migration
  def change
    add_attachment :images, :file
  end
end
