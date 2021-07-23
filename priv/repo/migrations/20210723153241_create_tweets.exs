defmodule Deuchainn.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :user, :string
      add :adress, :string
      add :twitter, :string

      timestamps()
    end

  end
end
