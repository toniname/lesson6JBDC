package org.example;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DatabaseQueryService {
    public List<MaxProjectCountClient> findMaxProjectsClient() {
        try {
            Connection connection = Database.getInstance().getConnection();
            String sqlQuery = readSqlScript();

            try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
                ResultSet resultSet = statement.executeQuery();
                return parseMaxProjectCountClients(resultSet);
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    private List<MaxProjectCountClient> parseMaxProjectCountClients(ResultSet resultSet) throws SQLException {
        List<MaxProjectCountClient> maxProjectCountClients = new ArrayList<>();
        while (resultSet.next()) {
            String name = resultSet.getString("name");
            int projectCount = resultSet.getInt("projectCount");
            maxProjectCountClients.add(new MaxProjectCountClient(name, projectCount));
        }
        return maxProjectCountClients;
    }

    private String readSqlScript() throws IOException {
        Path path = Path.of("C:\\Users\\Toni\\IdeaProjects\\Lesson6JDBC\\src\\test\\resources\\find_max_projects_client.sql");
        return Files.readString(path);
    }
}
