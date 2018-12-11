package com.oss.service;

import com.oss.dao.RoleDao;
import com.oss.domain.Role;
import com.oss.domain.RoleAction;
import com.oss.domain.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService {
    @Autowired
    RoleDao roleDao;
    public int adduserrole(UserRole userrole){
        return roleDao.adduserrole(userrole);
    }
    public List<Role> findrole(){ return roleDao.findrole();}
    public int addroleaction(RoleAction roleAction){
        return roleDao.addroleaction(roleAction);
    }
    public int delroleaction(RoleAction roleAction){
        return roleDao.delroleaction(roleAction);
    }
}
