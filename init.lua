dofile("data/scripts/perks/perk.lua")
dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/lib/mod_settings.lua")


function OnPlayerSpawned( player_entity )

	-- Run this only once per game
	local init_check_flag = "starting_perk_init_done"
	if GameHasFlagRun( init_check_flag ) then
		return
	end
	GameAddFlagRun( init_check_flag )

	-- Load mod settings
	local perks_amount = math.ceil(ModSettingGet("starting_perk.perks_spawned") - 0.5)
	local only_one = ModSettingGet("starting_perk.only_one")

	-- Print mod settings to the player
	if only_one then
		GamePrint("Starting with a choice between " .. to_string(perks_amount) .. " perks")
	else
		GamePrint("Starting with " .. to_string(perks_amount) .. " free perks")
	end

	local x_center = 789
	local y_bottom = -96

	local gap = 6
	local size = 14
	local offset = gap + size

	-- Find the number of rows
	-- Ceil makes it wider instead of taller
	local rows = math.ceil(math.sqrt(perks_amount))

	-- Draw perk rows
	for current_row = 1, rows, 1 do 

		-- Find the number of columns
		local cols
		if perks_amount < rows then
			-- Spawn only the leftover amount
			cols = perks_amount
		else
			-- Spawn the full amount
			cols = rows
		end

		-- If there is something to spawn
		if cols ~= 0 then
			-- Find the total row width
			local width = (offset * cols) + size
			
			-- Find the X position to start spawning perks at
			local x_left = x_center - (width / 2)
			
			-- Draw perk columns
			for current_col=1, cols, 1 do

				-- Find the position to spawn each perk at
				local x = x_left + (current_col - 1) * offset
				local y = y_bottom - (current_row - 1) * offset

				-- Spawn the perk
				perk_spawn_random(x, y, not only_one)

				perks_amount = perks_amount - 1
			end
		end
	end

	-- Used to take the screenshot
	-- perk_spawn( 771, -96, "GENOME_MORE_LOVE" )
end
