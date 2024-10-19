-- Schema: 
--   CREATE TABLE "scores" ("game_id" TEXT, "score" INT);
--   CREATE TABLE "results" ("game_id" TEXT, "property" TEXT, "result" TEXT);

-- Task: Given the data in the "scores" table, update the "result" field in the "results" table.

update results
set result=(select group_concat(score, ',')
            from scores
            where game_id=results.game_id)
where property='scores';

update results
set result=(select first_value(score) over (order by rowid desc)
            from scores
            where game_id=results.game_id)
where property='latest';

update results
set result=(select first_value(score) over (order by score desc)
            from scores
            where game_id=results.game_id)
where property='personalBest';

update results
set result=(select group_concat(score, ',')
            from (
                select score
                from scores
                where game_id=results.game_id
                order by score desc
                limit 3
             ))
where property='personalTopThree';
