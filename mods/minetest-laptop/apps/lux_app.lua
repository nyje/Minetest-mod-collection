local lux = {}
lux.version="0.15"
local worldpath = minetest.get_worldpath()
local i = string.find(worldpath, "/[^/]*$")
local worldname = worldpath:sub(i+1)
local help_texts = {
	CLS = "                   Clears the screen.",
	DATE = "                 Displays the current system date.",
	HELP = "                 Displays HELP menu. HELP [command] displays help on that command.",
	QUIT = "                   Exit CS-BOS shell",
	REBOOT = "           Perform a soft reboot.",
    INV = "             show your inventory, or that of a named player.",
    ECHO = "            echo what you typed",
    E = "               reverse input string",
    PRO = "             list times table of 1st param, up to 2nd param",
    WHERE = "           show current position",
    WHO = "            list connected players",
    MT = "              dump the minetest object to terminal",
}


local supported_textcolors = {
	GREEN = "#00FF33",
	AMBER = "#FFB000",
	WHITE = "#FFFFFF",
}


local function get_initial_message(mtos, data)
	data.outlines = {
        minetest.get_server_status(),
        "World: ".. worldname,
		"Lux server control shell v"..lux.version.." (c) Nigel Garnett",
		"",
	}
end


local function add_outline(data, line)
	table.insert(data.outlines, line)
	if #data.outlines > data.scrollback_size then
		for i = data.scrollback_size, #data.outlines do
			table.remove(data.outlines,1)
		end
	end
end


local function is_executable_app(mtos, app)
	if not mtos.sysdata then -- cannot executed withoud sysdata
		return false
	elseif app and not app.view and -- app given
			app.name ~= 'lux_app' and -- No recursive calls
			mtos:is_app_compatible(app.name) then
		return true
	else
		return false
	end
end

local function numWithCommas(n)
  return tostring(math.floor(n)):reverse():gsub("(%d%d%d)","%1,"):gsub(",(%-?)$","%1"):reverse()
end


--- Simple VFS for BOS Operations
local simple_vfs_map = {}
-- Hard disk
simple_vfs_map.HDD = {
	id = 'HDD',
	dev = 'hdd',
	longname = 'DISK 0:HDD',
	check_inserted = function(disk, mtos)
		return mtos.bdev:is_hw_capability('hdd')
	end,
	get_full_name = function(disk, mtos)
		return disk.longname
	end,
	get_format = function(disk, mtos)
		return 'BOOT'
	end,
}
-- Floppy disk
simple_vfs_map.FDD = {
	id = 'FDD',
	dev = 'removable',
	longname = 'DISK 0:FDD',
	check_inserted = function(disk, mtos)
		local idata = mtos.bdev:get_removable_disk()
		if idata.stack and ( idata.os_format == 'data' or idata.os_format == 'boot') then
			return true
		end
	end,
	get_full_name = function(disk, mtos)
		local idata = mtos.bdev:get_removable_disk()
		return disk.longname..": "..idata.label
	end,
	get_format = function(disk, mtos)
		local idata = mtos.bdev:get_removable_disk()
		return idata.os_format
	end,
}
simple_vfs_map.REMOVABLE = simple_vfs_map.FDD


local simple_vfs = {}
-- Get the VFS disk object
function simple_vfs.get_disk(mtos, device)
	if not device then
		return
	end
	local disk = simple_vfs_map[device:upper()]
	local inserted
	if disk then
		inserted  = disk:check_inserted(mtos)
	end
	return disk, inserted
end


function simple_vfs.parse_path(input_line)
	local filename = input_line:gsub("^%s*(.-)%s*$", "%1") -- strip spaces
	local diskname
	if filename:sub(4,4) == ':' then
		diskname = filename:sub(1,3)
		filename = filename:sub(5)
	end
	return filename, diskname
end
--- End for Simple VFS for BOS Operations


