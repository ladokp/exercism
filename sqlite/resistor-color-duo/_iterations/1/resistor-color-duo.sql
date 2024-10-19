-- Schema: CREATE TABLE "color_code" ("color1" TEXT, "color2" TEXT, "result" INT);
-- Task: update the color_code table and set the result based on the two colors.

CREATE TABLE encoding (color TEXT, code INT);
INSERT INTO encoding (color, code) VALUES
    ("black", 0),
    ("brown", 1),
    ("red", 2),
    ("orange", 3),
    ("yellow", 4),
    ("green", 5),
    ("blue", 6),
    ("violet", 7),
    ("grey", 8),
    ("white", 9);

UPDATE color_code
SET   result = 10 * e1.code + e2.code
FROM  encoding e1 INNER JOIN encoding e2
WHERE e1.color = color_code.color1
AND   e2.color = color_code.color2;