package com.infotran.springboot.validate;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.infotran.springboot.model.goodsbean.GoodsBean;


public class CustomerValidator implements Validator {
	private static final Pattern EMAIL_REGEX = Pattern.compile("^[\\w\\d._-]+@[\\w\\d.-]+\\.[\\w\\d]{2,6}$");
	@Override
	public boolean supports(Class<?> clazz) {
		return GoodsBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "goodsName", "goodsBean.goodsName.empty.goodsBean.goodsName", "商品欄位名稱不正確");
		ValidationUtils.rejectIfEmpty(errors, "goodsNum", "goodsBean.goodsNum.empty", "商品數量不可為空");
		ValidationUtils.rejectIfEmpty(errors, "goodsPrice", "goodsBean.goodsPrice.empty", "商品單價不可為空");
		ValidationUtils.rejectIfEmpty(errors, "uploadMember", "goodsBean.uploadMember.empty", "上傳會員欄不能空白");
		ValidationUtils.rejectIfEmpty(errors, "goodsInt", "goodsBean.goodsInt.empty", "物品敘述欄不能空白");
		ValidationUtils.rejectIfEmpty(errors, "goodpic", "goodsBean.goodpic.empty", "商品圖片不能空白");
		
		GoodsBean gb = (GoodsBean) target;

//		if (gb.getName() != null && gb.getName().length() < 2 || gb.getName().length() > 30) {
//			if (errors.getFieldError("name") == null) {
//				errors.rejectValue("name", "customerBean.name.size");
////				errors.rejectValue("name", "customerBean.name.size", "姓名欄至少要有兩個字元，最多不得超過30個字元-預設值");
//			}	
//		}
//
//		if (gb.getPassword() != null && gb.getPassword().contains(" ")) {
//			//errors.rejectValue("password", "customerBean.password.space");
//			errors.rejectValue("password", "customerBean.password.space", "密碼欄不能包含空白字元");
//		}
//
//		if (gb.getPassword1() != null && gb.getPassword1().contains(" ")) {
//			//errors.rejectValue("password1", "customerBean.password1.space");
//			errors.rejectValue("password1", "customerBean.password1.space", "確認密碼欄不能包含空白字元");
//		}
//
//		if (gb.getPassword1() != null && gb.getPassword1().length() < 5
//				&& customer.getPassword1().length() > 15) {
//			//errors.rejectValue("password1", "customerBean.password1.size");
//			errors.rejectValue("password1", "customerBean.password.size", "密碼欄至少要有五個字元，最多不得超過30個字元");
//		}
//		if (gb.getPassword1() != null && gb.getPassword() != null
//				&& !gb.getPassword1().equals(gb.getPassword())) {
//			//errors.rejectValue("password", "customerBean.password.mustEqual");
//			if (errors.getFieldError("password") == null) {
//			   errors.rejectValue("password", "customerBean.password.mustEqual", "密碼欄與確認密碼欄必須完全一致");
//			}
//		}
//
//		if (gb.getEmail() != null && !EMAIL_REGEX.matcher(gb.getEmail()).matches()) {
//			//errors.rejectValue("email", "customerBean.email.invalid");
//			if (errors.getFieldError("email") == null) {
//				errors.rejectValue("email", "customerBean.email.invalid", "電子郵件地址的格式不正確");
//			}
//		}

	}

}
