package com.infotran.springboot.validate;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.member.Member;

public class MemberLoginValidator implements Validator {
	private static final Pattern ENG_NUM_REGEX = Pattern.compile("^[A-Za-z0-9]+$");
	
private boolean check;
	
	public MemberLoginValidator() {
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
		ValidationUtils.rejectIfEmpty(errors, "password", "member.password.empty","密碼欄位不能空白");
		Member member = (Member) target;
		//---------------------------------------------------------------------------------------
		//username驗證細項內容
		if (member.getUsername() != null && member.getUsername().length() < 8 || member.getUsername().length() > 12 
				&& !ENG_NUM_REGEX.matcher(member.getPassword()).matches()) {
			if (errors.getFieldError("username") == null) {
				errors.rejectValue("username", "member.username.size", "帳號欄位至少英文和數字8個字元，最多不得超過12個字元");
			}	
		}
		if(!isCheck()) {
			if (errors.getFieldError("username") == null) {
				errors.rejectValue("username", null, "此帳號不存在,請重新輸入");
			}
		}
		//---------------------------------------------------------------------------------------
		//password驗證細項內容
		if (member.getUsername() != null && member.getPassword() != null
				&& member.getUsername().equals(member.getPassword())) {
			if (errors.getFieldError("password") == null) {
			   errors.rejectValue("password", "member.password.mustEqual", "密碼欄位與帳號欄位不可一致");
			}
		}
		if (member.getPassword() != null && member.getPassword().contains(" ")) {
			if (errors.getFieldError("password") == null) {
			errors.rejectValue("password", "member.password.space", "密碼欄位不能包含空白字元");
			}
		}

		

		if (member.getPassword() != null && member.getPassword().length() < 8
				|| member.getPassword().length() > 16 && !ENG_NUM_REGEX.matcher(member.getPassword()).matches()) {
			if (errors.getFieldError("password") == null) {
			errors.rejectValue("password", "member.password.size", "密碼欄位至少英文和數字8個字元，最多不得超過16個字元");
			}
		}
		
		//---------------------------------------------------------------------------------------
		
		//---------------------------------------------------------------------------------------
	}

}
