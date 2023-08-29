'''
========================  OPEN-SOURCE WOO YEAH WOO  ========================

Purpose: Handle backend of the NHS booking/triage knit

Date of Creation: 11/08/2023

we really cannot take chances with the lives of patients.
me and the creator of this system wish to help spur on change at some point in terms of better systems for the NHS.

the backend is made and maintained by https://github.com/3zia, as a preface python isnt my strongest programming language, but i sure did try here
============================================================================

███    ██ ██   ██ ███████     ████████ ██████  ██  █████   ██████  ███████     ███████ ██    ██ ███████ 
████   ██ ██   ██ ██             ██    ██   ██ ██ ██   ██ ██       ██          ██       ██  ██  ██      
██ ██  ██ ███████ ███████        ██    ██████  ██ ███████ ██   ███ █████       ███████   ████   ███████ 
██  ██ ██ ██   ██      ██        ██    ██   ██ ██ ██   ██ ██    ██ ██               ██    ██         ██ 
██   ████ ██   ██ ███████        ██    ██   ██ ██ ██   ██  ██████  ███████     ███████    ██    ███████ 
cheesy ascii art

============================================================================
]]




--[[ TODO:
- database management - JSON
- request handling from client
- security stuffs - idea on this we can have some sort of sesh authenticator like a token
- debugging, lots of debugging
'''

# import stuff
import sqlite3

# i do this "#end" thing to keep track of indents
def json_read():
    PLACEHOLDER=1
#end

def json_write():
    PLACEHOLDER=1
#end

def test():
    connection = sqlite3.connect("database.sql")
    cursor = connection.cursor()
    cursor.execute("CREATE TABLE fish (name TEXT, species TEXT, tank_number INTEGER)")
    cursor.execute("INSERT INTO fish VALUES ('Sammy', 'shark', 1)")
    cursor.execute("INSERT INTO fish VALUES ('Jamie', 'cuttlefish', 7)")
    rows = cursor.execute("SELECT name, species, tank_number FROM fish").fetchall()
    print(rows)
#end