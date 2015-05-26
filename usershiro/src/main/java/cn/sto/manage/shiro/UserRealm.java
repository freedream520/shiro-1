package cn.sto.manage.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sto.manage.pojo.User;
import cn.sto.manage.service.UserService;
import cn.sto.manage.utils.CaptchaException;
import cn.sto.manage.utils.UsernamePasswordCaptchaToken;

@Service
public class UserRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 获取当前登陆用户 ，根据当前登陆用户，查询对应角色信息
		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();
		if(user.getLoginName().equals("staff")){
			
			SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
			info.addStringPermission("staff");
			return info;
		}
		
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authctoken) throws AuthenticationException {
		UsernamePasswordCaptchaToken token = (UsernamePasswordCaptchaToken)authctoken;
		String username = token.getUsername();
		User user = this.userService.queryUserByUsername(username);
		if(user != null && doCaptchaValidate(token)){
			
			Session session =SecurityUtils.getSubject().getSession();
			session.setAttribute("user", user);
			return new SimpleAuthenticationInfo(user, user.getPassword(), getName());
		}
		return null;
	}
	
	/**
	 * 验证码校验
	 * @param token
	 * @return boolean
	 */
	protected boolean doCaptchaValidate(UsernamePasswordCaptchaToken token)
	{
		String captcha = (String) SecurityUtils.getSubject().getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (captcha != null &&!captcha.equalsIgnoreCase(token.getCaptcha())){
			throw new CaptchaException("验证码错误！");
		}
		return true;
	}

}

