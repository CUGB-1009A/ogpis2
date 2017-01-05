package com.ogpis.track.ogpis.international.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.track.ogpis.base.action.BaseAction;
import com.ogpis.track.ogpis.document.entity.PlanDocument2;
import com.ogpis.track.ogpis.international.entity.International2;
import com.ogpis.track.ogpis.international.service.InternationalService2;
import com.ogpis.track.ogpis.plan.entity.Plan2;
@Controller
public class InternationalAction2 extends BaseAction {
	
	@Autowired InternationalService2 internationalService ;
	@RequestMapping(value = "/international/edit")
	public String edit(HttpServletRequest request, ModelMap model,String companyName){
			super.addMenuParams(request, model);
			International2 international = internationalService.findByCompanyName(companyName);	
			model.addAttribute("international",international);
			return "international/edit";
			}
	@RequestMapping(value = "/international/save")
	public String save(HttpServletRequest request, ModelMap model,String companyName,String content){
			super.addMenuParams(request, model);
			International2 international = internationalService.findByCompanyName(companyName);	
			international.setContent(content);
			internationalService.update(international);
			model.addAttribute("international",international);
			return "international/edit";
			}
	@RequestMapping(value = "/international/show")
	public String show(HttpServletRequest request, ModelMap model,String companyName){
			super.addMenuParams(request, model);
			International2 international = internationalService.findByCompanyName(companyName);	
			model.addAttribute("international",international);
			return "international/show";
			}
	
	/*
	 * 提交上传文件表单函数
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/international/uploadFile")
	public void uploadFiles(HttpServletResponse resp,
		HttpServletRequest request, ModelMap model) throws Exception {
		final HttpSession hs = request.getSession();
		String companyName = request.getParameter("companyName");
		International2 international = internationalService.findByCompanyName(companyName);
		request.setCharacterEncoding("utf-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setProgressListener(new ProgressListener() {
			public void update(long pBytesRead, long pContentLength, int pItems) {
				int rate = Math.round(new Float(pBytesRead)
						/ new Float(pContentLength) * 100);
				hs.setAttribute("proInfo", rate);
			}
		});
		List items = upload.parseRequest(request);
		Iterator iter = items.iterator();
		while (iter.hasNext()) // 表单中有几个input标签，就循环几次
		{
			FileItem item = (FileItem) iter.next();
			if (item.isFormField()) {

			} else {
				String fileName = item.getName();
				// 这里发现ie获取的是路径加文件名，chrome获取的是文件名，这里我们只需要文件名，所以有路径的要先去路径
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1,
						fileName.length());
				String prefix = System.currentTimeMillis() + "";
				File file = new File(request.getServletContext().getRealPath(
						"/")
						+ "planFileUpload\\international\\" + companyName);
				if (!file.exists())
					file.mkdirs();
				File uploadedFile = new File(request.getServletContext()
						.getRealPath("/")
						+ "planFileUpload\\international\\"
						+ companyName
						+ "\\"
						+ prefix + fileName);
				item.write(uploadedFile);
				international.setFileName(fileName);
				international.setFilePath("planFileUpload\\international\\" + companyName + "\\"+ prefix + fileName);
				internationalService.update(international);
			}
		}
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(
				"{\"rate\":" + request.getSession().getAttribute("proInfo")
						+ "}");
	}	
	
	@RequestMapping(value = "/international/download")
	public void download(HttpServletResponse response, HttpServletRequest request, ModelMap model,String companyName) throws IOException {
	   
			 International2 international = internationalService.findByCompanyName(companyName);
	         //设置文件MIME类型  
	         response.setContentType("application/x-msdownload");
	         //设置编码方式
	         response.setCharacterEncoding("utf-8");
	         //设置Content-Disposition  
	         response.setHeader("Content-Disposition", "attachment;filename="+ new String(international.getFileName().getBytes("GBK"), "ISO-8859-1")); 
	         
	         //读取目标文件，通过response将目标文件写到客户端  
	         //获取目标文件的绝对路径  
	         String fullFileName = request.getServletContext().getRealPath("/")+ international.getFilePath(); 
	         //System.out.println(fullFileName);  
	         //读取文件  
	         InputStream in = new FileInputStream(fullFileName);  
	         OutputStream out = response.getOutputStream();  
	           
	         //写文件  
	         int b;  
	         while((b=in.read())!= -1)  
	         {  
	            out.write(b);  
	         }  		           
	         in.close();  
	         out.close();  
	}
}
