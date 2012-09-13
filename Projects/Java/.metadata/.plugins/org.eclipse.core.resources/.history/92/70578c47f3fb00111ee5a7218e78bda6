package com.zj198.util.codeing;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.zj198.model.OrdFaAttachList;
import com.zj198.model.OrdFaLoanData;
import com.zj198.model.OrdFaLoanUpload;
import com.zj198.model.OrdFinanceAppBill;
import com.zj198.model.OrdFinanceAppLoan;

public class BaseGenrateCodeTools {
	public static void main(String[] args)  throws Exception {
		BaseGenrateCodeTools instance = new BaseGenrateCodeTools();
		instance.setOutPath("d:\\lean\\yyy\\");//存放生成文件的目录
		instance.setAuthName("岳龙");//作者
		instance.setProjectCode("zj198");//项目代码
		instance.setStrPackage("com.zj198");//包路径
		instance.setStrPackageChild("loan");//子包名
		instance.setStrModule("financeProduct");//功能主体
		instance.setStrModuleName("融资管理");//模块名
		
		/**
		 * 方法清单
		 */
		List<String> methodNames = new ArrayList<String>();
		methodNames.add("findFinance");
		methodNames.add("saveFinance");
		methodNames.add("getFinance");
		methodNames.add("updateFinance");
		methodNames.add("searchDateFile");
		instance.setMethodNames(methodNames);
		/**
		 * 数据表实体清单
		 */
		List<String> tables = new ArrayList<String>();
		tables.add("OrdFaLoanData");//ORD_BUSILOANREQUEST
		tables.add("OrdFaLoanUpload");
		instance.setTableDetails(tables);
		instance.generateEntity();
//		instance.setMethodName("queryCompany");
//		instance.generateMethod();
		
//		instance.setDbInfo(new String[]{"jdbc:oracle:thin:@127.0.0.1:1521:loracle", "bspdba","bspdba","loracel"});
//		instance.setDbTableName("demo_employee");
//		instance.generateResource();

		System.out.println("End");
	}
/*
public String getActionMethod() {
		StringBuffer sb = new StringBuffer();
		return MessageFormat.format(sb.toString(), getParameter());
	}
 */
	public void generateResource() throws Exception{
		outFile(getDbResource(),getParameter()[1]+"\\resource\\database.native");
		outFile(getModuleResource(),getParameter()[1]+"\\resource\\"+getParameter()[1]+".native");
	}
	public String getModuleResource(){
		StringBuffer sb = new StringBuffer();
		sb.append("#<message-resources key=\"{1}\" parameter=\"application.{1}\"/>").append("\r\n");
		sb.append("{1}.title.query{1}={9}查询").append("\r\n");
		sb.append("{1}.title.save{1}={9}新增").append("\r\n");
		sb.append("{1}.title.update{1}={9}修改").append("\r\n");
		sb.append("{1}.title.delete{1}={9}删除").append("\r\n");
		sb.append("").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());		
	}
	public String getDbResource() throws Exception{
		String ret = "";
		Connection conn = null;
		Statement ps = null;
		ResultSet rs = null;
		try {
//			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

			conn = DriverManager.getConnection(this.dbInfo[0],this.dbInfo[1],this.dbInfo[2]
					);
			ps = conn.createStatement();
			String sql = "select t.* from user_col_comments t  where lower(t.table_name)='"+this.getDbTableName()+"'";
			rs = ps
					.executeQuery(sql);
			while (rs.next()) {
				ret += getJavaFieldFromDb(rs.getString("table_name"))+"."+getJavaFieldFromDb(rs.getString("column_name")) + "=";
				if(rs.getString("comments")!=null){
					ret += rs.getString("comments");
				}else{
					ret +=  rs.getString("column_name");
				}
				ret += "\r\n";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			ps.close();
			conn.close();
		}	
		return ret;	
	}
	public String getJavaFieldFromDb(String dbField){
		dbField = dbField.toLowerCase();
		while(dbField.indexOf("_")>=0){
			int index = dbField.indexOf("_");
			dbField = dbField.substring(0,index)+dbField.substring(index+1,index+2).toUpperCase()+dbField.substring(index+2);
		}
		return dbField;
	}
	public void generateEntity() throws Exception{
		outFile(getActionFile(),getParameter()[10]+"\\entity\\action\\"+getParameter()[10] + "\\" +getParameter()[2]+"Action.java");
//		outFile(getFormFile(),getParameter()[1]+"\\entity\\"+getParameter()[1]+"\\form\\"+getParameter()[2]+"Form.java");
	
		outFile(getIServiceFile("service"),getParameter()[10]+"\\entity\\service\\"+getParameter()[10]+"\\"+getParameter()[2]+"Service.java");
		outFile(getServiceFile("service"),getParameter()[10]+"\\entity\\service\\"+getParameter()[10]+"\\impl\\"+getParameter()[2]+"ServiceImpl.java");

		//outFile(getIServiceFile("business"),getParameter()[1]+"\\entity\\"+getParameter()[1]+"\\business\\I"+getParameter()[2]+"Business.java");
		//outFile(getServiceFile("business"),getParameter()[1]+"\\entity\\"+getParameter()[1]+"\\business\\impl\\"+getParameter()[2]+"Business.java");
		if(tableDetails != null && tableDetails.size() > 0){
			for(int i = 0; i< tableDetails.size(); i++){				
				outFile(getIDaoFile(tableDetails.get(i)),getParameter()[10]+"\\entity\\dao\\"+tableDetails.get(i)+"DAO.java");
				outFile(getDaoFile(tableDetails.get(i)),getParameter()[10]+"\\entity\\dao\\hibernate\\"+tableDetails.get(i)+"DAOImpl.java");
			}
		}
	
//		outFile(getSpModelFile("service"),getParameter()[1]+"\\entity\\"+getParameter()[1]+"\\service\\model\\"+getParameter()[4]+"SpModel.java");
//		outFile(getSrModelFile("service"),getParameter()[1]+"\\entity\\"+getParameter()[1]+"\\service\\model\\"+getParameter()[4]+"SrModel.java");
		
//		outFile("",getParameter()[1]+"\\entity\\"+getParameter()[1]+"\\dao\\model\\readme.txt");
//		outFile("",getParameter()[1]+"\\entity\\"+getParameter()[1]+"\\service\\model\\readme.txt");
	
		outFile(getSpringConfFile(),getParameter()[10]+"\\conf\\applicationContext-service.xml");
		outFile(getSpringConfFile_Dao(),getParameter()[10]+"\\conf\\applicationContext-dao.xml");
		outFile(getStrutsFile(),getParameter()[10]+"\\conf\\struts.xml");
	}
	
	public void generateMethod() throws Exception{
//		outFile(getSpModelFile("service"),getParameter()[1]+"\\method\\servcie\\model\\"+getParameter()[4]+"SpModel.java");
//		outFile(getSrModelFile("service"),getParameter()[1]+"\\method\\servcie\\model\\"+getParameter()[4]+"SrModel.java");
		
//		outFile(getSpModelFile("service"),getParameter()[10]+"\\entity\\service\\"+getParameter()[10]+"\\model\\"+getParameter()[4]+"SpModel.java");
//		outFile(getSrModelFile("service"),getParameter()[10]+"\\entity\\service\\"+getParameter()[10]+"\\model\\"+getParameter()[4]+"SrModel.java");
		String c = "";
	
		c += getSeperate("IService");
		c += getIServiceName("service");		

		c += getSeperate("Service");
		c += getServiceName("service");	
		
//		c += getSeperate("Form");
//		c += getFormMethod();		

//		c += getSeperate("ActionXdoclet");
//		c += getActionMethodXdoclet();
		
		c += getSeperate("Action");
		c += getActionMethod();
		outFile(c,getParameter()[1]+"\\method\\servcie\\"+this.methodName+".txt");
		
	}
	public String generateServiceMethod() {
		try {
			
//			outFile(getSpModelFile("service"),getParameter()[10]+"\\entity\\service\\"+getParameter()[10]+"\\model\\"+getParameter()[4]+"SpModel.java");
//			outFile(getSrModelFile("service"),getParameter()[10]+"\\entity\\service\\"+getParameter()[10]+"\\model\\"+getParameter()[4]+"SrModel.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getServiceName("service");	
	}
	public void generateBusinessMethod() throws Exception{
		outFile(getSpModelFile("business"),getParameter()[1]+"\\method\\business\\model\\"+getParameter()[4]+"SpModel.java");
		outFile(getSrModelFile("business"),getParameter()[1]+"\\method\\business\\model\\"+getParameter()[4]+"SrModel.java");
		String c = "";
	
		c += getSeperate("IService");
		c += getIServiceName("business");		

		c += getSeperate("Service");
		c += getServiceName("business");	

		outFile(c,getParameter()[1]+"\\method\\business\\"+this.methodName+".txt");
		
	}	
	
	public String getNow(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");
		return format.format(new Date());
	}
	public String getSeperate(String sepName){
		return "["+sepName+"]------------------------------------------\r\n";
	}
	public String getSpringConfFile() {
		StringBuffer sb = new StringBuffer();
		sb.append("	<bean id=\"{1}Service\" class=\"{0}.service.{10}.impl.{2}ServiceImpl\"/>").append("\r\n");
			
		return MessageFormat.format(sb.toString(), getParameter());
	}
	
	public String getSpringConfFile_Dao() {
		StringBuffer sb = new StringBuffer();
		if(tableDetails != null && tableDetails.size() > 0){
			for(int i = 0; i< tableDetails.size(); i++){	
				sb.append("	<bean id=\"" + tableDetails.get(i).substring(0,1).toLowerCase() + tableDetails.get(i).substring(1) + "DAO\" class=\"{0}.dao.hibernate."+ tableDetails.get(i) + "DAOImpl\"/>").append("\r\n");
			}
		}
		return MessageFormat.format(sb.toString(), getParameter());
	}
	public String getStrutsFile() {
		StringBuffer sb = new StringBuffer();
		sb.append("		<action name=\"{1}\" class=\"{0}.action.{10}.{2}Action\">").append("\r\n");
		sb.append("		</action>");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	public void outFile(String content,String fileName) throws Exception{
		mkFilePath(this.outPath+File.separator+fileName);
		FileWriter file = new FileWriter(this.outPath+File.separator+fileName);
		file.write(content);
		file.close();
	}

	public String getActionFile() {
		StringBuffer sb = new StringBuffer();
		sb.append("package {0}.action.{10};").append("\r\n");
		sb.append("import {0}.service.{10}.{2}Service;").append("\r\n");
		sb.append("import javax.servlet.http.HttpServletRequest;").append("\r\n");
		sb.append("import com.zj198.action.BaseAction;").append("\r\n");
		
		
		sb.append("/**").append("\r\n");
		sb.append(" * @author {7}").append("\r\n");
		sb.append(" * Description:").append("\r\n");
		sb.append(" * CreateAuthor:{7}").append("\r\n");
		sb.append(" * CreateDate:{8}").append("\r\n");
		sb.append(" */").append("\r\n");
		sb.append("public class {2}Action extends BaseAction '{'").append("\r\n");
		sb.append("	private {2}Service {1}Service;").append("\r\n");
		sb.append("	public void set{2}Service({2}Service {1}Service) '{'").append("\r\n");
		sb.append("		this.{1}Service = {1}Service;").append("\r\n");
		sb.append("	'}'").append("\r\n");
		sb.append("\r\n");
		
		sb.append("	public String execute() '{'").append("\r\n");
		sb.append("		return null;").append("\r\n");
		sb.append("	'}'").append("\r\n");
		sb.append("\r\n");
		
		if(this.methodNames != null && this.methodNames.size() > 0){
			for(int j = 0; j< this.methodNames.size(); j ++){
				this.methodName = this.methodNames.get(j);
				sb.append(getActionMethod().replaceAll("\\{", " '{' ").replaceAll("\\}", " '}' "));
			}
		}
		sb.append("'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	public String getFormFile() {
		StringBuffer sb = new StringBuffer();
		sb.append("package {0}.{1}.form;").append("\r\n");
		sb.append("import {0}.common.core.AppForm;").append("\r\n");
		sb.append("/**").append("\r\n");
		sb.append(" * @author {7}").append("\r\n");
		sb.append(" * Description:").append("\r\n");
		sb.append(" * CreateAuthor:{7}").append("\r\n");
		sb.append(" * CreateDate:{8}").append("\r\n");
		sb.append(" * @struts.form name=\"{2}Form\"").append("\r\n");
		sb.append(" */").append("\r\n");
		sb.append("public class {2}Form extends AppForm'{'").append("\r\n");
		sb.append("\r\n");
		sb.append("'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}		
	public String getIServiceFile(String type) {
		String type2 = Srp.ucfirst(type);
		StringBuffer sb = new StringBuffer();
		sb.append("package {0}.service.{10};").append("\r\n");
		//sb.append("import com.tiger.common.base.IBaseService;").append("\r\n");
		sb.append("/**").append("\r\n");
		sb.append(" * @author {7}").append("\r\n");
		sb.append(" * Description:").append("\r\n");
		sb.append(" * CreateAuthor:{7}").append("\r\n");
		sb.append(" * CreateDate:{8}").append("\r\n");
		sb.append(" */").append("\r\n");
		sb.append("public interface {2}"+type2+" '{'").append("\r\n");
		sb.append("\r\n");
		if(this.methodNames != null && this.methodNames.size() > 0){
			for(int j = 0; j< this.methodNames.size(); j ++){
				this.methodName = this.methodNames.get(j);
				sb.append(getIServiceName("service").replaceAll("\\{", " '{' ").replaceAll("\\}", " '}' "));
			}
		}
		sb.append("'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}	
 	
	public String getServiceFile(String type) {
		String type2 = Srp.ucfirst(type);
		StringBuffer sb = new StringBuffer();
		sb.append("package {0}.service.{10}.impl;").append("\r\n");
//		sb.append("import {0}.dao.{2}Dao;").append("\r\n");
		sb.append("import {0}.service.{10}.{2}"+type2+";").append("\r\n");
		//sb.append("import org.springframework.beans.factory.annotation.Autowired;").append("\r\n");
//		sb.append("import org.springframework.stereotype.Service;").append("\r\n");
		sb.append("/**").append("\r\n");
		sb.append(" * @author {7}").append("\r\n");
		sb.append(" * Description:").append("\r\n");
		sb.append(" * CreateAuthor:{7}").append("\r\n");
		sb.append(" * CreateDate:{8}").append("\r\n");
		sb.append(" */").append("\r\n");
//		sb.append("@Service").append("\r\n");
		sb.append("public class {2}"+type2+"Impl implements {2}"+type2+" '{'").append("\r\n");
//		sb.append("	@Autowired").append("\r\n");
		
//		sb.append("	private {2}Dao ").append("{1}Dao;").append("\r\n");
//		sb.append("	public void set{2}Dao({2}Dao {1}Dao) '{'").append("\r\n");
//		sb.append("		this.{1}Dao = {1}Dao;").append("\r\n");
//		sb.append("'}'").append("\r\n");
//		sb.append("\r\n");
		if(this.methodNames != null && this.methodNames.size() > 0){
			for(int j = 0; j< this.methodNames.size(); j ++){
				this.methodName = this.methodNames.get(j);
				sb.append(generateServiceMethod().replaceAll("\\{", "'{'").replaceAll("\\}", "'}'"));
			}
		}
		
		sb.append("'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}	
 
	public String getIDaoFile(String tableName) {
		StringBuffer sb = new StringBuffer();
		sb.append("package {0}.dao;").append("\r\n");
		//sb.append("import com.tiger.common.base.IBaseDao;").append("\r\n");
		sb.append("/**").append("\r\n");
		sb.append(" * @author {7}").append("\r\n");
		sb.append(" * Description:").append("\r\n");
		sb.append(" * CreateAuthor:{7}").append("\r\n");
		sb.append(" * CreateDate:{8}").append("\r\n");
		sb.append(" */").append("\r\n");
		sb.append("public interface " + tableName + "DAO extends BaseDAO<" + tableName + ", Integer>'{'").append("\r\n");
		sb.append("\r\n");
//		if(this.methodNames != null && this.methodNames.size() > 0){
//			for(int j = 0; j< this.methodNames.size(); j ++){
//				this.methodName = this.methodNames.get(j);
//				sb.append(getIDaoName().replaceAll("\\{", " '{' ").replaceAll("\\}", " '}' "));
//			}
//		}
		
		sb.append("'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}	
	public String getDaoFile(String tableName) {
		StringBuffer sb = new StringBuffer();
		sb.append("package {0}.dao.hibernate;").append("\r\n");
//		sb.append("import com.tiger.common.hibernate.BHibernateDaoSupport;").append("\r\n");
		sb.append("import {0}.dao." + tableName + "DAO;").append("\r\n");
		//sb.append("import com.baosight.core.hibernate3.PageTools;").append("\r\n");
		sb.append("/**").append("\r\n");
		sb.append(" * @author {7}").append("\r\n");
		sb.append(" * Description:").append("\r\n");
		sb.append(" * CreateAuthor:{7}").append("\r\n");
		sb.append(" * CreateDate:{8}").append("\r\n");
		sb.append(" */").append("\r\n");
//		sb.append("@Repository").append("\r\n");
		sb.append("public class " + tableName + "DAOImpl extends HibernateDAO<"+tableName+", Integer> implements " + tableName + "DAO '{'").append("\r\n");
		
		
		
		sb.append("'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}	
		
	
	
	
	
	public String getSrModelFile(String spType) {
		StringBuffer sb = new StringBuffer();
		sb.append("package {0}.service.{10}.model;").append("\r\n");
		sb.append("import com.zj198.common.base.BaseSrModel;").append("\r\n");
		sb.append("/**").append("\r\n");
		sb.append(" * @author {7}").append("\r\n");
		sb.append(" * Description:").append("\r\n");
		sb.append(" * CreateAuthor:{7}").append("\r\n");
		sb.append(" * CreateDate:{8}").append("\r\n");
		sb.append(" */").append("\r\n");
		sb.append("public class {4}SrModel extends BaseSrModel '{'").append("\r\n");
		sb.append("\r\n");
		sb.append("'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	public String getSpModelFile(String spType) {
		StringBuffer sb = new StringBuffer();
		sb.append("package {0}.service.{10}.model;").append("\r\n");
		sb.append("import com.zj198.common.base.BaseSrModel;").append("\r\n");
		sb.append("/**").append("\r\n");
		sb.append(" * @author {7}").append("\r\n");
		sb.append(" * Description:").append("\r\n");
		sb.append(" * CreateAuthor:{7}").append("\r\n");
		sb.append(" * CreateDate:{8}").append("\r\n");
		sb.append(" */").append("\r\n");
		sb.append("public class {4}SpModel extends BaseSpModel '{'").append("\r\n");
		sb.append("\r\n");
		sb.append("'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	

	public String getGSField(String fieldName){
		StringBuffer sb = new StringBuffer();
		sb.append("	private {1}SpModel {0}SpModel = new {1}SpModel();").append("\r\n");
		sb.append("	public {1}SpModel get{1}SpModel() '{'").append("\r\n");
		sb.append("		return {0}SpModel;").append("\r\n");
		sb.append("	'}'").append("\r\n");
		sb.append("	public void set{1}SpModel({1}SpModel {0}SpModel) '{'").append("\r\n");
		sb.append("		this.{0}SpModel = {0}SpModel;").append("\r\n");
		sb.append("	'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), new String[]{fieldName,f(fieldName)});
	}
	public String getFormMethod(){
		return getGSField(this.methodName);
	}
	public String getActionMethodXdoclet() {
		StringBuffer sb = new StringBuffer();
		sb.append(" * @struts.action-forward name=\"{3}\"").append("\r\n");
		sb.append(" *                        path=\"/{5}/{1}/{3}.jsp\"").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	
	public String getActionMethod() {
		StringBuffer sb = new StringBuffer();
//		sb.append("	private {4}SpModel {3}SpModel;").append("\r\n");
//		sb.append("	public {4}SpModel get{4}SpModel()'{'").append("\r\n");
//		sb.append("		return this.{3}SpModel;").append("\r\n");
//		sb.append("	'}'").append("\r\n");
//		
//		sb.append("	public void set{4}SpModel({4}SpModel {3}SpModel)'{'").append("\r\n");
//		sb.append("		this.{3}SpModel={3}SpModel;").append("\r\n");
//		sb.append("	'}'").append("\r\n");
		
		sb.append("	/**").append("\r\n");
		sb.append("	 * @author {7}").append("\r\n");
		sb.append("	 * Description:").append("\r\n");
		sb.append("	 * CreateAuthor:{7}").append("\r\n");
		sb.append("	 * CreateDate:{8}").append("\r\n");
		sb.append("	 * @param ").append("\r\n");
		sb.append("	 * @return ").append("\r\n");
		sb.append("	 */").append("\r\n");
		sb.append("	public String {3}()'{'").append("\r\n");
		sb.append("		// INIT").append("\r\n");
//		sb.append("		BaseSrModel srModel = ");
		sb.append("		{1}Service.{3}();").append("\r\n");
//		sb.append("		request.setAttribute(\"srModel\", srModel);").append("\r\n");
		sb.append("		return \"{3}\";").append("\r\n");
		sb.append("	'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	public String getIServiceName(String type){
		StringBuffer sb = new StringBuffer();
		sb.append("	public void {3}();").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	public String getIDaoName(){
		StringBuffer sb = new StringBuffer();
		sb.append("	public {4}SrModel {3}({4}SpModel spModel);").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	public String getServiceName(String type){
		String type2 = Srp.ucfirst(type);
		StringBuffer sb = new StringBuffer();
		sb.append("	/**").append("\r\n");
		sb.append("	 * @author {7}").append("\r\n");
		sb.append("	 * Description:").append("\r\n");
		sb.append("	 * CreateAuthor:{7}").append("\r\n");
		sb.append("	 * CreateDate:{8}").append("\r\n");
		sb.append("	 * @param ").append("\r\n");
		sb.append("	 * @return ").append("\r\n");
		sb.append("	 */").append("\r\n");
		sb.append("	public void {3}() '{'").append("\r\n");
//		sb.append("		//INIT").append("\r\n");
////		sb.append("		{4}SrModel srModel = new {4}SrModel();").append("\r\n");
//		sb.append("		//BUSINESS").append("\r\n");
//		sb.append("		//srModel = {1}Dao.{3}(spModel);").append("\r\n");
//		sb.append("		//INFO").append("\r\n");
//		sb.append("		return srModel;").append("\r\n");
		sb.append("	'}'").append("\r\n");
		return MessageFormat.format(sb.toString(), getParameter());
	}
	
	public String getDaoName(){
		StringBuffer sb = new StringBuffer();
		sb.append("	/**").append("\r\n");
		sb.append("	 * @author {7}").append("\r\n");
		sb.append("	 * Description:").append("\r\n");
		sb.append("	 * CreateAuthor:{7}").append("\r\n");
		sb.append("	 * CreateDate:{8}").append("\r\n");
		sb.append("	 * @param ").append("\r\n");
		sb.append("	 * @return ").append("\r\n");
		sb.append("	 */").append("\r\n");
		
		sb.append("	public {4}SrModel {3}({4}SpModel spModel) '{'").append("\r\n");
		sb.append("		{4}SrModel srModel = new {4}SrModel();").append("\r\n");
		sb.append("		return srModel;").append("\r\n");
		sb.append("	'}'").append("\r\n");
		
		return MessageFormat.format(sb.toString(), getParameter());
	}
	public String[] getParameter(){
		return new String[] {
				this.strPackage,//0 
				this.strModule, //1
				f(this.strModule),//2
				this.methodName, //3
				f(this.methodName),//4
				this.projectCode,//5
				f(this.projectCode),//6
				this.authName,//7
				getNow(),//8
				strModuleName,//9
				this.strPackageChild//10
				};
	}
	
	public static void mkFilePath(String fileName){
		File file = new File(fileName);
		mkdir(file.getParentFile().getAbsolutePath());
	}

	public static void mkdir(String mkdirName) {
		File file = new File(mkdirName);
		if(file.isFile()){
			return;
		}		
		if(!file.exists()){
			if(!file.getParentFile().exists()){
				mkdir(file.getParentFile().getAbsolutePath());								
			}
			file.mkdir();
		}
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public String getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}	
	public String f(String str) {
		if(str==null||str.trim().length()<=1){
			return "";
		}
		
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public String getStrPackage() {
		return strPackage;
	}

	public void setStrPackage(String strPackage) {
		this.strPackage = strPackage;
	}

	public String getStrModule() {
		return strModule;
	}

	public void setStrModule(String strModule) {
		this.strModule = strModule;
	}
	public String getOutPath() {
		return outPath;
	}
	public void setOutPath(String outPath) {
		this.outPath = outPath;
	}	
	public String[] getDbInfo() {
		return dbInfo;
	}
	public void setDbInfo(String[] dbInfo) {
		this.dbInfo = dbInfo;
	}	
	public String getDbTableName() {
		return dbTableName;
	}
	public void setDbTableName(String dbTableName) {
		this.dbTableName = dbTableName;
	}
	public String getStrModuleName() {
		return strModuleName;
	}
	public void setStrModuleName(String strModuleName) {
		this.strModuleName = strModuleName;
	}
	private String outPath;//输入文件目录
	private String authName;
	private String projectCode;//项目代码
	private String strPackage;//package
	private String strModule;//所属模块
	private String strModuleName;//模块名称
	private String methodName;//方法名
	private String dbTableName;//表空间名
	private String[] dbInfo;//数据库信息 new String[]{"jdbc:oracle:thin:@10.60.17.9:1521:train", "bspdba","bspdba","BSPDBA"}
	private List<String> methodNames;
	private List<String> tableDetails;
	private String strPackageChild;
	
	public String getStrPackageChild() {
		return strPackageChild;
	}
	public void setStrPackageChild(String strPackageChild) {
		this.strPackageChild = strPackageChild;
	}
	public List<String> getTableDetails() {
		return tableDetails;
	}
	public void setTableDetails(List<String> tableDetails) {
		this.tableDetails = tableDetails;
	}
	public List<String> getMethodNames() {
		return methodNames;
	}
	public void setMethodNames(List<String> methodNames) {
		this.methodNames = methodNames;
	}


}
