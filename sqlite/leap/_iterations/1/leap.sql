-- Schema: CREATE TABLE "leap" ( "year" INT, "is_leap" BOOL);
-- Task: update the leap table and set the is_leap based on the year field.
UPDATE leap
set is_leap = mod(year, 4) = 0 
              and (mod(year, 100) <> 0 
                   or mod(year, 400) = 0)