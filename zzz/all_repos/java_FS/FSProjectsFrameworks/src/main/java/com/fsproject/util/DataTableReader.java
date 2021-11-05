package com.fsproject.util;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import cucumber.api.DataTable;
import cucumber.api.Transformer;
import cucumber.runtime.ParameterInfo;
import cucumber.runtime.xstream.LocalizedXStreams;
import cucumber.runtime.table.TableConverter;
import gherkin.formatter.model.Comment;
import gherkin.formatter.model.DataTableRow;

public class DataTableReader extends Transformer<DataTable>{
	@Override
	public DataTable transform(String filePath) {
		ExcelReader excelReader=new ExcelReader(filePath);
		List<List<String>>excelData=excelReader.readExcel();
		
		List<DataTableRow>dataTableRows=new ArrayList<>();
		int line=1;
		for(List<String>list:excelData) {
			Comment comment=new Comment("", line);
			DataTableRow tableRow=new DataTableRow(Arrays.asList(comment),list,line++);
			dataTableRows.add(tableRow);
			
		}
		ParameterInfo parameterInfo=new ParameterInfo(null,null,null,null);
		TableConverter tableConverter=new TableConverter(new LocalizedXStreams(Thread.currentThread().getContextClassLoader()).get(Locale.getDefault()),parameterInfo);
		DataTable table=new DataTable(dataTableRows,tableConverter);
		return table;
	}
}