defmodule Deuchainn.Signups.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :adress, :string
    field :twitter, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:user, :adress, :twitter])
    |> validate_required([:user, :adress, :twitter])
  end
end
