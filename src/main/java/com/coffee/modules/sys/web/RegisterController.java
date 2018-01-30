package com.coffee.modules.sys.web;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.coffee.common.config.Global;
import com.coffee.common.json.AjaxJson;
import com.coffee.common.utils.CacheUtils;
import com.coffee.common.utils.DateUtils;
import com.coffee.common.utils.FileUtils;
import com.coffee.common.utils.IdGen;
import com.coffee.common.utils.JedisClusterUtils;
import com.coffee.common.utils.StringUtils;
import com.coffee.common.web.BaseController;
//import com.coffee.modules.edu.dao.OrgRegisterInfoDao;
//import com.coffee.modules.edu.entity.OrgRegisterInfo;
//import com.coffee.modules.edu.service.EducationOrgService;
import com.coffee.modules.sys.dao.AreaDao;
import com.coffee.modules.sys.dao.UserDao;
import com.coffee.modules.sys.entity.Office;
import com.coffee.modules.sys.entity.Role;
import com.coffee.modules.sys.entity.User;
import com.coffee.modules.sys.service.OfficeService;
import com.coffee.modules.sys.service.SystemService;
import com.coffee.modules.sys.utils.UserUtils;
import com.google.common.collect.Lists;


/**
 * 用户Controller
 * 
 * @author yuanyingsheng
 * @version 2017-04-12
 */
@Controller
@RequestMapping(value = "${frontPath}/register")
public class RegisterController extends BaseController {
	
	public static final String USER_CACHE = "userCache";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln";



	@Autowired
	private SystemService systemService;

	@Autowired
	private OfficeService officeService;

//	@Autowired
//	private EducationOrgService educationOrgService;

	@Autowired
	private UserDao userDao;

	@Autowired
	private AreaDao areaDao;
	
//	@Autowired
//	private OrgRegisterInfoDao orgRegisterInfoDao;

	@ModelAttribute
	public User get(@RequestParam(required = false) String id) {
		if (StringUtils.isNotBlank(id)) {
			return systemService.getUser(id);
		} else {
			return new User();
		}
	}

	@RequestMapping(value = { "index", "" })
	public String register(User user, Model model) {
		return "modules/sys/sysRegister";
	}
	
	@RequestMapping(value = { "findPwd", "" })
	public String findPwd(User user, Model model) {
		return "modules/sys/findPwd";
	}
	
