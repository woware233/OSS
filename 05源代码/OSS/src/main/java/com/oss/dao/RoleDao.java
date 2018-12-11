package com.oss.dao;

import com.oss.domain.Role;
import com.oss.domain.RoleAction;
import com.oss.domain.UserRole;

import java.util.List;

public interface RoleDao {
    List<Role> findrole();
    int adduserrole(UserRole userrole);
    int addroleaction(RoleAction roleAction);
    int delroleaction(RoleAction roleAction);
}
