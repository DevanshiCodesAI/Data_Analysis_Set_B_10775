-- S2a

SELECT
    department,
    ROUND(AVG(resolution_hours),2) AS avg_resolution_hours
FROM tickets t
JOIN teams tm
ON t.team_id = tm.team_id
GROUP BY department
ORDER BY avg_resolution_hours DESC;

-- S2b

SELECT
    tm.team,
    ROUND(AVG(t.resolution_hours),2) AS avg_resolution_hours
FROM tickets t
JOIN teams tm
ON t.team_id = tm.team_id
GROUP BY tm.team
HAVING AVG(t.resolution_hours) > 24;


-- S2c

SELECT
    channel,
    COUNT(*) AS breach_count
FROM tickets
WHERE resolution_hours > 24
GROUP BY channel
ORDER BY breach_count DESC, channel ASC
LIMIT 2;

-- S3

SELECT
    tm.team_id,
    tm.team,
    t.ticket_id
FROM teams tm
LEFT JOIN tickets t
ON tm.team_id = t.team_id
WHERE t.team_id IS NULL;