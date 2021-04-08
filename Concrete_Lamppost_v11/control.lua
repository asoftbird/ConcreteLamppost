function BuiltEntity(event)
--	game.players[1].print("builtentity")


	if event.created_entity.name == "concrete-lamppost" then
		local e = event.created_entity
		local s = e.surface
		local X = e.position.x
		local Y = e.position.y
    local l = s.create_entity{name = "concrete-lamp", position = {X,Y}, force= game.forces.neutral}
		l.destructible = false
	end

end


function MinedEntity(event)
	if event.entity.name == "concrete-lamppost" then
	local b = event.entity
	local X = b.position.x
	local Y = b.position.y
	lamp = b.surface.find_entity("concrete-lamp",{X, Y})
	if lamp ~= nil then
		lamp.destroy()	end
	end

end


script.on_event(defines.events.on_built_entity, BuiltEntity)
script.on_event(defines.events.on_robot_built_entity, BuiltEntity)
script.on_event(defines.events.on_pre_player_mined_item , MinedEntity)
script.on_event(defines.events.on_entity_died , MinedEntity)
script.on_event(defines.events.on_robot_pre_mined  , MinedEntity)
