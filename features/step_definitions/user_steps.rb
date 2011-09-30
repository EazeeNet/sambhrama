Given /^there are the following users:$/ do |table|
	table.hashes.each do |attr|
	  unconfirmed = attr.delete("unconfirmed") == "true"
		@user = User.create!(attr)
		@user.confirm! unless unconfirmed
	end
end

