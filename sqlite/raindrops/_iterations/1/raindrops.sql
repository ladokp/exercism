-- Schema: CREATE TABLE "raindrops" ("number" INT, "sound" TEXT);
-- Task: update the raindrops table and set the sound based on the number.
UPDATE raindrops
SET sound = CASE WHEN (CASE WHEN mod(number, 3) = 0 THEN "Pling" ELSE "" END
            || CASE WHEN mod(number, 5) = 0 THEN "Plang" ELSE "" END
            || CASE WHEN mod(number, 7) = 0 THEN "Plong" ELSE "" END) <> ""
            THEN (CASE WHEN mod(number, 3) = 0 THEN "Pling" ELSE "" END
            || CASE WHEN mod(number, 5) = 0 THEN "Plang" ELSE "" END
            || CASE WHEN mod(number, 7) = 0 THEN "Plong" ELSE "" END)
            ELSE number END