local function initialize_data(data, sdata, mtos, sysos)
	if mtos.os_attr.blacklist_commands.TEXTCOLOR then
		data.tty = mtos.os_attr.tty_style
	else
		data.tty = sdata.tty or data.tty or mtos.os_attr.tty_style
		if not supported_textcolors[data.tty] then --compat hack
			data.tty = mtos.os_attr.tty_style
		end
	end

	data.scrollback_size = sdata.scrollback_size or data.scrollback_size or mtos.os_attr.min_scrollback_size
		-- Set initial message on new session
	if not data.outlines then
		get_initial_message(mtos, data)
	end

	if not data.current_disk then
		if sysos.booted_from == 'removable' then
			data.current_disk = 'FDD'
		else
			data.current_disk = 'HDD'
		end
	end
	data.inputfield = data.inputfield or ""
end


laptop.register_app("lux", {
	app_name = "Lux server shell",
	app_info = "Live Server Shell Interface",
	fullscreen = true,
	app_icon = "lux.png",

	formspec_func = function(cs_bos, mtos)
		local data = mtos.bdev:get_app_storage('ram', 'cs_bos')
		local sysos = mtos.bdev:get_app_storage('ram', 'os')
		local sdata = mtos.bdev:get_app_storage('system', 'cs_bos') or {} -- handle temporary if no sysdata given

		-- no system found. In case of booted from removable, continue in live mode
		if not mtos.sysdata and sysos.booted_from ~= "removable" then
			local formspec = "size[10,7]background[10,7;0,0;laptop_launcher_insert_floppy.png;true]"..
					"listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"..
					"list[nodemeta:"..mtos.pos.x..','..mtos.pos.y..','..mtos.pos.z..";main;2.5,3;1,1;]" ..
					"list[current_player;main;0,6.5;8,1;]" ..
					"listring[nodemeta:"..mtos.pos.x..','..mtos.pos.y..','..mtos.pos.z..";main]" ..
					"listring[current_player;main]"

			local idata = mtos.bdev:get_removable_disk()
			if idata.stack then
				if idata.os_format ~= "boot" then
					formspec = formspec .. "label[0,1.7;Disk found but not formatted to boot]"
				end
			end
			return formspec
		end

		initialize_data(data, sdata, mtos, sysos)
		local tty = supported_textcolors[data.tty]
		local formspec =
				"size[15,10]background[15,10;0,0;laptop_theme_desktop_icon_label_button_black.png;true]"..
				"label[-0.15,9.9;"..minetest.colorize(tty,"LUX"..">").."]"..
				"field[1.020,9.93;15.6,1;inputfield;;"..minetest.formspec_escape(data.inputfield).."]"..
				"tablecolumns[text]tableoptions[background=#000000;border=false;highlight=#000000;"..
				"color="..tty..";highlight_text="..tty.."]"..
				"table[-0.35,-0.35;15.57, 10.12;outlines;"
		for idx,line in ipairs(data.outlines) do
			if idx > 1 then
				formspec = formspec..','
			end
			formspec = formspec..minetest.formspec_escape(line)
		end
		formspec = formspec..";"..#data.outlines.."]".."field_close_on_enter[inputfield;false]"
		return formspec
	end,

	receive_fields_func = function(cs_bos, mtos, sender, fields)
		local data = mtos.bdev:get_app_storage('ram', 'cs_bos')
		local sysos = mtos.bdev:get_app_storage('ram', 'os')
		local sdata = mtos.bdev:get_app_storage('system', 'cs_bos') or {} -- handle temporary if no sysdata given
		initialize_data(data, sdata, mtos, sysos)

		if fields.inputfield then -- move received data to the formspec input field
			data.inputfield = fields.inputfield
		end

		if fields.key_enter then
			-- run the command
			local exec_all = data.inputfield:split(" ")
			local input_line = data.inputfield
			local exec_command = exec_all[1] --further parameters are 2++
			add_outline(data, "lux> "..data.inputfield)
			data.inputfield = ""
			if exec_command then
				exec_command = exec_command:upper()
			end
			if exec_command == nil then --empty line
----------------------------------------------------------
			elseif exec_command == "INV" then
                if exec_all[2] then
                    local boop = minetest.get_player_by_name(tostring(exec_all[2]))
                    if boop then
                        sender=boop
                        add_outline(data, "Showing "..exec_all[2].."'s inventory:")
                    else
                        add_outline(data, "User "..exec_all[2].." not found, showing "..sender:get_player_name())
                    end
                end
                local inv = sender:get_inventory()
                local ll = inv:get_lists()
                for k,v in pairs(ll) do
                    local invstring="Inventory: "..tostring(k)
                    local itstring=""
                    for __,vv in pairs(v) do
                        if vv:get_name()~="" then
                            itstring=itstring.." "..vv:get_count()..". '"..vv:get_name().."',"
                        end
                    end
                    if itstring ~="" then
                        add_outline(data, invstring)
                        local count=0
                        local boop =""
                        local contents = itstring:split(",")
                        for _,node in pairs(contents) do
                            count=count+1
                            boop = boop..node..",    "
                            if count%4==0 then
                                add_outline(data, "---> "..boop)
                                boop=""
                            end
                        end
                    end
                end
----------------------------------------------------------
			elseif exec_command == "ECHO" then
				if exec_all[2] then
                    local i = input_line:find(" ") +1
                    add_outline(data, input_line:sub(i))
                end
----------------------------------------------------------
			elseif exec_command == "E" then
				if exec_all[2] then
                    local i = input_line:find(" ") +1
                    add_outline(data, sender:get_player_name().." says: "..string.reverse(input_line:sub(i)))
                end






            elseif exec_command == "PRO" then
                local limit
                if exec_all[3] then
                    limit = tonumber(exec_all[3])
                else
                    limit = 10
                end
                if exec_all[2] then
                    local counter
                    for counter = 0,limit do
                        add_outline(data, counter.." x "..tonumber(exec_all[2]).." = "..counter*tonumber(exec_all[2]))
                    end
                end








----------------------------------------------------------
			elseif exec_command == "WHERE" then
                local pos = sender:getpos()
                add_outline(data, "Current Position: (x="..math.floor(pos.x)..", y="..math.floor(pos.y)..", z="..math.floor(pos.z)..")")
----------------------------------------------------------
			elseif exec_command == "WHO" then
				if not exec_all[2] then
                    add_outline(data, "Connected Players:")
                    for _,player in ipairs(minetest.get_connected_players()) do
                        local name = player:get_player_name()
                        add_outline(data, name)
                    end
                else
                    add_outline(data, sender:get_player_name())
                end
----------------------------------------------------------
			elseif exec_command == "MT" then
                add_outline(data, dump(minetest))
----------------------------------------------------------
			elseif exec_command == "QUIT" then
				data.outlines = nil  -- reset screen
				mtos:set_app()  -- quit app (if in app mode)
----------------------------------------------------------
			elseif exec_command == "REBOOT" then
				mtos:power_on()  -- reboots computer
----------------------------------------------------------
			elseif exec_command == "CLS" then
				data.outlines = {}
----------------------------------------------------------
			elseif exec_command == "DATE" then
				add_outline(data, os.date("%I:%M:%S %p, %A %B %d, %Y"))
----------------------------------------------------------
			elseif exec_command == "HELP" then
				local help_command = exec_all[2]
				if not help_command then -- no argument, print all
					add_outline(data, 'These shell commands are defined internally.')
					add_outline(data, '')
					local help_sorted = {}
					for k, v in pairs(help_texts) do
						if not mtos.os_attr.blacklist_commands[k] then
							table.insert(help_sorted, k.."    "..v)
						end
					end
					table.sort(help_sorted)
					for _, kv in ipairs(help_sorted) do
						add_outline(data, kv)
					end
				else
					help_command = help_command:upper()
					local help_text
					if mtos.os_attr.blacklist_commands[help_command] then
						help_text = "?NOT IMPLEMENTED ERROR"
					else
						help_text = help_texts[help_command] or "?  NO HELP IS AVAILABLE FOR THAT TOPIC"
					end
					add_outline(data, help_command:upper().. "    "..help_text)
				end
			elseif is_executable_app(mtos, laptop.apps[exec_command:lower()]) then
				mtos:set_app(exec_command:lower())
			else
				add_outline(data, "-lux: "..exec_command..": command not found")
			end
			if data.outlines then
				add_outline(data, '')
			end
		end
	end,

appwindow_formspec_func = function(...)
	--re-use the default launcher theming
	return laptop.apps["launcher"].appwindow_formspec_func(...)
end,
})
