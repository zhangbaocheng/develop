package com.nanjingsubway.subway_lines.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nanjingsubway.subway_lines.model.SitesAtSameLinePassBy;
import com.nanjingsubway.subway_lines.model.SubwayLineSite;
import com.nanjingsubway.subway_lines.service.SubwayLinesService;

@Controller
@RequestMapping("subwayLines")
public class SubwayLinesController {
	
	@Autowired
	private SubwayLinesService subwayLinesService = null;
	
	
	@RequestMapping("findSubwayLines")
	public String findSubwayLines(){
		return "find_subway_lines/jsp/find_subway_lines";
	}
	
	@RequestMapping("findLines")
	@ResponseBody
	public String findLines(String lineStart,String lineEnd,Model model){
		List<TreeMap<Integer,String>> lineList = subwayLinesService.findLines(lineStart, lineEnd);
		System.out.println(lineList);
		return "";
	}
	
	@RequestMapping("findSitesPassBy")
	@ResponseBody
	public SitesAtSameLinePassBy findSitesPassBy(String siteStart,String siteEnd){
		
		List<String> lineStartList = subwayLinesService.findLineBySite(siteStart);//开始节点所在的线路
		List<String> lineEndList = subwayLinesService.findLineBySite(siteEnd);//结束节点所在的线路
		List<String> lineSameList = new ArrayList<>();
		lineSameList.addAll(lineStartList);
		List<SitesAtSameLinePassBy> sitesAtSameLinePassBies= new ArrayList<>();
		
		lineSameList.retainAll(lineEndList);//求交集
		if (lineSameList.size() == 0) {
			//出发站点和到达站点不在同一条线路上
			//找到经过的线路
			for (String lineStart : lineStartList) {
				for (String lineEnd : lineEndList) {
					//循环判断每一种线路
					System.out.println(lineStart + " : " + lineEnd);
					List<TreeMap<Integer,String>> lineList = subwayLinesService.findLines(lineStart, lineEnd);
					List<TreeMap<Integer,String>> lineListReverse = new ArrayList<>();
					if(lineList.get(0).get(1).equals(lineStart)){
						//正序
						System.out.println("正序"+lineList);
						for (TreeMap<Integer, String> treeMap : lineList) {
							System.out.println(treeMap);
//							1,3遍历  安德门，林场
							int size = treeMap.size();
							int currentLinePos = 1;
							List<SubwayLineSite> subwayLineSitesTransfered = 
							subwayLinesService.findSiteByLineAndTransferedLine(treeMap.get(currentLinePos), treeMap.get(currentLinePos+1));
							System.out.println("查找可换成的：" + subwayLineSitesTransfered);
							for (SubwayLineSite subwayLineSite : subwayLineSitesTransfered) {
								
								//找到当前所在的站点
//								siteName，lineNumber
								SubwayLineSite currentSite = subwayLinesService.findSiteBySiteName(siteStart, treeMap.get(currentLinePos));
								System.out.println("currentSite = "+currentSite);
								List<SubwayLineSite> subwayLineSitePassBy= 
										subwayLinesService.findSiteAtSameLinePassBy(currentSite.getSiteNumber(), subwayLineSite.getSiteNumber(), treeMap.get(currentLinePos));
										
								System.out.println("subwayLineSitePassBy = " + subwayLineSitePassBy);
								
								if (currentLinePos != size) {
									currentLinePos++;
									
								}
								
								
							}
							
						}
					}
					else{
						//倒叙
						System.out.println("倒叙");
						for (Map<Integer, String> linemap : lineList) {
							TreeMap<Integer, String> lineMapReverse = new TreeMap<Integer,String>(Collections.reverseOrder());
							lineMapReverse.putAll(linemap);
							lineListReverse.add(lineMapReverse);
						}
						System.out.println("倒序后的："+lineListReverse);
					}
					
					
				}
			}
			
		}
		else{
			//出发站点和到达站点在同一条线路上
			for (String lineSame : lineSameList) {
				SubwayLineSite siteStartObj = subwayLinesService.findSiteBySiteName(siteStart, lineSame);
				SubwayLineSite siteEndObj = subwayLinesService.findSiteBySiteName(siteEnd, lineSame);
				List<SubwayLineSite> subwayLineSitePassBy= 
				subwayLinesService.findSiteAtSameLinePassBy(siteStartObj.getSiteNumber(), siteEndObj.getSiteNumber(), siteStartObj.getLineNumber());
				
				SitesAtSameLinePassBy sitesAtSameLinePassBy = new SitesAtSameLinePassBy();
				sitesAtSameLinePassBy.setSubwayLineSites(subwayLineSitePassBy);
				sitesAtSameLinePassBy.setLineNumber(siteStartObj.getLineNumber());
				sitesAtSameLinePassBies.add(sitesAtSameLinePassBy);
				
			}
			
			
		}
//		System.out.println(sitesAtSameLinePassBies);
		SitesAtSameLinePassBy linePassBy = new SitesAtSameLinePassBy();
		if (sitesAtSameLinePassBies.size() == 1) {
			linePassBy = sitesAtSameLinePassBies.get(0);
		}
		else{
			SitesAtSameLinePassBy sameLinePassByLeast = sitesAtSameLinePassBies.get(0);
			for (SitesAtSameLinePassBy sitesAtSameLinePassBy : sitesAtSameLinePassBies) {
				if (sitesAtSameLinePassBy.getSubwayLineSites().size() < sameLinePassByLeast.getSubwayLineSites().size()) {
					sameLinePassByLeast = sitesAtSameLinePassBy;
				}
			}
			linePassBy = sameLinePassByLeast;
		}
		
		int lengthPassBy = linePassBy.getSubwayLineSites().size() - 1;
		float price = 0;
		if(lengthPassBy <= 8){
			price = 2;
		}
		else{
			if ((lengthPassBy-8) % 4 == 0) {
				price = 2 + (lengthPassBy-8)/4;
			}
			else {
				price = 2 + (lengthPassBy-8)/4 + 1;
			}
		}
		linePassBy.setPrice(price);
//		System.out.println(linePassBy);
		return linePassBy;
		
	}
	
