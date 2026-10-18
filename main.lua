--a file for functions tests

A_CKit = require("A_CKit")

mapHeight = 10
mapWidth = 10

map = {}

for x = 1, mapWidth do
    map[x] = {}

    for y = 1, mapHeight do
        map[x][y] = {
            type = nil
        }
    end
end

map[3][7].type = "blue"
map[2][2].type = "blue"

local nearest = findNearest(map, "blue", 7, 8)

if nearest then
    print("nearest:", nearest.x, nearest.y)
else
    print("nearest")
end
