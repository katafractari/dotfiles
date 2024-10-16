-- Function to show a notification with a colored icon
function showTrafficNotification(message, color)
    -- Define paths to your colored icons based on traffic levels
    local iconPaths = {
        green = "/icons/green-square.png",
        yellow = "/icons/yellow-square.png",
        red = "/icons/red-square.png"
    }

    -- Select the icon path based on traffic level
    local icon = hs.configdir .. iconPaths[color] or nil

    -- Create the notification
    local notification = hs.notify.new({
        title = "Traffic",
        informativeText = message,
        contentImage = icon
    })

    -- Show the notification
    notification:send()
end

-- Function to get travel time with traffic and color code based on traffic level
function getTravelTimeWithTraffic(origin, destination, apiKey)
    -- Set up the API request URL
    local url = string.format(
        "https://maps.googleapis.com/maps/api/distancematrix/json?origins=%s&destinations=%s&departure_time=now&key=%s",
        hs.http.encodeForQuery(origin),
        hs.http.encodeForQuery(destination),
        apiKey
    )

    -- Make the HTTP request to Google Maps Distance Matrix API
    hs.http.asyncGet(url, nil, function(status, body, headers)
        if status ~= 200 then
            hs.alert.show("Error fetching data: " .. tostring(status))
            return
        end

        -- Parse the JSON response
        local data = hs.json.decode(body)
        if data.status ~= "OK" then
            hs.alert.show("Error in response: " .. data.status)
            return
        end

        local element = data.rows[1].elements[1]
        if not element.duration or not element.duration_in_traffic then
            hs.alert.show("Traffic data not available.")
            return
        end

        -- Extract durations
        local duration = element.duration.value -- Duration without traffic in seconds
        local durationInTraffic = element.duration_in_traffic.value -- Duration with traffic in seconds

        -- Determine color coding
        local color
        if durationInTraffic <= 1.05 * duration then
            color = "green" -- Low traffic
        elseif durationInTraffic <= 1.15 * duration then
            color = "yellow" -- Moderate traffic
        else
            color = "red" -- High traffic
        end

        local message = string.format(
            "%.0f minutes to Home",
            durationInTraffic / 60, color
        )

        showTrafficNotification(message, color)
    end)
end

-- Example usage
local origin = hs.settings.get('config').travel.origin
local destination = hs.settings.get('config').travel.destination
local googleApiKey = hs.settings.get('config').travel.googleApiKey

hs.hotkey.bind({"alt", "cmd", "shift"}, "h", function() getTravelTimeWithTraffic(origin, destination, googleApiKey) end)
