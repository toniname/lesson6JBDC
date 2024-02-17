package org.example;
import java.util.logging.Logger;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
public class DatabaseInitService {

    Logger logger = Logger.getLogger(getClass().getName());
    public static void main(String[] args) {
        try {
            // Отримуємо підключення до бази даних
            Connection connection = Database.getInstance().getConnection();

            // Зчитуємо SQL-запити з файлу
            String sqlScript = readSqlScript("C:\\Users\\Toni\\IdeaProjects\\Lesson6JDBC\\src\\test\\resources\\init_db.sql");

            // Виконуємо запити
            executeSqlScript(connection, sqlScript);

            Logger.getLogger("Database initialized successfully.");
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    private static String readSqlScript(String filePath) throws IOException {
        // Зчитуємо вміст SQL-скрипту з файлу
        Path path = Path.of(filePath);
        return Files.readString(path);
    }

    private static void executeSqlScript(Connection connection, String sqlScript) throws SQLException {
        try (Statement statement = connection.createStatement()) {
            // Розділяємо SQL-скрипт на окремі запити
            String[] queries = sqlScript.split(";");

            // Виконуємо кожен окремий запит
            for (String query : queries) {
                statement.addBatch(query.trim());
            }

            // Виконуємо всі пакетні запити
            statement.executeBatch();
        }
    }
}

