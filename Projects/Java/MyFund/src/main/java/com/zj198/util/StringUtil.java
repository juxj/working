package com.zj198.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

public class StringUtil {

	public static List<String> getStringList(String str){
		if(str==null)return null;
		
		String[] results = str.split(",");
		
		List<String> list = new ArrayList<String>();
		for(String s:results){
			list.add(s);
		}
		return list;
	}
	
	//生成6位随机数字的激活验证码
	public static String createActiveCode(){
		char c[] = {'1','2','3','4','5','6','7','8','9','0'};
		StringBuilder sRand = new StringBuilder();
		for (int i = 0; i < 6; i++){
			Random random = new Random();
			int index = random.nextInt(10);
			String rand = String.valueOf(c[index]);
			sRand.append(rand);
		}
		return sRand.toString();
	}
	
	public static String getStrByArray(Integer[] arr){
		StringBuffer result = new StringBuffer();
		if(arr != null && arr.length > 0){
			result.append(",");
			for(Integer str:arr){
				result.append(str).append(",");
			}
		}
		return result.toString();
	}
	public static Integer[] getArrayByStr(String str){
		Integer[] arr = null;
		if(str != null && str.length() > 0){
			if(str.startsWith(",")){
				str = str.substring(1);
			}
			if(str.endsWith(",")){
				str = str.substring(0,str.length()-1);
			}
			String[] strarr = str.split(",");
			arr = new Integer[strarr.length];
			for(int i = 0; i<arr.length; i++){
				arr[i] = Integer.valueOf(strarr[i]);
			}
		}
		return arr;
	}
	/**验证身份证号码是否正确*/
	public static boolean validCID(String cid){
		if(StringUtils.isBlank(cid)) return true;
        if (cid.length() == 0) {
        	return true;
        }else{
        	cid=getIDCard(cid);
        }
		 //17位加权因子，与身份证号前17位依次相乘。
        int w[] = {7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
        int sum = 0;//保存级数和
        for(int i = 0; i < cid.length()-1 ; i++){
            sum += new Integer(cid.substring(i,i+1)) * w[i];
        }
        /**
         *校验结果，上一步计算得出的结果与11取模，得到的结果相对应的字符就是身份证最后一位，也就是校验位。例如：0对应下面数组第一个元素，以此类推。
         */
        String sums[] = {"1","0","X","9","8","7","6","5","4","3","2"};
        if (sums[(sum%11)].equals(cid.substring(cid.length()-1,cid.length()))) {//与身份证最后一位比较       
            return true;
        }else {    
            return false;
        }
//		Pattern p = Pattern.compile("^(\\d{6})(18|19|20)?(\\d{2})([01]\\d)([0123]\\d)(\\d{3})(\\d|X)?$");     
//        Matcher m = p.matcher(cid);     
//        return m.matches();
	}
	/**验证邮箱*/
	public static boolean validEmail(String email){
		if(StringUtils.isBlank(email)) return true;
        String pattern1 = "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";  
        Pattern pattern = Pattern.compile(pattern1);  
        Matcher mat = pattern.matcher(email);
//        System.out.println(email);
//        System.out.println(mat.matches());
        return mat.matches();
	}
	/**验证手机号码 和固定电话*/
	public static boolean validMobile(String mobile){
		if(StringUtils.isBlank(mobile)) return true;
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$|^[0]{1}[0-9]{2,3}-[0-9]{7,8}|[0]{1}[0-9]{2,3}[0-9]{7,8}$");     
        Matcher m = p.matcher(mobile);
//        System.out.println(mobile);
//        System.out.println(m.matches());
        return m.matches();  
	}
	/**验证邮编*/
	public static boolean validCode(String code){
		if(StringUtils.isBlank(code)) return true;
		Pattern p = Pattern.compile("^[0-9]{6}$");     
        Matcher m = p.matcher(code);     
        return m.matches();  
	}
	/**验证固定电话号码*/
	public static boolean validPhone(String phone){
		if(StringUtils.isBlank(phone)) return true;
		Pattern p = Pattern.compile("^[0]{1}[0-9]{2,3}-[0-9]{7,8}|[0]{1}[0-9]{2,3}[0-9]{7,8}$");     
        Matcher m = p.matcher(phone);
        return m.matches();  
	}
	/**验证中文名*/
	public static boolean validRname(String name){
		if(StringUtils.isBlank(name)) return true;
		Pattern p=Pattern.compile("^[\u4E00-\u9FA5]*$");
		Matcher m =p.matcher(name);
//		System.out.println(name);
//		System.out.println(m.matches());
		return m.matches();
	}
	/**验证只能为数字小数点后面为0*/
	public static boolean validDouble(Double value){
		if(value == null) return true;
		Pattern p=Pattern.compile("^[\\d]*?\\.*[0]*$");
		Integer i= (int)Math.floor(value);
		String v=i.toString();
		Matcher m =p.matcher(v);
//		System.out.println(v);
//		System.out.println(m.matches());
		return m.matches();
	}
//	/**验证介绍 中文 允许特殊字符  */
//	public static boolean validCodeString(String name){
//		if(StringUtils.isBlank(name)) return true;
//		Pattern p=Pattern.compile("^([\u4E00-\u9FA5][^A-Za-z0-9][A-Za-z0-9])*$");
//		Matcher m =p.matcher(name);
//		System.out.println(name);
//		System.out.println(m.matches());
//		return m.matches();
//	}
	/**验证机构名  中文 [\u4E00-\u9FA5\\(\\)A-Za-z]*?*/
	public static boolean validString(String name){
		if(StringUtils.isBlank(name)) return true;
		Pattern p=Pattern.compile("^[\u4e00-\u9fa5\\w\\s\\(\\)]*$");
		Matcher m =p.matcher(name);
//		System.out.println(name + m.matches());
		return m.matches();
	}
	/**验证地址 中文 英文  [\u4E00-\u9FA5\\(\\)A-Za-z0-9_]*?*/
	public static boolean validAddress(String name){
		if(StringUtils.isBlank(name)) return true;
		Pattern p=Pattern.compile("^[\u4e00-\u9fa5\\w\\s\\(\\)]*$");
		Matcher m =p.matcher(name);
//		System.out.println(name);
//		System.out.println(m.matches());
		return m.matches();
	}
	/**验证组织机构代码证号码*/
	public static boolean validOrganization(String code){
		if(StringUtils.isBlank(code)) return true;
		code=code.toUpperCase();
		int[] ws = { 3, 7, 9, 10, 5, 8, 4, 2 };
		String str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String regex = "^([0-9A-Z]){8}-[0-9|X]$";
		
		if (!code.matches(regex)) {
			return false;
		}
		int sum = 0;
		for (int i = 0; i < 8; i++) {
			sum += str.indexOf(String.valueOf(code.charAt(i))) * ws[i];
		}
		int c9 = 11 - (sum % 11);
		String sc9 = String.valueOf(c9);
		if (11 == c9) {
			sc9 = "0";
		} else if (10 == c9) {
			sc9 = "X";
		}
		return sc9.equals(String.valueOf(code.charAt(9)));
	}
	/**验证机构代码*/
	public static boolean validLicCode(String value){
		if(StringUtils.isBlank(value)) return true;
		Pattern p=Pattern.compile("^[\\w]*$");
		Matcher m =p.matcher(value);
		return m.matches();
		
	}
	/**验证 \w @ . 如：个人信息中的联系方式*/
	public static boolean validContacInfo(String value){
		if(StringUtils.isBlank(value)) return true;
		Pattern p=Pattern.compile("^[\\w\\@\\.\\-]*$");
		Matcher m =p.matcher(value);
		return m.matches();
		
	}
	
	/**验证密码是否符合规则*/
	public static boolean validPwd(String pwd){
		if(StringUtils.isBlank(pwd)) return true;
		Pattern p=Pattern.compile("^\\w{6,16}$");
		Matcher m =p.matcher(pwd);
//		System.out.println(pwd);
//		System.out.println(m.matches());
		return m.matches();
	}
	/**验证用户名是否符合规则 username*/
	public static boolean validUserName(String username){
		if(StringUtils.isBlank(username)) return true;
		Pattern p=Pattern.compile("^\\w{6,18}$");
		Matcher m =p.matcher(username);
//		System.out.println(username);
//		System.out.println(m.matches());
		return m.matches();
	}
	/**验证double指定长度*/
	public static boolean validlengthD(Double value,int num){
		if(value == null) return true;
		Integer i= (int)Math.floor(value);
//		System.out.println(i);
//		System.out.println(i.toString().length());
//		System.out.println(num);
//		System.out.println(i.toString().length()<num);
        return i.toString().length()<num;
	}
	/**验证字符串指定长度*/
	public static boolean validlength(String value,int num){
		if(StringUtils.isBlank(value)) return true;
//		System.out.println(value.length()<num+1);
//		System.out.println(value);
        return value.length()<num+1;
	}
	
	/**判断对象是否为null或者为空*/
	public static boolean isNullOrBlank(Object object){
		if(object==null) return true;//TODO:？？？
		return false;
	}
	/*** 功能：把15位身份证转换成18位** @param id* @return newid or id*/
	public static final String getIDCard(String id) {
	    // 若是15位，则转换成18位；否则直接返回ID
	    if (15 == id.length()) {
	        final int[] W = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4,2, 1 };
	        final String[] A = { "1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2" };
	        int i, j, s = 0;
	        String newid;
	        newid = id;
	        newid = newid.substring(0, 6) + "19"+ newid.substring(6, id.length());
	        for (i = 0; i < newid.length(); i++) {
	            j = Integer.parseInt(newid.substring(i, i + 1)) * W[i];
	            s = s + j;
	        }
	        s = s % 11;
	        newid = newid + A[s];
	        return newid;
	    } else {
	        return id;
	    }
	}
}
