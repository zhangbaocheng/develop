package com.nanjingsubway.subway_lines.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nanjingsubway.subway_lines.dao.SubwayLinesDao;
import com.nanjingsubway.subway_lines.model.SubwayLineSite;

@Service
public class SubwayLinesService {
	@Autowired
	private SubwayLinesDao subwayLinesDao = null;
	
	public List<TreeMap<Integer,String>> findLines(String lineStart,String lineEnd){
		
		List<TreeMap<Integer,String>> lineList = new ArrayList<>();
		String lineResult = subwayLinesDao.findLines(lineStart, lineEnd);
		String[] allLines = lineResult.split(";");
		for (String lines : allLines) {
			TreeMap<Integer,String> lineMap = new TreeMap<>();
			String[] line = lines.split("->");
			Integer lineMapKey = 1;
			for (String lin : line) {
				lineMap.put(lineMapKey++, lin);
			}
			lineList.add(lineMap);
		}
		
		return lineList;
	}
	
	public List<String> findLineBySite(String site){
		return subwayLinesDao.findLineBySite(site);
	}
	
	public SubwayLineSite findSiteBySiteName(String siteName,String lineNumber){
		return subwayLinesDao.findSiteBySiteName(siteName, lineNumber);
	}
	
	public List<SubwayLineSite> findSiteAtSameLinePassBy(Integer startNumber,Integer endNumber,String lineNumber){
		Map<String, Object> paramMap = new HashMap<>();
		if(startNumber < endNumber){
			paramMap.put("smallNumber", startNumber);
			paramMap.put("bigNumber", endNumber);
			paramMap.put("sort", "asc");
		}
		else{
			paramMap.put("smallNumber", endNumber);
			paramMap.put("bigNumber", startNumber);
			paramMap.put("sort", "desc");
		}
		
		paramMap.put("lineNumber", lineNumber);
		return subwayLinesDao.findSiteAtSameLinePassBy(paramMap);
	}
	
	public List<SubwayLineSite> findSiteByLineAndTransferedLine(String lineNumber,String transfered_line){
		return subwayLinesDao.findSiteByLineAndTransferedLine(lineNumber, transfered_line);
	}
}
