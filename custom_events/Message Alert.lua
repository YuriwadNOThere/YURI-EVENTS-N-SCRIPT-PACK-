function onEvent(name, value1, value2)
    if name == 'Message Alert' then
        addHaxeLibrary("Application", "lime.app")
        runHaxeCode([[
            Application.current.window.alert("]]..value2..[[", "]]..value1..[[");
        ]])
    end
end
--Event by RealReal