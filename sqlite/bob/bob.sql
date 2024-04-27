-- Schema: CREATE TABLE "bob" ("input" TEXT, "reply" TEXT);
-- Task: update the bob table and set the reply based on the input.
UPDATE bob SET reply = "Sure."
WHERE REPLACE(input, " ", "") LIKE "%?";
UPDATE bob SET reply = "Whoa, chill out!"
WHERE LOWER(input) != UPPER(input) AND input = UPPER(input);
UPDATE bob SET reply = "Calm down, I know what I'm doing!"
WHERE REPLACE(input, " ", "") LIKE "%?"
      AND LOWER(input) != UPPER(input) AND  input = UPPER(input);
UPDATE bob SET reply = "Fine. Be that way!" WHERE input REGEXP '^\s*$';
UPDATE bob SET reply = "Whatever." WHERE reply = "";
