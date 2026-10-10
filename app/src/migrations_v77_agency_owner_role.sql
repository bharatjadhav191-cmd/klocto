-- V77: Existing tenant owner accounts were previously represented as agency_admin.
-- Upgrade only the first/oldest agency_admin per agency to agency_owner; remaining
-- agency_admin users remain team admins and do not receive owner privileges.
WITH ranked AS (
  SELECT id, agency_id,
         ROW_NUMBER() OVER (PARTITION BY agency_id ORDER BY id ASC) AS rn
  FROM users
  WHERE role = 'agency_admin' AND agency_id IS NOT NULL
)
UPDATE users AS u
SET role = 'agency_owner'
FROM ranked AS r
WHERE u.id = r.id AND r.rn = 1;
