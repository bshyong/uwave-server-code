class AddSubmissionIdToTotalSubmissionVotes < ActiveRecord::Migration
  def self.up
    add_column :total_submission_votes, :submission_id, :integer
  end

  def self.down
    remove_column :total_submission_votes, :submission_id
  end
end
