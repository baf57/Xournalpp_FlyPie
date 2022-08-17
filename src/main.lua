function initUi()
    local colors = {"Black", "Green", "Light Blue", "Light Green", "Blue", "Gray", "Red", "Magenta", "Orange", "Yellow", "White"}
    local thicknesses = {"Very Fine", "Fine", "Medium", "Thick", "Very Thick"}
    local pen_types = {"Standard", "Dashed", "Dashed-Dotted", "Dotted"}
    local eraser_types = {"Standard", "Whiteout", "Delete Stroke"}

    local arrays = {colors, thicknesses, thicknesses, pen_types, eraser_types}
    local callbacks = {"changeColor", "changePenThickness", "changeEraserThickness", "changePenType", "changeEraserType"}
    local strings = {"Change Pen Color to ", "Change Pen Thickness to ", "Change Eraser Thickness to ", "Change Pen Type to ", "Change Eraser Type to "}

    local keys = "qwertyuiopasdfghjklzxcvbnm"
    local mods = {"<Control><Alt><Shift>", "<Alt><Shift>", "<Control><Alt>"}
    local i = 1
    local j = 1

    for cind,cb in ipairs(callbacks) do
        for aind,option in ipairs(arrays[cind]) do
            -- This is ugly... but it's easier than the alternative
            if i == 4 && j == 1 then
                acc = mods[3] .. "m"
            else
                acc = mods[j] .. key:sub(i,i)
            end

            Pass = aind
            app.registerUi({["menu"] = strings[cind] .. option, ["callback"] = cb, ["accelerator"] = mods[j] .. keys:sub(i,i)})
            i = i + 1
            if i > #keys then
                i = 1
                j = j + 1
            end
        end
    end
end

-- Callbacks
function changeColor()
    local a = {0x000000, 0x008000, 0x00c0ff, 0x00ff00, 0x3333cc, 0x808080, 0xff0000, 0xff00ff, 0xff8000, 0xffff00, 0xffffff}
    app.changeToolColor({["color"] = a[Pass], ["selection"] = true})
end

function changePenThickness()
    local a = {"VERY_FINE","FINE","MEDIUM","THICK","VERY_THICK"}
    app.uiAction({["action"]="ACTION_TOOL_PEN_SIZE_" .. a[Pass]})
end

function changeEraserThickness()
    local a = {"VERY_FINE","FINE","MEDIUM","THICK","VERY_THICK"}
    app.uiAction({["action"]="ACTION_TOOL_ERASER_SIZE_" .. a[Pass]})
end

function changePenType()
    local a = {"PLAIN","DASH","DASH_DOT","DOT"}
    app.uiAction({["action"]="ACTION_TOOL_LINE_STYLE_" .. a[Pass]})
end

function changeEraserType()
    local a = {"STANDARD","DELETE_STROKE","WHITEOUT"}
    app.uiAction({["action"]="ACTION_TOOL_ERASER_" .. a[Pass]})
end