	@RequestMapping(value = { "findPwdSuccess", "" })
	public String findPwdSuccess(User user, Model model) {
		return "modules/sys/findPwdSuccess";
	}


	
//	@RequestMapping(value = { "eduOrgDetail", "" })
//	public String eduOrgDetail(OrgRegisterInfo educationOrg, Model model) {
//		model.addAttribute("productions", educationOrgService.getAllEduProduction());
//		return "modules/sys/eduOrginfo";
//	}
//	
//	
//	@RequestMapping(value = { "submitted", "" })
//	public String submitted(OrgRegisterInfo orgRegisterInfo, Model model) {
//		return "modules/sys/submittedTip";
//	}
	/**
	 * 机构用户注册
	 * @param orgRegisterInfo
	 * @param model
	 * @param files
	 * @param request
	 * @param response
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 * @throws ParseException 
	 */
//	@RequestMapping(value = { "submitOrgRegister", "" })
//	public String submitOrgRegister(OrgRegisterInfo orgRegisterInfo, Model model,
//			@RequestParam("files") MultipartFile[] files, MultipartHttpServletRequest request,
//			HttpServletResponse response) throws IllegalStateException, IOException, ParseException {
//		String orgId=null;
//		User user=userDao.get(orgRegisterInfo.getUserid());	
//		orgRegisterInfo.setAuditStatus("0");
//		orgRegisterInfo.setTypeRegister("0");//注册企业类型：0-企业
//		
//		//修改注册机构的时间格式
//		
//		String expLicense = DateUtils.formatDate(orgRegisterInfo.getExpLicense(),"yyyy-MM-dd","yyyyMMdd");
//		String expIdcard = DateUtils.formatDate(orgRegisterInfo.getExpIdcard(),"yyyy-MM-dd","yyyyMMdd");
//		String expOrgcode = DateUtils.formatDate(orgRegisterInfo.getExpOrgcode(),"yyyy-MM-dd","yyyyMMdd");
//		orgRegisterInfo.setExpLicense(expLicense);
//		orgRegisterInfo.setExpIdcard(expIdcard);
//		orgRegisterInfo.setExpOrgcode(expOrgcode);
//		
//		
//		//校验是否是本次注册的用户,拒绝URL篡改
//		if (user == null) {
//			addMessage(model,"操作失败:非法的注册用户，无法提交您的审核材料!");
//			return eduOrgDetail(orgRegisterInfo, model);
//		}
//
//		if (StringUtils.isBlank(orgRegisterInfo.getOrgid())) {
//			orgId=IdGen.uuid2();
//			orgRegisterInfo.setOrgid(orgId);
//		} else {
//			System.out.println("educationOrg.getOrgid():::" + orgRegisterInfo.getOrgid());
//		}
//
//		if (orgRegisterInfo.getTypeLicense().equals("2")) {
//			MultipartFile ubizlicense = request.getFile("ubizlicense");
//			orgRegisterInfo.setLicensePic(FileUtils.uploadFile(ubizlicense,  orgRegisterInfo.getOrgid()));
//
//			MultipartFile ubizopenpermit = request.getFile("ubizopenpermit");
//			orgRegisterInfo.setBankopenpermitPic(FileUtils.uploadFile(ubizopenpermit,  orgRegisterInfo.getOrgid()));
//
//			MultipartFile ubizcreditlicense = request.getFile("ubizcreditlicense");
//			orgRegisterInfo.setCreditcodePic(FileUtils.uploadFile(ubizcreditlicense,  orgRegisterInfo.getOrgid()));
//		} else {
//			MultipartFile fbizlicense = request.getFile("fbizlicense");
//			orgRegisterInfo.setLicensePic(FileUtils.uploadFile(fbizlicense,  orgRegisterInfo.getOrgid()));
//
//			MultipartFile fbizopenpermit = request.getFile("fbizopenpermit");
//			orgRegisterInfo.setBankopenpermitPic(FileUtils.uploadFile(fbizopenpermit,  orgRegisterInfo.getOrgid()));
//
//			MultipartFile fbizcreditlicense = request.getFile("fbizcreditlicense");
//			orgRegisterInfo.setCreditcodePic(FileUtils.uploadFile(fbizcreditlicense,  orgRegisterInfo.getOrgid()));
//
//			MultipartFile forgcodelicense = request.getFile("forgcodelicense");
//			orgRegisterInfo.setOrgCodePic(FileUtils.uploadFile(forgcodelicense,  orgRegisterInfo.getOrgid()));
//
//			MultipartFile ftaxlicense = request.getFile("ftaxlicense");
//			orgRegisterInfo.setTaxlicensePic(FileUtils.uploadFile(ftaxlicense,  orgRegisterInfo.getOrgid()));
//
//		}
//
//		MultipartFile fcertfrontpic = request.getFile("fcertfrontpic");
//		orgRegisterInfo.setIdcardfrontPic(FileUtils.uploadFile(fcertfrontpic,  orgRegisterInfo.getOrgid()));
//
//		MultipartFile fcertbackpic = request.getFile("fcertbackpic");
//		orgRegisterInfo.setIdcardbackPic(FileUtils.uploadFile(fcertbackpic,  orgRegisterInfo.getOrgid()));
//		
//		Office office = new Office();
//		office.setId(orgId);
//		office.setParentIds("0,1");
//		Office op=new Office();
//		op.setId("0");
//		office.setName(orgRegisterInfo.getNameUnit());
//		office.setCode(orgRegisterInfo.getOrgid());
//		office.setSort(30);
//		office.setParent(officeService.getByCode("1"));//默认父级：内部系统
//		office.setArea(areaDao.get("1"));//默认所属区域：中国
//		office.setGrade("1");//默认机构等级：公司
//		office.setCreateBy(user);
//		office.setUpdateBy(user);
//		office.setCreateDate(new Date());
//		office.setUpdateDate(new Date());
//		office.setDelFlag("0");
//		office.setType("1");
//		office.setUseable(Global.YES);
//		
//		user.setCompany(office);
//		user.setOffice(office);
//		educationOrgService.saveEducationOrgAndOffice(orgRegisterInfo,office,user);
//		
//		return "redirect:" + frontPath + "/register/submitted";
//	}


