minetest.register_privilege("back", "Allows the player to do /back.")

local pos
minetest.register_on_dieplayer(function(player)
	pos = player:getpos(),
	minetest.chat_send_all(player:get_player_name().." died.")
end)

minetest.register_chatcommand("back", {
	params = "",
	privs = {back = true},
	description = "Teleports the player back to their death position.",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found."
		end
		if not pos then
			return false, "No death position found."
		end
		player:setpos(pos)
		minetest.chat_send_player(name, "Teleported succesfully!")
	end
})
