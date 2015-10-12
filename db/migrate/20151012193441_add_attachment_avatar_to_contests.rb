class AddAttachmentAvatarToContests < ActiveRecord::Migration
  def self.up
    change_table :contests do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :contests, :avatar
  end
end
