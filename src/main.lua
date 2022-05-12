function initUi()
    colors = {["Black"] = 0x000000, ["Green"] = 0x008000, ["Light Blue"] = 0x00c0ff, ["Light Green"] = 0x00ff00, ["Blue"] = 0x3333cc, ["Gray"] = 0x808080, ["Red"] = 0xff0000, ["Magenta"] = 0xff00ff, ["Orange"] = 0xff8000, ["Yellow"] = 0xffff00, ["White"] = 0xffffff}
    thicknesses = {"Very Fine", "Fine", "Medium", "Thick", "Very Thick"}
    pen_types = {"Standard", "Dashed", "Dashed-Dotted", "Dotted"}
    eraser_types = {"Standard", "Whiteout", "Delete Stroke"}
    keys = "qwertyuiopasdfghjklzxcvbnm!@#$%^&*()"
    i = 1

    for c,h in pairs(colors) do
        str = "Change Color to " .. c
        global pass = h
        app.registerUi({["menu"] = str, ["callback"] = changeColor(), ["accelerator"] = "<Control><Alt><Shift>" .. keys:sub(i,i)})
        i = i + 1
    end
    for n,t in ipairs(thicknesses) do
        str = "Change Pen Thickness to " .. t
        global pass = n
        app.registerUi({["menu"] = str, ["callback"] = "changePenThickness", ["accelerator"] = "<Control><Alt><Shift>" .. keys:sub(i,i)})
        i = i + 1
    end
    for n,t in ipairs(thicknesses) do
        str = "Change Eraser Thickness to " .. t
        global pass = n
        app.registerUi({["menu"] = str, ["callback"] = "changeEraserThickness", ["accelerator"] = "<Control><Alt><Shift>" .. keys:sub(i,i)})
        i = i + 1
    end
    for n,ty in ipairs(pen_types) do
        str = "Change Pen Type to " .. ty
        global pass = n
        app.registerUi({["menu"] = str, ["callback"] = "changePenType", ["accelerator"] = "<Control><Alt><Shift>" .. keys:sub(i,i)})
        i = i + 1
    end
    for n,ty in ipairs(eraser_types) do
        str = "Change Eraser Type to " .. ty
        global pass = n
        app.registerUi({["menu"] = str, ["callback"] = "changeEraserType", ["accelerator"] = "<Control><Alt><Shift>" .. keys:sub(i,i)})
        i = i + 1
    end
end

-- Callback if the menu item is executed
function changeColor()
    app.changeToolColor({["color"] = pass, ["selection"] = true})
end

function changePenThickness()
    a = {"VERY_FINE","FINE","MEDIUM","THICK","VERY_THICK"}
    app.uiAction({["action"]="ACTION_TOOL_PEN_SIZE_" .. a[pass]})
end

function changeEraserThickness()
    a = {"VERY_FINE","FINE","MEDIUM","THICK","VERY_THICK"}
    app.uiAction({["action"]="ACTION_TOOL_ERASER_SIZE_" .. a[pass]})
end

function changePenType()
    a = {"PLAIN","DASH","DASH_DOT","DOT"}
    app.uiAction({["action"]="ACTION_TOOL_LINE_STYLE_" .. a[pass]})
end

function changeEraserType()
    a = {"STANDARD","DELETE_STROKE","WHITEOUT"}
    app.uiAction({["action"]="ACTION_TOOL_ERASER_" .. a[pass]})
end