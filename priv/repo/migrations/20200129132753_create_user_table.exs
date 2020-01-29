defmodule One2.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
  	create table(:user) do
  		add :first_name, :string
  		add :second_name, :string
  		add :username, :string, null: false, unique: true
  		add :email, :string, null: false, unique: true
  		add :password, :string, null: false
  		add :creation_date, :integer, null: false

  		timestamps 
  	end

  	create(unique_index(:user, [:username], name: :unique_usernames))
  	create(unique_index(:user, [:email], name: :unique_email))
  end
end
