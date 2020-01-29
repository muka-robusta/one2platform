defmodule One2.User do
	use One2.Web, :model

	schema "user" do
		
		field :first_name, :string
		field :second_name, :string
		field :username, :string
		field :email, :string
		field :password, :string
		field :creation_date, :integer

		timestamps()

	end

	def changeset(struct, params \\ %{}) do
		struct 
		|> cast(params, [:first_name, :second_name, :username, :email, :password, :creation_date])
		|> validate_required([:username, :email, :password])
		|> unique_constraint([:username, :email])
	end

end