	@RequestMapping(value = "registerUser")
	public String registerUser(HttpServletRequest request,
			HttpServletResponse response,
			boolean mobileLogin,
			String randomCode, String roleName,
			@ModelAttribute("user") User user,
			Model model, RedirectAttributes redirectAttributes) {

		if (user.getEmail() == null) {
			addMessage(model, "注册邮箱不能为空!");
			return register(user, model);
		} else if (user.getLoginName() == null) {
			addMessage(model, "登陆账号不能为空!");
			return register(user, model);
		}
		// 验证邮箱内容
		if (!randomCode.equals(JedisClusterUtils.get(user.getEmail()))) {
			// 如果是手机登录，则返回JSON字符串
			if (mobileLogin) {
				AjaxJson j = new AjaxJson();
				j.setSuccess(false);
				j.setErrorCode("3");
				j.setMsg("邮箱验证码不正确!");
				return renderString(response, j.getJsonStr());
			} else {
				addMessage(model, "邮箱验证码不正确!");
				return register(user, model);
			}
		}

		// 验证邮箱是否已经注册

		if (userDao.findUniqueByProperty("email", user.getEmail()) != null) {
			// 如果是手机登录，则返回JSON字符串
			if (mobileLogin) {
				AjaxJson j = new AjaxJson();
				j.setSuccess(false);
				j.setErrorCode("1");
				j.setMsg("邮箱已经被使用！");
				return renderString(response, j.getJsonStr());
			} else {
				addMessage(model, "邮箱已经被使用!");
				return register(user, model);
			}
		}

		// 验证用户是否已经注册

		if (userDao.findUniqueByProperty("login_name", user.getLoginName()) != null) {
			// 如果是手机登录，则返回JSON字符串
			if (mobileLogin) {
				AjaxJson j = new AjaxJson();
				j.setSuccess(false);
				j.setErrorCode("2");
				j.setMsg("用户名已经被注册！");
				return renderString(response, j.getJsonStr());
			} else {
				addMessage(model, "用户名已经被注册!");
				return register(user, model);
			}
		}
		
		user.setLoginFlag(Global.YES);//Global.NO默认设置用户不可登录，等待审核资料通过后可以登录
		
		// 新注册的用户角色 配置为 机构查看角色，等待咖啡审核通过并且去支付机构开户成功后，切换到机构管理员角色
		Role orgview = systemService.getRoleByEnname("orgview");

		// 角色数据有效性验证，过滤不在授权内的角色
		List<Role> roleList = Lists.newArrayList();
		roleList.add(orgview);
		user.setRoleList(roleList);
		user.setName(user.getLoginName());
		//为每一个用户初始化一个默认机构ID
		String defaultCompanyId = Global.getProperties().getProperty("registered.user.default.companyid");
		user.setCompany(new Office(defaultCompanyId));
		user.setOffice(new Office(defaultCompanyId));
		// 密码MD5加密
		user.setPassword(SystemService.entryptPassword(user.getPassword()));
		//清除此用户的缓存信息，如果有。
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + user.getLoginName());
		if (systemService.getUserByLoginName(user.getLoginName()) != null) {
			addMessage(model, "注册用户'" + user.getLoginName() + "'失败，用户名已存在");
			return register(user, model);
		}
		


