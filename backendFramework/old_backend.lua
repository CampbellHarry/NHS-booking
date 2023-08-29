-- made and maintained by https://github.com/3zia
--[[
======================== ZIAV SOFTWARE, OPEN-SOURCE ========================

Purpose: Handle backend of the NHS booking/triage knit

Date of Creation: 11/08/2023
Works ig.
============================================================================
]]



--[[ TODO:
- database management - JSON
- request handling from client
- security stuffs - idea on this we can have some sort of sesh authenticator like a token
- debugging, lots of debugging
]]



-- defining the libraries this needs to function
local server = require("http")
local json = require("json")
-- end of libraries this needs to function


-- global variables, ok
local booking_database = nil
local token_cache = {}
-- end of global variables


-- useful functions, ok
function write_json(to_encode : String, filename : String)
    local path = system.pathForFile(filename, system.DocumentsDirectory)
    local file = io.open(path, "w")

    if file ~= nil then
        local to_write = json.encode(to_encode)
        file:write(to_write)
        io.close(file)
        return true
    else
        return false
    end
end
function read_json(filename : String)
    local path = system.pathForFile(filename, system.DocumentsDirectory)
    local contents = ""
    local returned_table = {}
    local file = io.open(path, "r")

    if file == nil then 
        return nil 
    end

    local contents = file:read("*a")
    returned_table = json.decode(contents)
    io.close(file)
    return returned_table
end
function wait(n : Number)
    if n > 0 then 
        os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") 
    end
end
function split(pString : String, pPattern : String)
    local Table = {}
    local fpat = "(.-)" .. pPattern
    local last_end = 1
    local s, e, cap = pString:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(Table,cap)
        end
       last_end = e+1
       s, e, cap = pString:find(fpat, last_end)
    end
    if last_end <= #pString then
       cap = pString:sub(last_end)
       table.insert(Table, cap)
    end
    return Table
end
function clamp(value : Number, min : Number, max : Number)
    if value >= max then
        return max
    elseif value <= min then
        return min
    else
        return value
    end
end
-- end of useful functions


-- some test functions, ok
function append_to_db(tab)
    local last = read_json("database.json")
    local new = table.insert(last, tab)
    write_json(new, "database.json")
    return
end



function test_input()
    --[[
    "job_id": 2,
        "name": "Joe Mama",
        "hospital": "James Cook Hospital",
        "severity": 3,
        "emergency": true,
        "symptoms": ["Confusion","Delusion","Psychopathy"],
        "ailments": ["Concussion"],
        "ems_info": {
            "responding_unit": {
                "station": "NEAS Newcastle",
                "unit_num": 1
            }
        }
    ]]

    local test_format = {
        job_id = 3,
        name = "person personson",
        hospital = "squidward community hospice",
        severity = 1,
        emergency = false,
        symptoms = {"Pain"},
        ailments = {"Broken Bone"},
        ems_info = {
            responding_unit = {
                station = "ambulance station #1",
                unit_num = 1,
            },
        },
    }

    
end
-- end of some test functions