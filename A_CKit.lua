-- VALUES --

cellSize = 32

--///////////--
function findNearest(mapT, whatT, whereX, whereY)
    local signId = 1
    local positions = {}

    local mapWidth = #mapT
    local mapHeight = #mapT[1]

    local maxDistance = math.max(mapWidth, mapHeight)

    for distance = 0, maxDistance do
        for x = whereX - distance, whereX + distance do
            for y = whereY - distance, whereY + distance do

                if math.max(math.abs(x - whereX), math.abs(y - whereY)) == distance then
                    if mapT[x] and mapT[x][y] then
                        if mapT[x][y].type == whatT then
                            positions[signId] = { x = x, y = y }

                            print("positions =", positions[signId].x, positions[signId].y)

                            signId = signId + 1
                        end
                    end
                end
            end
        end

        if #positions > 0 then
            return positions[1]
        end
    end

    return nil
end

--//////////--

function setRandomMap(whichMap, mapHeight, mapWidth)
    for x = 1, mapWidth do
        map[x] = {}
        for y = 1, mapHeight do
            map[x][y] = {heat = math.random(1, 255)}
        end
    end
end

function drawMap(map)
    for x = 1, #map do
        for y = 1, #map[x] do
            love.graphics.rectangle("fill", x * cellSize, y * cellSize, cellSize, cellSize)
        end
    end
end