	/**
	 * currentSiteStart:当前所在的站点名称
	 * 
	 * */
	/*
	@RequestMapping("test")
	public String test(String currentSiteStart){
		//正序
		List<TreeMap<Integer,String>> lineList = subwayLinesService.findLines(lineStart, lineEnd);
		System.out.println("正序"+lineList);//List<TreeMap<Integer,String>> lineList = subwayLinesService.findLines(lineStart, lineEnd);
		
		for (TreeMap<Integer, String> treeMap : lineList) {
			System.out.println(treeMap);//一个TreeMap相当于一条完整的线路更换
//			1,3遍历  安德门，林场
			int size = treeMap.size();//size=2
			int currentLinePos = 1;//当前所在的线路的Map的key
			
			//找到在当前线路上可以更换到下一个线路的站点
			List<SubwayLineSite> subwayLineSitesTransfered = 
			subwayLinesService.findSiteByLineAndTransferedLine(treeMap.get(currentLinePos), treeMap.get(currentLinePos+1));
			System.out.println("查找可换成的：" + subwayLineSitesTransfered);
			for (SubwayLineSite subwayLineSite : subwayLineSitesTransfered) {
				
				//找到当前所在的站点
//				siteName，lineNumber
				SubwayLineSite currentSite = subwayLinesService.findSiteBySiteName(currentSiteStart, treeMap.get(currentLinePos));
				
				//找到更换站点之前的所有的线路，排序已经排序过
				List<SubwayLineSite> subwayLineSitePassBy= 
						subwayLinesService.findSiteAtSameLinePassBy(currentSite.getSiteNumber(), subwayLineSite.getSiteNumber(), treeMap.get(currentLinePos));
						
				System.out.println("subwayLineSitePassBy = " + subwayLineSitePassBy);
				
				if (currentLinePos != size) {
					currentLinePos++;
					
				}
				
				
			}
			
		}
		
		return "";
	}
	*/
		
}
