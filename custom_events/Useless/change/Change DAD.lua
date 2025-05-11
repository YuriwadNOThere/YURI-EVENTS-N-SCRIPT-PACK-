function onEvent(name, value1, value2)
    if name == 'Change DAD' then
        triggerEvent('Change Character', 'dad', value1)
    end
end
