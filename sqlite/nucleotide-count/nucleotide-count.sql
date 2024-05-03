-- Task:  - Update the "nucleotide-count" table and set the result based on the input field.
--        - Update table creation with constraints.

DROP TABLE IF EXISTS "nucleotide-count";
CREATE TABLE "nucleotide-count" (
    "strand" TEXT,
    "result" TEXT,
    CHECK  (1 > LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(strand, 'A', ''), 'C', ''), 'G', ''), 'T', '')))
);

-- Please don't change the following two import lines:
.mode csv
.import ./data.csv "nucleotide-count"

UPDATE "nucleotide-count"
SET result = (
    SELECT json(' { "A": ' || a || ', "C": ' || c || ', "G": ' || g || ', "T": ' || t || ' } ')
    FROM (
    SELECT 
        strand,
        LENGTH(strand) - LENGTH(REPLACE(strand, 'A', '')) a,
        LENGTH(strand) - LENGTH(REPLACE(strand, 'C', '')) c,
        LENGTH(strand) - LENGTH(REPLACE(strand, 'G', '')) g,
        LENGTH(strand) - LENGTH(REPLACE(strand, 'T', '')) t
    FROM "nucleotide-count"        
) counts
    WHERE "nucleotide-count".strand == counts.strand
);
