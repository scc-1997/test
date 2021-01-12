import java.sql.*;

public class TestJDBC {
    public static void main(String[] args)
            throws ClassNotFoundException, SQLException {
        //通过java访问mysql数据库，查询
        //这个对象获取数据库链接
        //注册驱动，输入链接地址，用户名，密码
        String driver = "com.mysql.cj.jdbc.Driver";
        //访问本机的mysql数据库，端口3307，数据库名
        String url = "jdbc:mysql://localhost:3307/mysql-db" +
                "?serverTimezone=Asia/Shanghai";
        String username = "root";
        String password = "root";

        Class.forName(driver);
        //获取到数据库链接
        Connection cn = DriverManager.getConnection(url, username, password);
        //创建一个Statement语句对象
        Statement stat = cn.createStatement();
        //执行SQL语句
        String sql = "select * from student";
        //把查询的结果（表记录）存放到ResultSet对象中，结果集
        ResultSet rs = stat.executeQuery(sql);

        //获取这个表有几个字段，元数据（描述数据的数据）
        int cols = rs.getMetaData().getColumnCount();
        System.out.println("表的列数：" + cols);

        //展示表的字段名称
        // 索引值是从1开始（数据库要求）
        for(int i=1; i<=cols; i++){
            //\t转义，代表tab键，多个空格
            System.out.print( rs.getMetaData().getColumnName(i) +"\t");
        }
        System.out.println();

        //展示数据，行数while循环，next()取下一条记录，如果没有，循环就结束
        //next()有记录就返回true，如果到最后面了，返回false
        while(rs.next()){
            for(int i=1; i<=cols; i++){
                //获取它的字段内容
                System.out.print( rs.getString(i) +"\t");
            }
            System.out.println();   //换行
        }
    }
}
