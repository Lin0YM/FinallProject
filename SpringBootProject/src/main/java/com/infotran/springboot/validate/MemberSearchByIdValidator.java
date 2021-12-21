package com.infotran.springboot.validate;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.member.Member;

public class MemberSearchByIdValidator implements Validator {
	private static final Pattern POSITIVE_INTEGER_REGEX = Pattern.compile("^[0-9]*[1-9][0-9]*$");

	public MemberSearchByIdValidator() {
		super();
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "id", "member.id.empty", "編號欄位不能空白");
		Member member = (Member) target;
		// ---------------------------------------------------------------------------------------
		// id驗證細項內容
		String str = String.valueOf(member.getId());
		if (!POSITIVE_INTEGER_REGEX.matcher(str).matches()) {
			if (errors.getFieldError("id") == null) {
				errors.rejectValue("id", "member.id.invalid", "編號欄位格式錯誤,請輸入正整數");
			}	
		}
		
//		System.out.println();
//		if(member.getId() instanceof Integer) {
//			if (errors.getFieldError("id") == null) {
//				errors.rejectValue("id", "member.id.invalid", "編號欄位格式錯誤,請輸入正整數-2");
//			}
//		}
//		String str = String.valueOf(member.getId());
//		System.out.println("已經轉成字串囉:" + str );
//		if (!(str.matches("[0-9]+")) || !(Integer.parseInt(str) > 0)) {
//			// 如果以上条件成立，则str是正整数，可以将str转为int类型，得到一个正整数n
////			int n = Integer.parseInt(str);
//			// System.out.println("可以输入的："+n);
//			if (errors.getFieldError("id") == null) {
//				errors.rejectValue("id", "member.id.invalid", "編號欄位格式錯誤,請輸入正整數");
//			}
//		}

	}

}
