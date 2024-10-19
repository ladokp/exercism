-- Schema: CREATE TABLE "allergies" ("task" TEXT, "item" TEXT, "score" INT NOT NULL, "result" TEXT);
-- Task: update the bob allergies and set the result based on the task.
--       - The `allergicTo` task expects `true` or `false` based on the `score` and the `item` fields.
--       - For the `list` task you have to write corresponding items to the result field
CREATE TABLE codes(item TEXT, code INTEGER);
INSERT INTO codes (item, code) VALUES
    ('eggs', 1),
    ('peanuts', 2),
    ('shellfish', 4),
    ('strawberries', 8),
    ('tomatoes', 16),
    ('chocolate', 32),
    ('pollen', 64),
    ('cats', 128);

UPDATE allergies
SET result = (
    SELECT result
    FROM (
        SELECT CASE WHEN score & code == code THEN 'true' ELSE 'false' END AS result
        FROM (
            SELECT code
            FROM codes
            WHERE codes.item == allergies.item
        )
WHERE task == 'allergicTo'));

UPDATE allergies
SET result =
    (SELECT CASE score WHEN 0 THEN '' ELSE group_concat(item ,', ') END
    FROM codes
    WHERE score & code == code)
WHERE task == 'list'
