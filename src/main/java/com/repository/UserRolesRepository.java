package com.repository;
import java.util.List;

import com.domain.UserRole;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRolesRepository extends CrudRepository<UserRole, Long> {

	@Query("SELECT a.role FROM UserRole a, User b WHERE b.userName=?1 AND a.userId=b.id")
    List<String> findRoleByUserName(String userName);

}