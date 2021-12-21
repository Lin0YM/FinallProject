package com.infotran.springboot.validate;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.member.Member;
import com.infotran.springboot.service.MemberService;

public class MemberEditValidator implements Validator {
	
	MemberService memberService;
	private boolean check;
	
	public MemberEditValidator() {
		super();
	}
	
	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}

//	public MemberValidator(boolean check) {
//		super();
//		this.check = check;
//	}

	@Autowired
	public MemberEditValidator(MemberService memberService) {
		super();
		this.memberService = memberService;
	}

	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");
	private static final Pattern ENG_NUM_REGEX = Pattern.compile("^[A-Za-z0-9]+$");
	//固定電話
	private static final Pattern TELEPHONENUMBER_REGEX = Pattern.compile("^(886)?0\\d{1,2}-\\d{6,8}$");
	//手機號碼驗證
	private static final Pattern CELLPHONENUMBER_REGEX = Pattern.compile("(09)+[\\d]{8}");
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "username", "member.username.empty","帳號欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "password", "member.password.empty","密碼欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "password1", "member.password1.empty","確認密碼欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "name", "member.name.empty", "姓名欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "sex", "member.sex.empty", "性別欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "phonenumber", "member.phonenumber.empty", "電話欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "emailaddress", "member.emailaddress.empty", "email欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "address", "member.address.empty", "地址欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "status", "member.status.empty", "狀態欄位不能空白");
		ValidationUtils.rejectIfEmpty(errors, "act_level", "member.act_level.empty", "等級欄位不能空白");

		Member member = (Member) target;
		//---------------------------------------------------------------------------------------
		//username驗證細項內容
		if (member.getUsername() != null && member.getUsername().length() < 8 || member.getUsername().length() > 12 
				&& !ENG_NUM_REGEX.matcher(member.getPassword()).matches()) {
			if (errors.getFieldError("username") == null) {
				errors.rejectValue("username", "member.username.size", "帳號欄位至少英文和數字8個字元，最多不得超過12個字元");
			}	
		}
		System.out.println("HIHI");
		System.out.println(isCheck());
		if(isCheck()) {
			if (errors.getFieldError("username") == null) {
				errors.rejectValue("username", null, "此帳號已存在,請重新輸入");
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

		if (member.getPassword1() != null && member.getPassword1().contains(" ")) {
			if (errors.getFieldError("password") == null) {
			errors.rejectValue("password1", "member.password1.space", "確認密碼欄位不能包含空白字元");
			}
		}

		if (member.getPassword() != null && member.getPassword().length() < 8
				|| member.getPassword().length() > 16 && !ENG_NUM_REGEX.matcher(member.getPassword()).matches()) {
			if (errors.getFieldError("password") == null) {
			errors.rejectValue("password", "member.password.size", "密碼欄位至少英文和數字8個字元，最多不得超過16個字元");
			}
		}
		
		if (member.getPassword1() != null && member.getPassword() != null
				&& !member.getPassword1().equals(member.getPassword())) {
			if (errors.getFieldError("password") == null) {
			   errors.rejectValue("password", "member.password.mustEqual", "密碼欄位與確認密碼欄位必須完全一致");
			}
		}
		//---------------------------------------------------------------------------------------
		//name驗證細項內容
		if (member.getName() != null && member.getName().length() < 2 ) {
			if (errors.getFieldError("name") == null) {
				errors.rejectValue("name", "member.name.size", "姓名欄位至少要有兩個字元");
			}	
		}
		//---------------------------------------------------------------------------------------
		//phonenumber驗證細項內容
		if (member.getPhonenumber() != null && !CELLPHONENUMBER_REGEX.matcher(member.getPhonenumber()).matches() 
				&& !TELEPHONENUMBER_REGEX.matcher(member.getPhonenumber()).matches()) {
			if (errors.getFieldError("phonenumber") == null) {
				errors.rejectValue("phonenumber", "member.phonenumber.invalid", "電話格式不正確");
			}
		}
		//---------------------------------------------------------------------------------------
		//emailaddress驗證細項內容
		if (member.getEmailaddress() != null && !EMAIL_REGEX.matcher(member.getEmailaddress()).matches()) {
			if (errors.getFieldError("emailaddress") == null) {
				errors.rejectValue("emailaddress", "member.emailaddress.invalid", "電子郵件地址格式不正確");
			}
		}
		//---------------------------------------------------------------------------------------
	}

}
