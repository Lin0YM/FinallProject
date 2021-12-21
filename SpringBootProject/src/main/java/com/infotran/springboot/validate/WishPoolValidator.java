package com.infotran.springboot.validate;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.infotran.springboot.model.wishpool.WishPoolBean;



public class WishPoolValidator {

	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");

	public boolean supports(Class<?> clazz) {
		return WishPoolBean.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "WishPoolBean.content.empty", "標題欄位不得空白");
		ValidationUtils.rejectIfEmpty(errors, "content", "WishPoolBean.content.empty", "內容欄位不得空白");

		WishPoolBean WishPool = (WishPoolBean) target;

		if (WishPool.getTitle() != null && WishPool.getTitle().length() < 5 || WishPool.getTitle().length() > 30) {
			if (errors.getFieldError("title") == null) {
//				errors.rejectValue("title", "WishPoolBean.title.size");
				errors.rejectValue("title", "WishPoolBean.title.size", "標題欄至少要有五個字元，最多不得超過30個字元");
			}	
		}

		if (WishPool.getContent() != null && WishPool.getContent().length() < 20 || WishPool.getContent().length() > 120) {
			//errors.rejectValue("content", "WishPoolBean.content.size");
			errors.rejectValue("content", "WishPoolBean.content.size", "內容欄至少要有20個字元，最多不得超過120字元");
		}

	}
}
