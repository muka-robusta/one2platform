defmodule One2.UserController do
	use One2.Web, :controller
	alias One2.{User}

	def index(conn, _params) do
		users = Repo.all(User)
		render conn, "index.html", users: users
	end
end