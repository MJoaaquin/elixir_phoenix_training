defmodule Discuss.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name]}

  schema "users" do
    field :email, :string
    field :provider, :string
    field :name, :string
    field :token, :string

    has_many :topics, Discuss.Topic
    has_many :comments, Discuss.Comment

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:email, :provider, :name, :token])
    |> validate_required([:email, :provider, :name, :token])
  end
end
