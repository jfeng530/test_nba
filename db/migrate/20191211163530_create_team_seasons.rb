class CreateTeamSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :team_seasons do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.belongs_to :season, null: false, foreign_key: true

      t.timestamps
    end
  end
end
