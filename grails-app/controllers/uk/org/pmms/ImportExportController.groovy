package uk.org.pmms

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.codehaus.groovy.grails.web.json.JSONArray
import org.grails.plugins.excelimport.*
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import pl.touk.excel.export.WebXlsxExporter

import grails.converters.JSON

class ImportExportController {
 def excelImportService
 def docx4jService
 def CMISService

  def index() {
 }
 
  def upload(Object obj) {
	  def headers = grailsApplication.getDomainClass(obj.class).persistentProperties.collect { it.name }
	  def columns = [:]
	  def letter = 'A'
	  headers.each{ field ->
		  columns.put(letter , field)
		  letter++
	  }
  Map CONFIG_BOOK_COLUMN_MAP = [
     sheet:'Report',
     startRow: 1,
     columnMap: columns
    ]


  MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
  CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("file");

  Workbook workbook = WorkbookFactory.create(file.inputStream)
 //Iterate through bookList and create/persists your domain instances
  def objectList = excelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP)
  	objectList.each { Map objParamMap ->
    //new Person (objParamMap).save(flush: true, failOnError: true)
		  def instance = obj.class.classLoader.loadClass((String) obj.class)?.newInstance()
		  instance.properties = objParamMap
		  instance.save(flush:true, failonError: true)
		  
  }
	  redirect (controller: 'client', action: 'index')
	  //render columns
 }
  
  def download(){
	 def headers = grailsApplication.getDomainClass(params.className).persistentProperties.collect { it.name }
	 
	  
	  new WebXlsxExporter().with {
		  setResponseHeaders(response)
		  fillHeader(headers)
		  //add(products, withProperties)
		  save(response.outputStream)
	  }
	 
  }
  def exportWord() {
	 def output =  docx4jService.exportWord(Person.list())
	 
	 response.setHeader("Content-disposition", "attachment; filename=output.docx");
	 response.setContentType("application/vnd.openxmlformats-officedocument.wordprocessingml.document")
	 response.outputStream << output
	  
  }
  
  def downloadPropertyTemplate() {
	  def headers = ['Property ID', 'Property Type','Unit No', 'Address 1', 'Address 2', 'Town', 'County', 'Post Code', 'Country']
	 
	   WebXlsxExporter webXlsxExporter = new WebXlsxExporter()
	   webXlsxExporter.setWorksheetName('Properties')
	   webXlsxExporter.with {
		  setResponseHeaders(response)
		  fillHeader(headers)
		  //add(products, withProperties)
		  save(response.outputStream)
	  }
  }
  def uploadProperties() {
	 
	  def columns = ['A':'propertyId', 'B':'propertyType','C':'unitNo', 'D':'address1', 'E':'address2', 'F':'town', 'G':'county', 'H':'postCode', 'I':'country']
	 
  Map CONFIG_BOOK_COLUMN_MAP = [
	 sheet: 'Properties',
	 startRow: 1,
	 columnMap: columns
	]


  MultipartHttpServletRequest mpr = (MultipartHttpServletRequest)request;
  CommonsMultipartFile file = (CommonsMultipartFile) mpr.getFile("file");

  Workbook workbook = WorkbookFactory.create(file.inputStream)
 //Iterate through bookList and create/persists your domain instances
  def propertyList = excelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP)
	  propertyList.each { Map objParamMap ->
	def address = new Address(objParamMap)
	//address.unitNo = formatNumber(number: objParamMap['unitNo'], type: 'number', maxFractionDigits: 0)
	address.unitNo = (String) objParamMap['unitNo']
	address.save(flush:true, failOnError: true)
	def prop = new Property(objParamMap)
	prop.client = Client.get(params.id)
	prop.address = address
	prop.repoFolderId = CMISService.createFolder(prop.propertyId, prop.client.repoFolderId, '')
	prop.save(flush: true, failOnError: true)
		  
  }
	  redirect (controller: 'client', action: 'show', id: params.id)
	  //render columns
 }
  def exportJsonToExcel(){
	  
	  JSONArray jsonArray = new JSONArray(params.headers)
	  JSONArray jsonArray2 = new JSONArray(params.data)
	   def headers = []
	   for (int i=0; i<jsonArray.length(); i++) {
		   headers.add( jsonArray.getString(i) );
	   }

	   WebXlsxExporter webXlsxExporter = new WebXlsxExporter()
	   webXlsxExporter.setWorksheetName(params.sheetName)
	   webXlsxExporter.with {
		  setResponseHeaders(response)
		  fillHeader(headers)
		  jsonArray2.eachWithIndex() {rowData, i ->
			  def row = []
			  jsonArray.each() {header ->
				  row.push(rowData[header])
			  }
			  fillRow(row,i+1)
		  }
		  
		  save(response.outputStream)
	  }
  }
  def exportJsonToPDF(){
	  JSONArray jsonArray = new JSONArray(params.headers)
	  JSONArray jsonArray2 = new JSONArray(params.data)
	   def headers = []
	   def data = []
	   for (int i=0; i<jsonArray.length(); i++) {
		   headers.add( jsonArray.getString(i) );
	   }
	   jsonArray2.eachWithIndex() {rowData, i ->
		   def row = []
		   jsonArray.each() {header ->
			   row.push(rowData[header])
		   }
		   data.push(row)
	   }
	   def logoFile = new File(request.getSession().getServletContext().getRealPath("/images/PMMS Letterhead.png"))
	   
	  //render (template:'pdfTable', model: [headers: headers, data: data, sheetName: params.fileName, logo: logoFile.bytes])
	  
	  renderPdf(template: 'pdfTable',  model: [headers: jsonArray, data: data, sheetName: params.fileName, logo: logoFile.bytes], filename:params.fileName)
  }
}
