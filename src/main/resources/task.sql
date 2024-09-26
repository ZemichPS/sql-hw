-- Вывести к каждому самолету класс обслуживания и количество мест этого класса
SELECT aircrafts_data.aircraft_code,
       model,
       range,
       fare_conditions,
       count(seat_no)
FROM aircrafts_data
         INNER JOIN seats
                    ON bookings.aircrafts_data.aircraft_code = bookings.seats.aircraft_code
group by aircrafts_data.aircraft_code,
         model,
         range,
         fare_conditions;

-- Найти 3 самых вместительных самолета (модель + кол-во мест)
select model,
       count(seats.seat_no) count_seats
FROM aircrafts_data
         INNER JOIN seats
                    ON bookings.aircrafts_data.aircraft_code = bookings.seats.aircraft_code
group by model
order by count_seats DESC
limit 3;

-- Вывести код, модель самолета и места не эконом класса для самолета 'Аэробус A321-200' с сортировкой по местам
SELECT aircrafts_data.aircraft_code,
       model,
       seat_no
FROM aircrafts_data
         INNER JOIN seats
                    ON bookings.aircrafts_data.aircraft_code = bookings.seats.aircraft_code
WHERE fare_conditions not LIKE 'Economy'
  AND model::text LIKE '%Аэробус A321-200%';


-- Вывести города в которых больше 1 аэропорта (код аэропорта, аэропорт, город)
SELECT airport_code,
       airport_name,
       city
FROM airports_data
    where city->>'ru' in (
        SELECT city->>'ru'
        FROM airports_data
        GROUP BY city->>'ru'
        HAVING COUNT(city) > 1)


-- Найти ближайший вылетающий рейс из Екатеринбурга в Москву, на который еще не завершилась регистрация

-- Вывести самый дешевый и дорогой билет и стоимость (в одном результирующем ответе)

-- Вывести информацию о вылете с наибольшей суммарной стоимостью билетов

-- Найти модель самолета, принесшую наибольшую прибыль (наибольшая суммарная стоимость билетов). Вывести код модели, информацию о модели и общую стоимость

-- Найти самый частый аэропорт назначения для каждой модели самолета. Вывести количество вылетов, информацию о модели самолета, аэропорт назначения, город
