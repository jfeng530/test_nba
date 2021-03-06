class CreatePlayerStats < ActiveRecord::Migration[6.0]
  def change
    create_table :player_stats do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :team_season, null: false, foreign_key: true
      t.integer :ast
      t.integer :blk
      t.integer :dreb
      t.integer :fg3a
      t.integer :fg3m
      t.integer :fga
      t.integer :fgm 
      t.integer :fta
      t.integer :ftm
      t.integer :ored
      t.integer :pf
      t.integer :pts 
      t.integer :reb 
      t.integer :stl
      t.integer :turnover

      t.timestamps
    end
  end
end
