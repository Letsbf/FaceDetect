package dao.impl;

import dao.AdminDao;
import domain.Admin;
import helper.SqlSessionHelper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class AdminDaoImpl implements AdminDao{
    @Override
    public Admin selectAdmin(String username) {
        SqlSession sqlSession = SqlSessionHelper.openSqlSession();
        Admin admin = sqlSession.selectOne("mapper.adminMapper.selectAdmin");
        return admin;
    }
}
