package com.ogpis.plan.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.plan.entity.IndexDataManagement;
import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.PlanDocument;
import com.ogpis.plan.entity.PlanType;
import com.ogpis.plan.service.IndexManagementService;
import com.ogpis.plan.service.PlanDocumentService;
import com.ogpis.plan.service.PlanService;
import com.ogpis.system.entity.Role;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.UserService;

@Controller
@RequestMapping("/plan")
public class PlanAction {
	@Autowired
	private IndexManagementService indexManagementService;
	@Autowired
	private PlanService planService;
	@Autowired
	private UserService userService;
	@Autowired
	private PlanDocumentService planDocumentService;
	

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request,ModelMap model,String type,String condition){
		
		LinkedHashMap map;
		List<LinkedHashMap> mapList=new ArrayList<LinkedHashMap>();
		
		//String currentUserName=request.getUserPrincipal().getName();
		String currentUserName="admin";
		User user=userService.findByUserName(currentUserName);
		Set<Role> roles=user.getRoles();
		boolean isManager=true;
		/*for(Role role:roles){
			if(role.getIsSuper())
				isManager=true;
		}*/
		
		//查询用户对应角色所能看到的规划
		List<Plan> plans=planService.findAll(isManager, type, condition);
		//将用户关注的规划用字符串连接起来
		String conceredPlanId="";
		for(Plan concern :user.getPlans()){
			conceredPlanId+=concern.getId();
		}
		
		model.addAttribute("plansNumber", plans.size());
		for(Plan temp:plans){
			map =new LinkedHashMap();
			map.put("plan", temp);
			if(conceredPlanId.contains(temp.getId()))
				map.put("isConcerned", true);
			else
				map.put("isConcerned", false);
			Set<PlanDocument> document = temp.getPlanDocument();
			map.put("planDocument", document);
			mapList.add(map);
		}				
		model.addAttribute("mapList", mapList);
		model.addAttribute("type", type);
		model.addAttribute("condition", condition);
		model.addAttribute("planType", PlanType.values());
		
		
		if(isManager)
			return "/plan/planAdmin/list";
		else{
			model.addAttribute("listType", "user");
			return "/plan/planAdmin/list";
		}
		
	}
	
	@RequestMapping(value = "/userList")
	public String userList(HttpServletRequest request,ModelMap model,String type,String condition){
		return "/plan/planUser/list";
	}
	
	@RequestMapping(value="/userDetail")
	public String userDetail(HttpServletRequest request,ModelMap model,String type,String condition){
		return "/plan/planUser/userDetail";
	}
	
	@RequestMapping("/toEditPage")
	public String toEditPage(HttpServletRequest request,ModelMap model,String type){
		model.addAttribute("planType", PlanType.values());
		model.addAttribute("type", type);
		
		return "/plan/planAdmin/addPlan";
	}
	@RequestMapping("/save")
	public String save(HttpServletRequest request,Boolean isAdd,ModelMap model,String id,Plan plan,String planType,String indexIds){
		Plan bean=null;
		if(isAdd){
			bean=new Plan();
			bean.setPlanType(planType);
			bean.setReleased(false);
		}else{
			bean=planService.findById(id);
		}
		bean.setPlanName(plan.getPlanName());
		bean.setPlanShortDescription(plan.getPlanShortDescription());
		bean.setTargetAndFinished(plan.getTargetAndFinished());
		bean.setOutputDescription(plan.getOutputDescription());
		bean.setStorageDescription(plan.getStorageDescription());
		bean.setPlanCode(plan.getPlanCode());
		bean.setPlanDescription(plan.getPlanDescription());
		bean.setReleaseUnit(plan.getReleaseUnit());
		bean.setStartTime(plan.getStartTime());
		bean.setEndTime(plan.getEndTime());
		bean.setReleaseDate(plan.getReleaseDate());
		bean.setModifiedTime(new Timestamp(System.currentTimeMillis()));
		model.addAttribute("type",planType);
		model.addAttribute("condition","");
		if(isAdd){
			planService.save(bean);
			return "redirect:/plan/list";
		}else{
			planService.update(bean);
			model.addAttribute("id", bean.getId());
			model.addAttribute("flag", 1);
			return "redirect:show";
		}
	}
	
	@RequestMapping("/toPreview")
	public String preview(HttpServletRequest request,Boolean isAdd,ModelMap model,String id,Plan plan,String planType,String indexIds){
		
		return "/plan/planAdmin/planPreview";
	}
	
	@RequestMapping("/deletePlan")
	public void delete(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id=request.getParameter("planId");
		System.out.println(id);
		Plan plan=planService.findById(id);
		plan.setDeleted(true);
		Set<PlanDocument> planDocumentSet=plan.getPlanDocument();
		for(PlanDocument temp:planDocumentSet){
			temp.setDeleted(true);
			temp.setPlan(null);
			//planDocumentService.update(temp);
		}
		planService.update(plan);
		String result="{\"result\":\"success\"}";
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/release")
	public void release(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id=request.getParameter("planId");
		Plan plan =planService.findById(id);
		plan.setReleased(true);
		planService.update(plan);
		String result="{\"result\":\"success\"}";
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.getWriter().write(result);
	}
	@RequestMapping("/disrelease")
	public void disrelease(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id=request.getParameter("planId");
		Plan plan =planService.findById(id);
		plan.setReleased(false);
		planService.update(plan);
		String result="{\"result\":\"success\"}";
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.getWriter().write(result);
	}
	
	@RequestMapping("/show")
	public String show(HttpServletRequest request,HttpServletResponse response,ModelMap model,String id,String flag){
		System.out.println("hasdkfj");
		HashMap hashMap=new HashMap();
		List<IndexDataManagement> indexDataManagement;
		Plan plan=planService.findById(id);
		model.addAttribute("plan", plan);
		
		int pageNo=1;
		int pageSize=10;
		if(flag.equals("1")){
			model.addAttribute("flag", 1);
		}
		if(flag.equals("2")){
			Pagination planDocument=planDocumentService.getOnePlanDocument(pageNo, pageSize, plan.getId());
			model.addAttribute("planDocumentSet", planDocument);
			model.addAttribute("flag", 2);
		}
		if(flag.equals("3")){
			List<IndexManagement> allIndexs=new ArrayList<IndexManagement>();
			if(plan.getPlanType().equals("358"))
				allIndexs=indexManagementService.findAllIndexByPriority("GZL");
			else
				allIndexs=indexManagementService.findAllIndexByPriority(plan.getPlanType());
			model.addAttribute("allIndexs", allIndexs);
			model.addAttribute("plan_indexs", plan.getPlan_Indexs());
			model.addAttribute("flag", 3);
		}
		
		model.addAttribute("type", plan.getPlanType());
		System.out.println("13254");
		
		return "/plan/planAdmin/detail";
	}
	
	@RequestMapping("/uploadFiles")
	public void uploadFiles(HttpServletRequest request,HttpServletResponse response,ModelMap model) 
			throws Exception{
		System.out.println("234+++=========");
		float fileSize=0;
		String[] fileSizeUnit={"B","KB","MB","GB","TB"};
		final HttpSession hs=request.getSession();
		
		String id=request.getParameter("planId");
		Plan plan=planService.findById(id);
		String type=request.getParameter("type");
		//PlanDocument bean;
		request.setCharacterEncoding("utf-8");
		boolean isMultipart=ServletFileUpload.isMultipartContent(request);
		if(!isMultipart){
			response.sendRedirect("show?id="+id+"&&flag=2");			
		}
		FileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload=new ServletFileUpload(factory);
		
		upload.setProgressListener(new ProgressListener() {
			public void update(long pBytesRead, long pContentLength, int pItems) {
				int rate=Math.round(new Float(pBytesRead)/new Float(pContentLength)*100);
				hs.setAttribute("proInfo", rate);
			}
		});
		List items=upload.parseRequest(request);
		Iterator iter=items.iterator();
		while(iter.hasNext()){
			FileItem item=(FileItem) iter.next();
			if(item.isFormField()){
				
			}else{
				PlanDocument bean=new PlanDocument();
				System.out.println(bean.getId());
				String fileName=item.getName();
				fileSize=item.getSize();
				fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length());
				String prefix=System.currentTimeMillis()+"";
				File file=new File(request.getServletContext().getRealPath("/")+"planFileUpload\\"+type);
				if(!file.exists())
					file.mkdirs();
				File uploadedFile=new File(request.getServletContext().getRealPath("/")
						+"planFileUpload\\"
						+type
						+"\\"
						+prefix+fileName);
				item.write(uploadedFile);
				bean.setDocumentAddress("planFileUpload\\"+type+"\\"+prefix+fileName);
				bean.setUploadDate(new Timestamp(System.currentTimeMillis()));
				int i=0;
				while(fileSize>1024){
					fileSize=fileSize/1024;
					i++;
					if(i==4)
						break;
				}
				bean.setDocumentSize(Math.round(fileSize*100)/100+fileSizeUnit[i]);
				bean.setDocumentName(fileName);
				bean.setPlan(plan);
				bean.setDocumentType(fileName.substring(fileName.lastIndexOf(".")+1,fileName.length()));
				System.out.println(fileName+"===fgjhghj==");
				planDocumentService.save(bean);
				System.out.println("pass");
			}
		}
		model.addAttribute("id", id);
		model.addAttribute("type", type);
		model.addAttribute("flag", 2);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write("{\"rate\":"+request.getSession().getAttribute("proInfo")+"}");
	}
	
}
