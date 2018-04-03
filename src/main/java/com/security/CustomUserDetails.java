package com.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;
import com.domain.User;

public class CustomUserDetails implements UserDetails {

	private static final long serialVersionUID = 1L;

	private User user;
	private List<String> userRoles;

	public CustomUserDetails() {
	}

	public CustomUserDetails(User user, List<String> userRoles) {
		this.user = user;
		this.userRoles = userRoles;
	}

	@Override
	public String getUsername() {
		return user.getUserName();
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		String roles = StringUtils.collectionToCommaDelimitedString(userRoles);
		List<GrantedAuthority> grantedAuthorities = AuthorityUtils.commaSeparatedStringToAuthorityList(roles);
		return grantedAuthorities;
	}

	// TODO Auto-generated method stub...:
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

}
