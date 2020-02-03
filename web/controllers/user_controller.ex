defmodule One2.UserController do
	use One2.Web, :controller
	alias One2.{User}

	def index(conn, _params) do
		users = Repo.all(User)
		render conn, "index.html", users: users
	end

	def new(conn, _params) do
		user_changeset = User.changeset(%User{}, %{})
		render conn, "new.html", changeset: user_changeset
	end

	def create(conn, %{"user" => user_params_raw}) do
		creation_account_date = :os.system_time(:seconds)
		user_params_raw = Map.put(user_params_raw, "creation_date", creation_account_date)

		password_raw = Map.get(user_params_raw, "password")
		password_hashed = generate_hashed_passkey(password_raw, creation_account_date)

		user_params = %{user_params_raw | "password" => password_hashed}
		changeset = User.changeset(%User{}, user_params)

		case Repo.insert(changeset) do
			{:ok, _user} ->
				conn
				|> put_flash(:info, "Registration Success")
				|> redirect(to: page_path(conn, :index))
			{:error, changeset} ->
				render conn, "new.html", changeset 
		end
	end


	defp generate_hashed_passkey(passkey, creation_date) do

		unhashed_passkey = (passkey <> Integer.to_string(creation_date) <> Base.encode64("1TWO", padding: false))
		hashed_passkey = :crypto.hash(:sha256, unhashed_passkey) |> Base.encode64(padding: false)
		hashed_passkey
	end

end