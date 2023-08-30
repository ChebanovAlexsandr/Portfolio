


CREATE TABLE client (
  id NOT NULL,
  ferst_name varchar NOT NULL,
  last_name varchar,
  PRIMARY KEY(id)
  );


CREATE TABLE apartment (
  id NOT NULL,
  address varchar,
  rooms varchar ,
  PRIMARY KEY(id)
  );
  
CREATE TABLE view (
  id NOT NULL,
  apartment_id,
  client_id,
  date  not NULL,
  PRIMARY KEY(id)
  );


SELECT c.last_name
FROM client AS c
JOIN view AS v ON c.id = v.client_id
JOIN apartament AS a ON v.apartament_id = a.id
WHERE a.rooms = 3
GROUP BY c.last_name
HAVING COUNT(a.id) >=2
