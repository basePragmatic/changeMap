class AddReferenceMapsToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :maps, :user, index: true
  end
end
