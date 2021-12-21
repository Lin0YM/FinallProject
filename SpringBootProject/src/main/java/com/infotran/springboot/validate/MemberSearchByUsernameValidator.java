package com.infotran.springboot.validate;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.member.Member;

public class MemberSearchByUsernameValidator implements Validator {
	private static final Pattern ENG_NUM_REGEX = Pattern.compile("^[A-Za-z0-9]+$");
	
private boolean check;
	
	public MemberSearchByUsernameValidator() {
		super();
	}
	
	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "username", "member.username.empty","帳號欄位不能空白");
		Member member = (Member) target;
		//---------------------------------------------------------------------------------------
		//username驗證細項內容
		if (member.getUsername() != null && member.getUsername().length() < 8 || member.getUsername().length() > 12 
				&& !ENG_NUM_REGEX.matcher(member.getUsername()).matches()) {
			if (errors.getFieldError("username") == null) {
				errors.rejectValue("username", "member.username.size", "帳號欄位至少英文和數字8-12字元");
			}	
		}
		if(!isCheck()) {
			if (errors.getFieldError("username") == null) {
				errors.rejectValue("username", null, "此帳號不存在,請重新輸入");
			}
		}
		
		//---------------------------------------------------------------------------------------
	}

}
