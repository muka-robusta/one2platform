defmodule One2.UserView do
	use One2.Web, :view
	alias One2.User

	def full_name(%User{first_name: first_name, second_name: second_name}) do
		name = first_name <> " " <> second_name
	end


end