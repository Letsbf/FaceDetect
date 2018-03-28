package helper;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class SqlSessionHelper {
    private static final String resource = "mybatis-config.xml";

    private static SqlSessionFactory sqlSessionFactory;

    public static SqlSessionFactory openSqlSessionFactory() {
        if (sqlSessionFactory == null) {
            InputStream inputStream = null;
            try {
                inputStream = Resources.getResourceAsStream(resource);
                return new SqlSessionFactoryBuilder().build(inputStream);
            } catch (Exception e) {

            }
        }
        return sqlSessionFactory;
    }

    public static org.apache.ibatis.session.SqlSession openSqlSession() {
        return openSqlSessionFactory().openSession();
    }
}
