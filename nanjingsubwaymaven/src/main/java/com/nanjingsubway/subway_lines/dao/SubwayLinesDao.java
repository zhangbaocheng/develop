package com.nanjingsubway.subway_lines.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nanjingsubway.subway_lines.model.SubwayLineSite;

public interface SubwayLinesDao {
	String findLines(@Param("lineStart") String lineStart,@Param("lineEnd")String lineEnd);
	List<String> findLineBySite(@Param("site")String site);
	SubwayLineSite findSiteBySiteName(@Param("siteName") String siteName,@Param("lineNumber") String lineNumber);
	List<SubwayLineSite> findSiteAtSameLinePassBy(Map<String, Object> paramMap);
	
	List<SubwayLineSite> findSiteByLineAndTransferedLine(
			@Param("lineNumber")String lineNumber,@Param("transfered_line")String transfered_line);
}
