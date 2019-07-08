package com.sy.service.zzy;

import com.sy.mapper.zzy.UserMapperzzy;
import com.sy.model.common.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class UserServicezzyImpl implements UserzzyService {

    @Autowired
    private UserMapperzzy mapper;

    @Override
    public List<User> getUserList(User user, Integer starNum, Integer pageSize) throws Exception {
        System.out.println(starNum);
        System.out.println(pageSize);
        return mapper.getUserList(user,starNum,pageSize);
    }

    @Override
    public List<User> getUserListBySearch(User user) throws Exception {
        return mapper.getUserListBySearch(user);
    }

    @Override
    public User getLoginUser(User user) throws Exception {
        return mapper.getLoginUser(user);
    }

    @Override
    public User getUserById(User user) throws Exception {

        System.out.println(user+"aaaa");
        return mapper.getUserById(user);
    }

    @Override
    public User getUserById(String loginCode) throws Exception {
        return mapper.getUserByName(loginCode);
    }


    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int addUser(User user) throws Exception {
        return mapper.addUser(user);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int modifyUser(User user) {

        System.out.println(user.getId()+"ccccc");
        return mapper.modifyUser(user);
    }
    
    
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int modifyPwd(User user) {

        System.out.println(user.getPassword()+"aaaaa");
        System.out.println(user.getId()+"bbbbbbb");
        return mapper.modifyPwd(user);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int savesecondpwd(User user) {
        System.out.println(user.getPassword2()+"aaaaa");
        System.out.println(user.getId()+"bbbbbbb");
        return mapper.savesecondpwd(user);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int modifyUserRole(User user) {
        return mapper.modifyUserRole(user);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int delUserPic(User user) {
        return mapper.delUserPic(user);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    @Override
    public int deleteUser(User user) {
        System.out.println("333"+user);
        System.out.println(user.getId()+"+++");
        return mapper.deleteUser(user);
    }

    @Override
    public int count(User user) throws Exception {
        return mapper.count(user);
    }

    @Override
    public int loginCodeIsExit(User user) throws Exception {
        return mapper.loginCodeIsExit(user);
    }
}
