package com.infotran.springboot.validate;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.service.MemberService;

public class MemberForgetPasswordValidator implements Validator {
	
	MemberService memberService;
	private boolean usernameCheck;
	private boolean emailaddressCheck;
	
	public MemberForgetPasswordValidator() {
		super();
	}
	

//	public MemberValidator(boolean check) {
//		super();
//		this.check = check;
//	}

	@Autowired
	public MemberForgetPasswordValidator(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");
	private static final Pattern ENG_NUM_REGEX = Pattern.compile("^[A-Za-z0-9]+$");
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "username", "member.username.empty","帳號欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "emailaddress", "member.emailaddress.empty", "email欄位不能空白");

		Member member = (Member) target;
		//---------------------------------------------------------------------------------------
		//username驗證細項內容
		if (member.getUsername() != null && member.getUsername().length() < 8 || member.getUsername().length() > 12 
				&& !ENG_NUM_REGEX.matcher(member.getPassword()).matches()) {
			if (errors.getFieldError("username") == null) {
				errors.rejectValue("username", "member.username.size", "帳號欄位至少英文和數字8-12字元");
			}	
		}
		
		if(! isUsernameCheck()) {
			if (errors.getFieldError("username") == null) {
				errors.rejectValue("username", null, "此帳號不存在,請重新輸入");
			}
		}
		//---------------------------------------------------------------------------------------
		//emailaddress驗證細項內容
		if (member.getEmailaddress() != null && !EMAIL_REGEX.matcher(member.getEmailaddress()).matches()) {
			if (errors.getFieldError("emailaddress") == null) {
				errors.rejectValue("emailaddress", "member.emailaddress.invalid", "電子郵件地址格式不正確");
			}
		}
		if( isEmailaddressCheck()) {
			if (errors.getFieldError("emailaddress") == null) {
				errors.rejectValue("emailaddress", null, "此信箱與帳號不匹配,請重新輸入");
			}
		}
		//---------------------------------------------------------------------------------------
	}


	public boolean isUsernameCheck() {
		return usernameCheck;
	}


	public void setUsernameCheck(boolean usernameCheck) {
		this.usernameCheck = usernameCheck;
	}


	public boolean isEmailaddressCheck() {
		return emailaddressCheck;
	}


	public void setEmailaddressCheck(boolean emailaddressCheck) {
		this.emailaddressCheck = emailaddressCheck;
	}

	

}
