package com.nanjingsubway.subway_lines.controller;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.nanjingsubway.subway_lines.model.LineNumberPassBy;
import com.nanjingsubway.subway_lines.model.SubwayLineSite;

public class Test1 {
	
	Map<String,LineNumberPassBy> lines = new TreeMap<>();//所有的线路
	TreeMap<Integer, String> linesPassByMap = new TreeMap<>();//经过的线路Map
	List<TreeMap<Integer, String>> linesPassByMapLines = new ArrayList<>();//经过的线路所有可能性
	Integer linesPassByMapKey = 1;//Map对应的键
	
	public void test(){
		fuzhi();
		
		findLinesPassBy("1","2",linesPassByMap);
		
		
	}
	
	public List<TreeMap<Integer, String>> findLinesPassBy(String lineStart,String lineEnd,TreeMap<Integer, String> linesPassByMap){
		lines.get(lineStart).setIsErgodic(true);//开始线路已经遍历过
		if(lineStart.equals(lineEnd)){
			linesPassByMap.put(linesPassByMapKey++, lineStart);
			linesPassByMapLines.add(linesPassByMap);
			return linesPassByMapLines;
		}
		else {
			//查找lineStart所在的线路中可以换乘的站点，得到的结果是一个List，就是下面的list
			List<SubwayLineSite> subwayLineSites = new ArrayList<>();
			
			for (SubwayLineSite subwayLineSite : subwayLineSites) {
				String[] transferedLines = subwayLineSite.getTransferedLines().split("~");//开始线路中可以换乘的站点
				if(transferedLines.length > 1){
					//长度大于1，就表示有多条线路组合，就要new出多个TreeMap
					for (String tran : transferedLines) {
						if(!lines.get(tran).getIsErgodic()){	//如果没有遍历过，进行遍历					
							lines.get(tran).setIsErgodic(true);//设置遍历过
							TreeMap<Integer, String> otherTreeMap = new TreeMap<>();
							otherTreeMap.putAll(linesPassByMap);
							findLinesPassBy(tran,lineEnd,otherTreeMap);
						}
					}
				}
				else{//只有一个换乘的线路
					if(!lines.get(transferedLines[0]).getIsErgodic()){	//如果没有遍历过，进行遍历					
						lines.get(transferedLines[0]).setIsErgodic(true);//设置遍历过
						linesPassByMap.put(linesPassByMapKey++, transferedLines[0]);
						findLinesPassBy(transferedLines[0],lineEnd,linesPassByMap);
					}
				}
				
			}
		}
		
		return null;
	}
	
	
	public void fuzhi(){
		lines.put("1",new LineNumberPassBy("1", false));
		lines.put("2",new LineNumberPassBy("2", false));
		lines.put("3",new LineNumberPassBy("3", false));
		lines.put("4",new LineNumberPassBy("4", false));
		lines.put("s1",new LineNumberPassBy("s1", false));
		lines.put("s8",new LineNumberPassBy("s8", false));
		lines.put("10",new LineNumberPassBy("10", false));

	}
}
