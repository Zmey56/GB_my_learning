DROP TABLE IF EXISTS distances;
CREATE TABLE distances (
  id SERIAL PRIMARY KEY,
  x1 INT NOT NULL,
  y1 INT NOT NULL,
  x2 INT NOT NULL,
  y2 INT NOT NULL,
  distance DOUBLE AS (SQRT(POW(x1 - x2, 2) + POW(y1 - y2, 2)))
) COMMENT = 'Расстояние между двумя точками';

INSERT INTO distances
  (x1, y1, x2, y2)
VALUES
  (1, 1, 4, 5),
  (4, -1, 3, 2),
  (-2, 5, 1, 3);

DROP TABLE IF EXISTS distances;
CREATE TABLE distances (
  id SERIAL PRIMARY KEY,
  a JSON NOT NULL,
  b JSON NOT NULL,
  distance DOUBLE AS (SQRT(POW(a->>'$.x' - b->>'$.x', 2) + POW(a->>'$.y' - b->>'$.y', 2)))
) COMMENT = 'Расстояние между двумя точками';

INSERT INTO distances
  (a, b)
VALUES
  ('{"x": 1, "y": 1}', '{"x": 4, "y": 5}'),
  ('{"x": 4, "y": -1}', '{"x": 3, "y": 2}'),
  ('{"x": -2, "y": 5}', '{"x": 1, "y": 3}');

DROP TABLE IF EXISTS triangles;
CREATE TABLE triangles (
  id SERIAL PRIMARY KEY,
  a DOUBLE NOT NULL COMMENT 'Сторона треугольника',
  b DOUBLE NOT NULL COMMENT 'Сторона треугольника',
  angle INT NOT NULL COMMENT 'Угол треугольника в градусах',
  square DOUBLE AS (a * b * SIN(RADIANS(angle)) / 2.0)
) COMMENT = 'Площадь треугольника';

INSERT INTO
  triangles (a, b, angle)
VALUES
  (1.414, 1, 45),
  (2.707, 2.104, 60),
  (2.088, 2.112, 56),
  (5.014, 2.304, 23),
  (3.482, 4.708, 38);

DROP TABLE IF EXISTS rainbow;
CREATE TABLE rainbow (
  id SERIAL PRIMARY KEY,
  color VARCHAR(255)
) COMMENT = 'Цвета радуги';

INSERT INTO
  rainbow (color)
VALUES
  ('red'),
  ('orange'),
  ('yellow'),
  ('green'),
  ('blue'),
  ('indigo'),
  ('violet');

SELECT
  CASE
    WHEN color = 'red' THEN 'красный'
    WHEN color = 'orange' THEN 'оранжевый'
    WHEN color = 'yellow' THEN 'желтый'
    WHEN color = 'green' THEN 'зеленый'
    WHEN color = 'blue' THEN 'голубой'
    WHEN color = 'indigo' THEN 'синий'
    ELSE 'фиолетовый'
  END AS russian
FROM
  rainbow;
