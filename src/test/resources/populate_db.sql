-- Вставка працівників
INSERT INTO worker (NAME, BIRTHDAY, LEVEL, SALARY) VALUES
                                                       ('John Doe', '1990-01-01', 'Trainee', 800),
                                                       ('Jane Doe', '1985-02-15', 'Junior', 1200),
                                                       ('Bob Smith', '1980-05-20', 'Middle', 3000),
                                                       ('Alice Johnson', '1975-08-10', 'Senior', 6000),
                                                       ('Charlie Brown', '1995-04-30', 'Trainee', 900),
                                                       ('Eva Green', '1992-11-18', 'Junior', 1500),
                                                       ('David White', '1988-07-05', 'Middle', 3500),
                                                       ('Grace Davis', '1983-03-22', 'Senior', 7000),
                                                       ('Tom Black', '1998-09-15', 'Trainee', 950),
                                                       ('Emily Wilson', '1994-06-08', 'Junior', 1300);

-- Вставка клієнтів
INSERT INTO client (NAME) VALUES
                              ('Client A'),
                              ('Client B'),
                              ('Client C'),
                              ('Client D'),
                              ('Client E');

-- Вставка проєктів
INSERT INTO project (CLIENT_ID, START_DATE, FINISH_DATE) VALUES
                                                             (1, '2022-01-01', '2023-01-01'),
                                                             (2, '2022-02-01', '2022-08-01'),
                                                             (3, '2022-03-01', '2022-10-01'),
                                                             (4, '2022-04-01', '2023-04-01'),
                                                             (5, '2022-05-01', '2022-12-01'),
                                                             (1, '2022-06-01', '2023-06-01'),
                                                             (2, '2022-07-01', '2023-02-01'),
                                                             (3, '2022-08-01', '2022-11-01'),
                                                             (4, '2022-09-01', '2023-09-01'),
                                                             (5, '2022-10-01', '2023-03-01');

-- Вставка працівників на проєкти
INSERT INTO project_worker (PROJECT_ID, WORKER_ID) VALUES
                                                       (1, 1), (1, 2), (1, 3), (1, 4),
                                                       (2, 2), (2, 3), (2, 5),
                                                       (3, 4), (3, 5), (3, 6),
                                                       (4, 6), (4, 7), (4, 8),
                                                       (5, 8), (5, 9), (5, 10),
                                                       (6, 1), (6, 2), (6, 4),
                                                       (7, 3), (7, 4), (7, 6),
                                                       (8, 5), (8, 7), (8, 8),
                                                       (9, 9), (9, 10), (9, 1),
                                                       (10, 2), (10, 5), (10, 9);