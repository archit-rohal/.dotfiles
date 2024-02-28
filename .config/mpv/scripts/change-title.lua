function set_osd_title()
    local name = ""
    local percent_pos = ""
    local chapter = ""
    local total_time = ""

    if mp.get_property_osd("percent-pos") ~= "" then
        percent_pos = " • " .. mp.get_property_osd("percent-pos") .. "% completed"
    end

    if mp.get_property_osd("chapter") ~= "" then
        chapter = " • Chapter: " .. mp.get_property_osd("chapter")
    end

    local duration = mp.get_property("duration")
    if duration ~= nil then
        local total_seconds = tonumber(duration)
        local hours = math.floor(total_seconds / 3600)
        local minutes = math.floor((total_seconds % 3600) / 60)
        local seconds = math.floor(total_seconds % 60)
        total_time = string.format(" • %02d:%02d:%02d", hours, minutes, seconds)
    end

    mp.set_property("force-media-title", name .. percent_pos .. chapter .. total_time)
end

mp.observe_property("percent-pos", "number", set_osd_title)
mp.observe_property("chapter", "string", set_osd_title)
mp.observe_property("duration", "string", set_osd_title)