		// 生成用户二维码，使用登录名
		/*
		 * String realPath = Global.getUserfilesBaseDir() +
		 * Global.USERFILES_BASE_URL+ user.getId() + "/qrcode/";
		 * FileUtils.createDirectory(realPath); String name=
		 * user.getId()+".png"; //encoderImgId此处二维码的图片名 String filePath =
		 * realPath + name; //存放路径
		 * TwoDimensionCode.encoderQRCode(user.getLoginName(), filePath,
		 * "png");//执行生成二维码
		 * user.setQrCode(request.getContextPath()+Global.USERFILES_BASE_URL+
		 * user.getId() + "/qrcode/"+name);
		 */
		// 保存用户信息
		systemService.saveUser(user);
		// 清除当前用户缓存
		if (user.getLoginName().equals(UserUtils.getUser().getLoginName())) {
			UserUtils.clearCache();
			// UserUtils.getCacheMap().clear();
		}
		JedisClusterUtils.del(user.getEmail());

		addMessage(model, "注册用户'" + user.getLoginName() + "'成功!,请继填写企业认证信息完成认证审核。");
		//注册信息传递给企业资料填写页面，一次性参数，刷新后失效。
//		OrgRegisterInfo orgRegisterInfo =  new OrgRegisterInfo();
		
		redirectAttributes.addAttribute("uid", user.getId());
		redirectAttributes.addAttribute("email", user.getEmail());
		
