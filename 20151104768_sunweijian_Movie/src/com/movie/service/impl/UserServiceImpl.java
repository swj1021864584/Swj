package com.movie.service.impl;

import com.movie.constant.Constant;
import com.movie.dao.UserDao;
import com.movie.dao.impl.UserDaoImpl;
import com.movie.domain.User;
import com.movie.service.UserService;
import com.movie.utils.BeanFactory;
import com.movie.utils.MailUtils;

public class UserServiceImpl implements UserService {

	@Override
	/**
	 * 用户注册 
	 */
	public void regist(User user) throws Exception {
		//1.调用dao
		//UserDao ud = (UserDao) BeanFactory.getBean("UserDao");
		UserDao ud = (UserDao) BeanFactory.getBean("UserDao"); 
		ud.save(user);
		//2.发送激活邮件
		String emailMsg = "恭喜"+user.getName()+":成为我们网站的一员,<a href='http://localhost:8888/Movie/user?method=active&code="+user.getCode()+"'>点此激活</a>";
		MailUtils.sendMail(user.getEmail(), emailMsg);
	}

	@Override
	/**
	 * 
	 * 用户激活
	 */
	public User active(String code) throws Exception {
		UserDao ud=(UserDao) BeanFactory.getBean("UserDao"); 
		//1.通过code获取用户
		User user=ud.getByCode(code);
		
		//1.1 通过激活码没有找到 用户
		if(user == null){
			return null;
		}
		
		//2.若获取到了 修改用户
		user.setState(Constant.USE_IS_ACTIVE);
		user.setCode(null);
		
		ud.update(user);
		return user;
	}

	@Override
	/**
	 * 用户登录 
	 */
	public User login(String username, String password) throws Exception {
		UserDao ud =(UserDao) BeanFactory.getBean("UserDao");
		return ud.getByUsernameAndPwd(username,password);
	}


}
