package com.fsproject.util;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/*import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;*/

public class ExcelReader {
    String filePath;
	public ExcelReader(String filePath) {
		this.filePath=filePath;
	}
	public List<List<String>> readExcel() {
		List<List<String>>data=new ArrayList<List<String>>();
		/*
		 * try {
		 * 
		 * FileInputStream fin=new FileInputStream(filePath); try { XSSFWorkbook wb=new
		 * XSSFWorkbook(fin); XSSFSheet sheet=wb.getSheetAt(0); int
		 * row=sheet.getLastRowNum(); for(int i=0;i<row;i++) { int
		 * column=sheet.getRow(i).getLastCellNum(); List<String>data1=new
		 * ArrayList<String>(); for(int j=0;j<column;j++) {
		 * data1.add(sheet.getRow(i).getCell(j).getStringCellValue()); }
		 * data.add(data1); }
		 * 
		 * 
		 * } catch (IOException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * 
		 * } catch (FileNotFoundException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		return data;
		
		
	}

}