		model.addAttribute("uid", user.getId());
		model.addAttribute("email", user.getEmail());
//		model.addAttribute(orgRegisterInfo);
//		model.addAttribute("productions", educationOrgService.getAllEduProduction());
		return "modules/sys/eduOrginfo";
	}
	
	
	@RequestMapping(value = "resetPassword")
	public String resetPassword(HttpServletRequest request, HttpServletResponse response, boolean mobileLogin,
			String randomCode, String roleName, User user, Model model, RedirectAttributes redirectAttributes) {

		if (user.getEmail() == null) {
			addMessage(model, "邮箱不能为空!");
			return findPwd(user, model);
		} 
		// 验证邮箱内容
		if (!randomCode.equals(JedisClusterUtils.get(user.getEmail()))) {	
				addMessage(model, "验证码不正确!");
				return findPwd(user, model);

		}

		// 验证邮箱是否未注册
			User user1=userDao.findUniqueByProperty("email", user.getEmail());
		if (user1 == null) {
				addMessage(model, "无效的邮箱地址!");
				return findPwd(user, model);
		}else{
				systemService.updatePasswordById(user1.getId(), user1.getLoginName(), user.getPassword());
		}
		JedisClusterUtils.del(user.getEmail());
		addMessage(redirectAttributes, "账号'" + user.getEmail() + "密码重置 成功!");
		return "redirect:" + frontPath + "/register/findPwdSuccess";
	}
	/**
	 * 用户注册，通过邮箱，获取验证码
	 * 
	 * @param request
	 * @param response
	 * @param mobile
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "getRegisterCode")
	@ResponseBody
	public AjaxJson getRegisterCode(HttpServletRequest request, HttpServletResponse response, String email, Model model,
			RedirectAttributes redirectAttributes) {


		AjaxJson j = new AjaxJson();

		// 验证邮箱是否已经注册
		if (userDao.findUniqueByProperty("email", email) != null) {

			j.setSuccess(false);
			j.setErrorCode("1");
			j.setMsg("邮箱已经被使用！");
			return j;
		}

		String randomCode = IdGen.randomBase62(6);
		try {
			String title = "【咖啡易融】账号注册验证码";
			String content = "您注册账号的验证码是：" + randomCode + "，有效期30分钟，请在有效期内使用。";
			boolean result = UserUtils.sendRandomCodeByEmail(email, title, content);
			if (!result) {
				j.setSuccess(false);
				j.setErrorCode("2");
				j.setMsg("邮件发送失败，错误代码：" + result + "，请联系管理员。");
			} else {
				j.setSuccess(true);
				j.setErrorCode("-1");
				j.setMsg("邮件发送成功!");
				JedisClusterUtils.set(email, randomCode, 1800);
			}
		} catch (Exception e) {
			j.setSuccess(false);
			j.setErrorCode("3");
			j.setMsg("因未知原因导致邮箱发送失败，请联系管理员。");
		}
		return j;
	}
	
	/**
	 * 校验用户填写的教育机构代码是否重复
	 * 
	 * @param request
	 * @param response
	 * @param mobile
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
//	@RequestMapping(value = "validateEduOrgCode")
//	@ResponseBody
//	public AjaxJson validateEduOrgCode(HttpServletRequest request, HttpServletResponse response, OrgRegisterInfo orgRegisterInfo, Model model,
//			RedirectAttributes redirectAttributes) {
//
//		AjaxJson j = new AjaxJson();
//
//		//验证该教育机构码是否存在
//		try {
//			List<OrgRegisterInfo> list = orgRegisterInfoDao.findList(orgRegisterInfo);
//			if(list.size() > 0) {
//				j.setSuccess(false);
//				j.setErrorCode("1");
//				j.setMsg("教育机构代码重复！");
//				return j;
//			}
//		} catch (Exception e) {
//			logger.error(e.getMessage(), e);
//			j.setSuccess(false);
//			j.setErrorCode("2");
//			j.setMsg("系统异常，请稍后再试。");
//			return j;
//		}
//		
//		return j;
//	}
	
	
	/**
	 * 找回密码，通过邮箱，获取验证码
	 * 
	 * @param request
	 * @param response
	 * @param mobile
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "getFindPwdCode")
	@ResponseBody
	public AjaxJson getFindPwdCode(HttpServletRequest request, HttpServletResponse response, String email, Model model,
			RedirectAttributes redirectAttributes) {


		AjaxJson j = new AjaxJson();

		// 验证邮箱是否已经在系统注册过。
		if (userDao.findUniqueByProperty("email", email) == null) {

			j.setSuccess(false);
			j.setErrorCode("1");
			j.setMsg("邮箱地址无效，请输入已注册的邮箱地址！");
			return j;
		}

		String randomCode = IdGen.randomBase62(6);
		try {
			String title = "【咖啡易融】密码重置验证码";
			String content = "您重置密码的验证码是：" + randomCode + "，有效期30分钟，请在有效期内使用。";
			boolean result = UserUtils.sendRandomCodeByEmail(email, title, content);
			if (!result) {
				j.setSuccess(false);
				j.setErrorCode("2");
				j.setMsg("邮件发送失败，错误代码：" + result + "，请联系管理员。");
			} else {
				j.setSuccess(true);
				j.setErrorCode("-1");
				j.setMsg("邮件发送成功!");
				JedisClusterUtils.set(email, randomCode, 1800);
			}
		} catch (Exception e) {
			j.setSuccess(false);
			j.setErrorCode("3");
			j.setMsg("因未知原因导致邮箱发送失败，请联系管理员。");
		}
		return j;
	}

	/**
	 * web端ajax验证手机验证码是否正确
	 */
	@ResponseBody
	@RequestMapping(value = "validateMobileCode")
	public boolean validateMobileCode(HttpServletRequest request, String mobile, String randomCode) {
		if(StringUtils.equals(randomCode,JedisClusterUtils.get(mobile))) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * web端ajax验证邮箱是否正确
	 */
	@ResponseBody
	@RequestMapping(value = "validateEmailCode")
	public boolean validateEmailCode(HttpServletRequest request, String email, String randomCode) {
		if(StringUtils.equals(randomCode,JedisClusterUtils.get(email))) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * web端ajax验证邮箱是否已经注册（数据库中已存在）
	 */
	@ResponseBody
	@RequestMapping(value = "validateEmailExist")
	public boolean validateEmailExist(String email, HttpServletResponse response, Model model) {
		  User user =  userDao.findUniqueByProperty("email", email);
		    if(user != null){
		    	return true;
		    }else{
			    return false;
		    }
	}
}
