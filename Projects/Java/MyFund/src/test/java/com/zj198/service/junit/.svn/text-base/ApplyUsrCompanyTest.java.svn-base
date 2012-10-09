package com.zj198.service.junit;


import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zj198.model.OrdApplyUsrCompany;
import com.zj198.model.UsrCompany;
import com.zj198.service.loan.ApplyUserService;

public class ApplyUsrCompanyTest {
    private static ApplicationContext ac = null;
    
    private static ApplyUserService applyUserService;

    @Before
    public void before() {
        ac = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml", "applicationContext-dao.xml",
                "applicationContext-service.xml" });
        
        applyUserService = (ApplyUserService) ac.getBean("applyUserService");
    }
    
    @Test
    public void test() throws Exception {
    	UsrCompany u = new UsrCompany();
    	u.setLphkaddress("asd");
    	OrdApplyUsrCompany o = new OrdApplyUsrCompany();
    	BeanUtils.copyProperties(o, u);
    	o.setUserid(59);
    	applyUserService.addCompDetail(o);
    	
    }
}
