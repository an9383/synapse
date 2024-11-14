package mes.web.ut;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.util.ZipSecureFile;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.rm.ProjectVo;

public class CustomerExcelReader {

	// 기구 엑셀 업로드
	public List<ProjectVo> projectBomMachineFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		ZipSecureFile.setMinInflateRatio(0);
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<ProjectVo> list = new ArrayList<ProjectVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int sheetIndex = 1;
				int rowindex = 4;
				int columnindex = 0;
				int realSheetCount = 0;
				String sheetNameList = "";
				
				//시트 수 확인
				int sheetCount = workbook.getNumberOfSheets();
				
				for(sheetIndex = 1; sheetIndex <sheetCount;sheetIndex++) {
					HSSFSheet sheet = workbook.getSheetAt(sheetIndex);
					HSSFRow headRow = sheet.getRow(2);
					//시트 숨김 여부
					if(workbook.getSheetVisibility(sheetIndex).toString().equals("VISIBLE")) {
						realSheetCount++;
						//시트 이름
						String sheetName = workbook.getSheetName(sheetIndex);
						//모듈 이름
						HSSFCell moduleCell = headRow.getCell(7);
						String moduleName = moduleCell.getStringCellValue();
						
						if(sheetNameList.equals("")) {
							sheetNameList = sheetName + "-" + moduleName;
						} else {
							sheetNameList += "%/%" + sheetName + "-" + moduleName;
						}
						
						// 행의 수
						int rows = sheet.getPhysicalNumberOfRows();
						FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
						for (rowindex = 4; rowindex < rows; rowindex++) {
							// 행을 읽는다
							HSSFRow row = sheet.getRow(rowindex);
							Row row2 = row;
							if (row != null && !row2.getZeroHeight()) {
								// 셀의 수
								ProjectVo[] vo = new ProjectVo[rows];
								vo[rowindex - 1] = new ProjectVo();
								vo[rowindex - 1].setModuleGubun(sheetName);
								vo[rowindex - 1].setModuleName(moduleName);
								int cells = row.getPhysicalNumberOfCells();
								boolean check = false;
								for (columnindex = 0; columnindex <= 18; columnindex++) {
									// 셀값을 읽는다
									HSSFCell cell = row.getCell(columnindex);
									String value = "";
									// 셀이 빈값일경우를 위한 널체크
									if (cell == null) {
										continue;
									} else {
										// 타입별로 내용 읽기
										switch (cell.getCellType()) {
										case FORMULA:
											//value = cell.getCellFormula() + "";
											if(evaluator.evaluateInCell(cell)!=null) {
												value = evaluator.evaluateInCell(cell) + "";	
											} else {
												value = cell.getCellFormula() + "";	
											}
											break;
										case NUMERIC:
											if (DateUtil.isCellDateFormatted(cell)) {
												SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
												value = formatter.format(cell.getDateCellValue()) + "";
											} else {
												double ddata = cell.getNumericCellValue();
												value = df.format(ddata) + "";
											}
											break;
										case STRING:
											value = cell.getStringCellValue() + "";
											break;
										case BLANK:
											value = "";
											break;
										case ERROR:
											value = cell.getErrorCellValue() + "";
											break;
										}

										switch (columnindex) {
										case 0:
											/*
											if(value.equals("TOP")) {
												vo[rowindex - 1].setPositionGubun("001");
											} else if(value.equals("BOTTOM")) {
												vo[rowindex - 1].setPositionGubun("002");
											} else {
												vo[rowindex - 1].setPositionGubun("");
											}
											*/
											//vo[rowindex - 1].setPositionGubun(value);
											if(value!=null && !value.equals("")) {
												check = true;
											} else {
												check = false;
											}
											break;
										case 1:
											vo[rowindex - 1].setPurchaseGubun(value);
											break;
										case 2:
											if(value.equals("가공")) {
												vo[rowindex - 1].setOrderGubun("001");
											} else if(value.equals("구매")) {
												vo[rowindex - 1].setOrderGubun("002");
											} else {
												vo[rowindex - 1].setOrderGubun("");
											}
											break;
										case 3:
											vo[rowindex - 1].setPartCd(value);
											break;
										case 4:
											vo[rowindex - 1].setPartNm(value);
											break;
										case 5:
											vo[rowindex - 1].setMaterial(value);
											break;
										case 6:
											vo[rowindex - 1].setSurfaceTreatment(value);
											break;
										case 7:
											vo[rowindex - 1].setPartDc(value);
											break;
										case 8:
											vo[rowindex - 1].setMaker(value);
											break;
										case 9:
											vo[rowindex - 1].setNeedQty(value);
											break;
										case 10:
											vo[rowindex - 1].setRemark(value);
											break;
										}
									}
								}
								if(check) {
									list.add(vo[rowindex - 1]);	
								}
							}
						}
					}
				}
				list.get(0).setSheetCount(Integer.toString(realSheetCount));
				list.get(0).setSheetNameList(sheetNameList);
				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int sheetIndex = 1;
				int rowindex = 4;
				int columnindex = 0;
				int realSheetCount = 0;
				String sheetNameList = "";
				
				//시트 수 확인
				int sheetCount = workbook2.getNumberOfSheets();
				
				for(sheetIndex = 1; sheetIndex <sheetCount;sheetIndex++) {
					XSSFSheet sheet = workbook2.getSheetAt(sheetIndex);
					XSSFRow headRow = sheet.getRow(2);
					if(workbook2.getSheetVisibility(sheetIndex).toString().equals("VISIBLE")) {
						realSheetCount++;
						//시트 이름
						String sheetName = workbook2.getSheetName(sheetIndex);
						System.out.println("시트 이름 : " + sheetName);
						//모듈 이름
						XSSFCell moduleCell = headRow.getCell(7);
						String moduleName = moduleCell.getStringCellValue();
						System.out.println("모듈 이름 : " + sheetName);
						if(sheetNameList.equals("")) {
							sheetNameList = sheetName + "-" + moduleName;
						} else {
							sheetNameList += "%/%" + sheetName + "-" + moduleName;
						}
						// 행의 수
						int rows = sheet.getPhysicalNumberOfRows();
						System.out.println("행의 수 : " + rows);
						FormulaEvaluator evaluator = workbook2.getCreationHelper().createFormulaEvaluator();
						for (rowindex = 4; rowindex < rows; rowindex++) {
							// 행을 읽는다
							XSSFRow row = sheet.getRow(rowindex);
							Row row2 = row;
							if (row != null && !row2.getZeroHeight()) {
								// 셀의 수
								ProjectVo[] vo = new ProjectVo[rows];
								vo[rowindex - 1] = new ProjectVo();
								vo[rowindex - 1].setModuleGubun(sheetName);
								vo[rowindex - 1].setModuleName(moduleName);
								int cells = row.getPhysicalNumberOfCells();
								boolean check = false;
								for (columnindex = 0; columnindex <= 18; columnindex++) {
									// 셀값을 읽는다
									XSSFCell cell = row.getCell(columnindex);
									String value = "";
									// 셀이 빈값일경우를 위한 널체크
									if (cell == null) {
										continue;
									} else {
										// 타입별로 내용 읽기
										switch (cell.getCellType()) {
										case FORMULA:
											if(evaluator.evaluateInCell(cell)!=null) {
												value = evaluator.evaluateInCell(cell) + "";	
											} else {
												value = cell.getCellFormula() + "";	
											}
											break;
										case NUMERIC:
											if (DateUtil.isCellDateFormatted(cell)) {
												SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
												value = formatter.format(cell.getDateCellValue()) + "";
											} else {
												double ddata = cell.getNumericCellValue();
												value = df.format(ddata) + "";
											}
											break;
										case STRING:
											value = cell.getStringCellValue() + "";
											break;
										case BLANK:
											value = "";
											break;
										case ERROR:
											value = cell.getErrorCellValue() + "";
											break;
										}

										switch (columnindex) {
										case 0:
											/*
											if(value.equals("TOP")) {
												vo[rowindex - 1].setPositionGubun("001");
											} else if(value.equals("BOTTOM")) {
												vo[rowindex - 1].setPositionGubun("002");
											} else {
												vo[rowindex - 1].setPositionGubun("");
											}
											*/
											//vo[rowindex - 1].setPositionGubun(value);
											System.out.println("맨 앞 : " + value);
											if(value!=null && !value.equals("")) {
												check = true;
											} else {
												check = false;
											}
											break;
										case 1:
											vo[rowindex - 1].setPurchaseGubun(value);
											break;
										case 2:
											if(value.equals("가공")) {
												vo[rowindex - 1].setOrderGubun("001");
											} else if(value.equals("구매")) {
												vo[rowindex - 1].setOrderGubun("002");
											} else {
												vo[rowindex - 1].setOrderGubun("");
											}
											break;
										case 3:
											vo[rowindex - 1].setPartCd(value);
											break;
										case 4:
											vo[rowindex - 1].setPartNm(value);
											break;
										case 5:
											vo[rowindex - 1].setMaterial(value);
											break;
										case 6:
											vo[rowindex - 1].setSurfaceTreatment(value);
											break;
										case 7:
											vo[rowindex - 1].setPartDc(value);
											break;
										case 8:
											vo[rowindex - 1].setMaker(value);
											break;
										case 9:
											vo[rowindex - 1].setNeedQty(value);
											break;
										case 10:
											vo[rowindex - 1].setRemark(value);
											break;
										}
									}
								}
								if(check) {
									list.add(vo[rowindex - 1]);	
								}
							}
						}
					}
				}
				list.get(0).setSheetCount(Integer.toString(realSheetCount));
				list.get(0).setSheetNameList(sheetNameList);
				
				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}
	
	// 광학 엑셀 업로드
	public List<ProjectVo> projectBomOpticsFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		ZipSecureFile.setMinInflateRatio(0);
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<ProjectVo> list = new ArrayList<ProjectVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int sheetIndex = 0;
				int rowindex = 4;
				int columnindex = 0;
				int realSheetCount = 0;
				String sheetNameList = "";
				
				//시트 수 확인
				int sheetCount = workbook.getNumberOfSheets();
				sheetCount = 1;
				
				for(sheetIndex = 0; sheetIndex <sheetCount;sheetIndex++) {
					HSSFSheet sheet = workbook.getSheetAt(sheetIndex);
					HSSFRow headRow = sheet.getRow(2);
					//시트 숨김 여부
					if(workbook.getSheetVisibility(sheetIndex).toString().equals("VISIBLE")) {
						realSheetCount++;
						//시트 이름
						String sheetName = workbook.getSheetName(sheetIndex);
						//모듈 이름
						HSSFCell moduleCell = headRow.getCell(6);
						String moduleName = moduleCell.getStringCellValue();
						
						if(sheetNameList.equals("")) {
							sheetNameList = sheetName + "-" + moduleName;
						} else {
							sheetNameList += "%/%" + sheetName + "-" + moduleName;
						}
						
						// 행의 수
						int rows = sheet.getPhysicalNumberOfRows();
						FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
						for (rowindex = 4; rowindex < rows; rowindex++) {
							// 행을 읽는다
							HSSFRow row = sheet.getRow(rowindex);
							Row row2 = row;
							if (row != null && !row2.getZeroHeight()) {
								// 셀의 수
								ProjectVo[] vo = new ProjectVo[rows];
								vo[rowindex - 1] = new ProjectVo();
								vo[rowindex - 1].setModuleGubun(sheetName);
								vo[rowindex - 1].setModuleName(moduleName);
								int cells = row.getPhysicalNumberOfCells();
								boolean check = false;
								for (columnindex = 0; columnindex <= 10; columnindex++) {
									// 셀값을 읽는다
									HSSFCell cell = row.getCell(columnindex);
									String value = "";
									// 셀이 빈값일경우를 위한 널체크
									if (cell == null) {
										continue;
									} else {
										// 타입별로 내용 읽기
										switch (cell.getCellType()) {
										case FORMULA:
											//value = cell.getCellFormula() + "";
											if(evaluator.evaluateInCell(cell)!=null) {
												value = evaluator.evaluateInCell(cell) + "";	
											} else {
												value = cell.getCellFormula() + "";	
											}
											break;
										case NUMERIC:
											if (DateUtil.isCellDateFormatted(cell)) {
												SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
												value = formatter.format(cell.getDateCellValue()) + "";
											} else {
												double ddata = cell.getNumericCellValue();
												value = df.format(ddata) + "";
											}
											break;
										case STRING:
											value = cell.getStringCellValue() + "";
											break;
										case BLANK:
											value = "";
											break;
										case ERROR:
											value = cell.getErrorCellValue() + "";
											break;
										}

										switch (columnindex) {
										case 0:
											vo[rowindex - 1].setPositionGubun(value);
											if(value!=null && !value.equals("")) {
												check = true;
											} else {
												check = false;
											}
											break;
										case 1:
											vo[rowindex - 1].setRowNumber(value);
											break;
										case 2:
											vo[rowindex - 1].setPurchaseGubun(value);
											break;
										case 3:
											vo[rowindex - 1].setPartCd(value);
											break;
										case 4:
											vo[rowindex - 1].setPartNm(value);
											break;
										case 5:
											vo[rowindex - 1].setSurfaceTreatment(value);
											break;
										case 6:
											vo[rowindex - 1].setPartDc(value);
											break;
										case 7:
											vo[rowindex - 1].setMaker(value);
											break;
										case 8:
											vo[rowindex - 1].setNeedQty(value);
											break;
										case 9:
											vo[rowindex - 1].setSupplier(value);
											break;
										case 10:
											vo[rowindex - 1].setRemark(value);
											break;
										}
									}
								}
								vo[rowindex - 1].setOrderGubun("002");
								if(check) {
									list.add(vo[rowindex - 1]);	
								}
							}
						}
					}
				}
				list.get(0).setSheetCount(Integer.toString(realSheetCount));
				list.get(0).setSheetNameList(sheetNameList);
				logger.info("list size = " + list.size());

				return list;
			} else {
				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int sheetIndex = 0;
				int rowindex = 4;
				int columnindex = 0;
				int realSheetCount = 0;
				String sheetNameList = "";
				
				//시트 수 확인
				int sheetCount = workbook2.getNumberOfSheets();
				
				for(sheetIndex = 0; sheetIndex <sheetCount;sheetIndex++) {
					XSSFSheet sheet = workbook2.getSheetAt(sheetIndex);
					XSSFRow headRow = sheet.getRow(2);
					//시트 숨김 여부
					
					if(workbook2.getSheetVisibility(sheetIndex).toString().equals("VISIBLE")) {
						realSheetCount++;
						//시트 이름
						String sheetName = workbook2.getSheetName(sheetIndex);
						//모듈 이름
						XSSFCell moduleCell = headRow.getCell(6);
						String moduleName = moduleCell.getStringCellValue();
						System.out.println("시트 이름 : " + sheetName);
						System.out.println("모듈 이름 : " + moduleName);						
						if(sheetNameList.equals("")) {
							sheetNameList = sheetName + "-" + moduleName;
						} else {
							sheetNameList += "%/%" + sheetName + "-" + moduleName;
						}
						// 행의 수
						int rows = sheet.getPhysicalNumberOfRows();
						FormulaEvaluator evaluator = workbook2.getCreationHelper().createFormulaEvaluator();
						for (rowindex = 4; rowindex < rows; rowindex++) {
							// 행을 읽는다
							XSSFRow row = sheet.getRow(rowindex);
							Row row2 = row;
							if (row != null && !row2.getZeroHeight()) {
								// 셀의 수
								ProjectVo[] vo = new ProjectVo[rows];
								vo[rowindex - 1] = new ProjectVo();
								vo[rowindex - 1].setModuleGubun(sheetName);
								vo[rowindex - 1].setModuleName(moduleName);
								int cells = row.getPhysicalNumberOfCells();
								boolean check = false;
								for (columnindex = 0; columnindex <= 10; columnindex++) {
									// 셀값을 읽는다
									XSSFCell cell = row.getCell(columnindex);
									String value = "";
									// 셀이 빈값일경우를 위한 널체크
									if (cell == null) {
										continue;
									} else {
										// 타입별로 내용 읽기
										switch (cell.getCellType()) {
										case FORMULA:
											if(evaluator.evaluateInCell(cell)!=null) {
												value = evaluator.evaluateInCell(cell) + "";	
											} else {
												value = cell.getCellFormula() + "";	
											}
											break;
										case NUMERIC:
											if (DateUtil.isCellDateFormatted(cell)) {
												SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
												value = formatter.format(cell.getDateCellValue()) + "";
											} else {
												double ddata = cell.getNumericCellValue();
												value = df.format(ddata) + "";
											}
											break;
										case STRING:
											value = cell.getStringCellValue() + "";
											break;
										case BLANK:
											value = "";
											break;
										case ERROR:
											value = cell.getErrorCellValue() + "";
											break;
										}

										switch (columnindex) {
										case 0:
											vo[rowindex - 1].setPositionGubun(value);
											if(value!=null && !value.equals("")) {
												check = true;
											} else {
												check = false;
											}
											break;
										case 1:
											vo[rowindex - 1].setRowNumber(value);
											break;
										case 2:
											vo[rowindex - 1].setPurchaseGubun(value);
											break;
										case 3:
											vo[rowindex - 1].setPartCd(value);
											break;
										case 4:
											vo[rowindex - 1].setPartNm(value);
											break;
										case 5:
											vo[rowindex - 1].setSurfaceTreatment(value);
											break;
										case 6:
											vo[rowindex - 1].setPartDc(value);
											break;
										case 7:
											vo[rowindex - 1].setMaker(value);
											break;
										case 8:
											vo[rowindex - 1].setNeedQty(value);
											break;
										case 9:
											vo[rowindex - 1].setSupplier(value);
											break;
										case 10:
											vo[rowindex - 1].setRemark(value);
											break;
										}
									}
								}
								vo[rowindex - 1].setOrderGubun("002");
								if(check) {
									list.add(vo[rowindex - 1]);	
								}
							}
						}
					}
				}
				list.get(0).setSheetCount(Integer.toString(realSheetCount));
				list.get(0).setSheetNameList(sheetNameList);
				
				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}
	
	
	// 전장 엑셀 업로드
	public List<ProjectVo> projectBomElectronicsFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		ZipSecureFile.setMinInflateRatio(0);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<ProjectVo> list = new ArrayList<ProjectVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int sheetIndex = 3;
				int rowindex = 4;
				int columnindex = 0;
				String sheetNameList = "";
				
				
				//시트 숨김 여부
				if(workbook.getSheetVisibility(sheetIndex).toString().equals("VISIBLE")) {
					sheetIndex++;
					HSSFSheet sheet = workbook.getSheetAt(sheetIndex);
					HSSFRow headRow = sheet.getRow(3);
					//시트 이름
					String sheetName = workbook.getSheetName(sheetIndex);
					//모듈 이름
					HSSFCell moduleCell = headRow.getCell(4);
					String moduleName = moduleCell.getStringCellValue();
					
					if(sheetNameList.equals("")) {
						sheetNameList = sheetName + "-" + moduleName;
					} else {
						sheetNameList += "%/%" + sheetName + "-" + moduleName;
					}
					
					// 행의 수
					int rows = sheet.getPhysicalNumberOfRows();
					FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
					for (rowindex = 5; rowindex < rows; rowindex++) {
						// 행을 읽는다
						HSSFRow row = sheet.getRow(rowindex);
						Row row2 = row;
						if (row != null && !row2.getZeroHeight()) {
							// 셀의 수
							ProjectVo[] vo = new ProjectVo[rows];
							vo[rowindex - 1] = new ProjectVo();
							vo[rowindex - 1].setModuleGubun(sheetName);
							vo[rowindex - 1].setModuleName(moduleName);
							int cells = row.getPhysicalNumberOfCells();
							boolean check = false;
							for (columnindex = 0; columnindex <= 11; columnindex++) {
								// 셀값을 읽는다
								HSSFCell cell = row.getCell(columnindex);
								String value = "";
								// 셀이 빈값일경우를 위한 널체크
								if (cell == null) {
									continue;
								} else {
									// 타입별로 내용 읽기
									switch (cell.getCellType()) {
									case FORMULA:
										//value = cell.getCellFormula() + "";
										if(evaluator.evaluateInCell(cell)!=null) {
											value = evaluator.evaluateInCell(cell) + "";	
										} else {
											value = cell.getCellFormula() + "";	
										}
										break;
									case NUMERIC:
										if (DateUtil.isCellDateFormatted(cell)) {
											SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
											value = formatter.format(cell.getDateCellValue()) + "";
										} else {
											double ddata = cell.getNumericCellValue();
											value = df.format(ddata) + "";
										}
										break;
									case STRING:
										value = cell.getStringCellValue() + "";
										break;
									case BLANK:
										value = "";
										break;
									case ERROR:
										value = cell.getErrorCellValue() + "";
										break;
									}

									switch (columnindex) {
									case 0:
										vo[rowindex - 1].setPositionGubun(value);
										if(value!=null && !value.equals("")) {
											check = true;
										} else {
											check = false;
										}
										break;
									case 1:
										vo[rowindex - 1].setRowNumber(value);
										break;
									case 2:
										vo[rowindex - 1].setPurchaseGubun(value);
										break;
									case 3:
										vo[rowindex - 1].setPartCd(value);
										break;
									case 4:
										vo[rowindex - 1].setPartNm(value);
										break;
									case 5:
										vo[rowindex - 1].setPurpose(value);
										break;
									case 6:
										vo[rowindex - 1].setSurfaceTreatment(value);
										break;
									case 7:
										vo[rowindex - 1].setPartDc(value);
										break;
									case 8:
										vo[rowindex - 1].setMaker(value);
										break;
									case 9:
										vo[rowindex - 1].setNeedQty(value);
										break;
									case 10:
										vo[rowindex - 1].setSupplier(value);
										break;
									case 11:
										vo[rowindex - 1].setRemark(value);
										break;
									}
								}
							}
							vo[rowindex - 1].setOrderGubun("002");
							if(check) {
								list.add(vo[rowindex - 1]);	
							}
						}
					}
				}
				list.get(0).setSheetCount(Integer.toString(1));
				list.get(0).setSheetNameList(sheetNameList);
				logger.info("list size = " + list.size());

				return list;
			} else {
				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int sheetIndex = 3;
				int rowindex = 4;
				int columnindex = 0;
				String sheetNameList = "";
				//시트 숨김 여부
				
				if(workbook2.getSheetVisibility(sheetIndex).toString().equals("HIDDEN")) {
					sheetIndex++;
				}
									
				XSSFSheet sheet = workbook2.getSheetAt(sheetIndex);
				XSSFRow headRow = sheet.getRow(3);
				//시트 이름
				String sheetName = workbook2.getSheetName(sheetIndex);
				XSSFCell moduleCell = headRow.getCell(4);
				String moduleName = moduleCell.getStringCellValue();
				
				if(sheetNameList.equals("")) {
					sheetNameList = sheetName + "-" + moduleName;
				} else {
					sheetNameList += "%/%" + sheetName + "-" + moduleName;
				}
				System.out.println(sheetNameList);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();
				for (rowindex = 5; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;
					if (row != null && !row2.getZeroHeight()) {
						// 셀의 수
						ProjectVo[] vo = new ProjectVo[rows];
						vo[rowindex - 1] = new ProjectVo();
						vo[rowindex - 1].setModuleGubun(sheetName);
						vo[rowindex - 1].setModuleName(moduleName);
						int cells = row.getPhysicalNumberOfCells();
						boolean check = false;
						System.out.println("");
						for (columnindex = 0; columnindex <= 11; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);
							String value = "";
							System.out.println("순서 : " + columnindex);
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									FormulaEvaluator evaluator = workbook2.getCreationHelper().createFormulaEvaluator();
									if(evaluator.evaluateInCell(cell)!=null) {
										value = evaluator.evaluateInCell(cell) + "";	
									} else {
										value = cell.getCellFormula() + "";	
									}
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}
									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								
								/*
								if(columnindex==6) {
									BufferedReader reader = new BufferedReader(new StringReader(value));
							        while (true) {
							         String line = reader.readLine();
							         if (line == "" || line == null)
							          break;
							         System.out.println(line);
							         System.out.println("/r/n");
							        }
								}
								*/

								switch (columnindex) {
								case 0:
									System.out.println("position은 " + value);
									vo[rowindex - 1].setPositionGubun(value);
									if(value!=null && !value.equals("")) {
										check = true;
									} else {
										check = false;
									}
									break;
								case 1:
									System.out.println("No은 " + value);
									vo[rowindex - 1].setRowNumber(value);
									break;
								case 2:
									System.out.println("구매 구분은 " + value);
									vo[rowindex - 1].setPurchaseGubun(value);
									break;
								case 3:
									System.out.println("cd는 " + value);
									vo[rowindex - 1].setPartCd(value);
									break;
								case 4:
									System.out.println("name은 " + value);
									vo[rowindex - 1].setPartNm(value);
									break;
								case 5:
									System.out.println("purpose는 " + value);
									vo[rowindex - 1].setPurpose(value);
									break;
								case 6:
									System.out.println("surface는 " + value);
									vo[rowindex - 1].setSurfaceTreatment(value);
									break;
								case 7:
									System.out.println("규격은 " + value);
									vo[rowindex - 1].setPartDc(value);
									break;
								case 8:
									System.out.println("maker는 " + value);
									vo[rowindex - 1].setMaker(value);
									break;
								case 9:
									System.out.println("수량은 " + value);
									vo[rowindex - 1].setNeedQty(value);
									break;
								case 10:
									System.out.println("업체는 " + value);
									vo[rowindex - 1].setSupplier(value);
									break;
								case 11:
									System.out.println("remark는 " + value);
									vo[rowindex - 1].setRemark(value);
									break;
								}
							}
						}
						System.out.println("");
						vo[rowindex - 1].setOrderGubun("002");
						if(check) {
							list.add(vo[rowindex - 1]);	
						}
					}
				}
			
				list.get(0).setSheetCount(Integer.toString(1));
				list.get(0).setSheetNameList(sheetNameList);
				
				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}
	
	// 전장 엑셀 업로드
	public List<DealCorpAdmVo> dealCorpExcelRead(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		ZipSecureFile.setMinInflateRatio(0);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<DealCorpAdmVo> list = new ArrayList<DealCorpAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int sheetIndex = 3;
				int rowindex = 4;
				int columnindex = 0;
				String sheetNameList = "";
				
				
				//시트 숨김 여부
				if(workbook.getSheetVisibility(sheetIndex).toString().equals("VISIBLE")) {
					sheetIndex++;
					HSSFSheet sheet = workbook.getSheetAt(sheetIndex);
					HSSFRow headRow = sheet.getRow(3);
					//시트 이름
					String sheetName = workbook.getSheetName(sheetIndex);
					//모듈 이름
					HSSFCell moduleCell = headRow.getCell(4);
					String moduleName = moduleCell.getStringCellValue();
					
					if(sheetNameList.equals("")) {
						sheetNameList = sheetName + "-" + moduleName;
					} else {
						sheetNameList += "%/%" + sheetName + "-" + moduleName;
					}
					
					// 행의 수
					int rows = sheet.getPhysicalNumberOfRows();
					FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
					for (rowindex = 2; rowindex < rows; rowindex++) {
						// 행을 읽는다
						HSSFRow row = sheet.getRow(rowindex);
						Row row2 = row;
						if (row != null && !row2.getZeroHeight()) {
							// 셀의 수
							DealCorpAdmVo[] vo = new DealCorpAdmVo[rows];
							vo[rowindex - 1] = new DealCorpAdmVo();
							vo[rowindex - 1].setDealGubun(sheetName);
							vo[rowindex - 1].setFileName(moduleName);
							int cells = row.getPhysicalNumberOfCells();
							boolean check = false;
							for (columnindex = 0; columnindex <= 32; columnindex++) {
								// 셀값을 읽는다
								HSSFCell cell = row.getCell(columnindex);
								String value = "";
								// 셀이 빈값일경우를 위한 널체크
								if (cell == null) {
									continue;
								} else {
									// 타입별로 내용 읽기
									switch (cell.getCellType()) {
									case FORMULA:
										//value = cell.getCellFormula() + "";
										if(evaluator.evaluateInCell(cell)!=null) {
											value = evaluator.evaluateInCell(cell) + "";	
										} else {
											value = cell.getCellFormula() + "";	
										}
										break;
									case NUMERIC:
										if (DateUtil.isCellDateFormatted(cell)) {
											SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
											value = formatter.format(cell.getDateCellValue()) + "";
										} else {
											double ddata = cell.getNumericCellValue();
											value = df.format(ddata) + "";
										}
										break;
									case STRING:
										value = cell.getStringCellValue() + "";
										break;
									case BLANK:
										value = "";
										break;
									case ERROR:
										value = cell.getErrorCellValue() + "";
										break;
									}

									switch (columnindex) {
									case 0:
										break;
									case 1:
										System.out.println("No은 " + value);
										break;
									case 2:
										System.out.println("구매 구분은 " + value);
										vo[rowindex - 1].setDealGubun(value);									
										break;
									case 4: 
										System.out.println("거래처 코드는 "+value);
										vo[rowindex - 1].setDealCorpCd(value);
										break;
									case 5:
										System.out.println("업체명은 " + value);
										if(!value.equals("")&&value!=null) {
											vo[rowindex - 1].setDealCorpNm(value);
										} else {
											check=false;
										}
										break;
									case 6:
										System.out.println("약칭은 " + value);
										vo[rowindex - 1].setInitial(value);
										break;
									case 7:
										System.out.println("대표자는 " + value);
										vo[rowindex - 1].setRepresentative(value);
										break;
									case 8:
										System.out.println("사업자번호는 " + value);
										vo[rowindex - 1].setCompanyNumber(value);
										break;
									case 9:
										System.out.println("대표품목은 " + value);
										vo[rowindex - 1].setMasterItem(value);
										break;
									case 10:
										System.out.println("업태는 " + value);
										vo[rowindex - 1].setBusinessStatus(value);
										break;
									case 11:
										System.out.println("종목은 " + value);
										vo[rowindex - 1].setProduceType(value);
										break;
									case 12:
										System.out.println("우편번호는 " + value);
										vo[rowindex - 1].setPostNumber(value);
										break;
									case 13:
										System.out.println("국내/해외 " + value);
										vo[rowindex - 1].setAbroadGubun(value);
										break;
									case 14:
										System.out.println("주소는 "+value);
										vo[rowindex - 1].setAddressAdm(value);
										break;
									case 15:
										System.out.println("상세주소는 "+value);
										vo[rowindex - 1].setAddressDtl(value);
										break;
									case 16:
										System.out.println("납품처주소는 "+value);
										vo[rowindex - 1].setDealCorpAddress(value);
										break;
									case 17:
										System.out.println("중요도는 "+value);
										vo[rowindex - 1].setImportantLevel(value);
										break;
									case 18:
										System.out.println("회사구분은 "+value);
										vo[rowindex - 1].setCompanyGubun(value);
										break;
									case 19:
										System.out.println("전화번호는 "+value);
										vo[rowindex - 1].setPhoneNumber(value);
										break;
									case 20:
										System.out.println("팩스번호는 "+value);
										vo[rowindex - 1].setFaxNumber(value);
										break;
									case 21:
										System.out.println("본사영업담당은 "+value);
										vo[rowindex - 1].setSalesManagerNm(value);
										break;
									case 22:
										System.out.println("거래처 담당부서는 "+value);
										vo[rowindex - 1].setChargeDepartment(value);
										break;
									case 23:
										System.out.println("거래처 담당자명은 "+value);
										vo[rowindex - 1].setChargeName(value);
										break;
									case 24:
										System.out.println("거래처 담당자 전화번호는 "+value);
										vo[rowindex - 1].setChargePhoneNumber(value);
										break;
									case 25:
										System.out.println("거래처 담당자 이메일은 "+value);
										vo[rowindex - 1].setChargeEmail(value);
										break;
									case 30:
										System.out.println("결제구분은 "+value);
										vo[rowindex - 1].setPaymentInfo(value);
										break;
									case 31:
										System.out.println("거래 상태는 "+value);
										vo[rowindex - 1].setDealCorpStatus(value);
										break;
									case 32:
										System.out.println("비고는 "+value);
										vo[rowindex - 1].setDealCorpDesc(value);
										break;
									}
								}
							}

							list.add(vo[rowindex - 1]);	
							
						}
					}
				}
//				list.get(0).setSheetCount(Integer.toString(1));
//				list.get(0).setSheetNameList(sheetNameList);
				logger.info("list size = " + list.size());

				return list;
			} else {
				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int sheetIndex = 0;
				int rowindex = 4;
				int columnindex = 0;
				String sheetNameList = "";
				//시트 숨김 여부
				
//				if(workbook2.getSheetVisibility(sheetIndex).toString().equals("HIDDEN")) {
//					sheetIndex++;
//				}
									
				XSSFSheet sheet = workbook2.getSheetAt(sheetIndex);
				XSSFRow headRow = sheet.getRow(3);
				//시트 이름
				String sheetName = workbook2.getSheetName(sheetIndex);
				XSSFCell moduleCell = headRow.getCell(4);
				String moduleName = moduleCell.getStringCellValue();
				
				if(sheetNameList.equals("")) {
					sheetNameList = sheetName + "-" + moduleName;
				} else {
					sheetNameList += "%/%" + sheetName + "-" + moduleName;
				}
				System.out.println(sheetNameList);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();
				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;
					if (row != null && !row2.getZeroHeight()) {
						// 셀의 수
						DealCorpAdmVo[] vo = new DealCorpAdmVo[rows];
						vo[rowindex - 1] = new DealCorpAdmVo();
//						vo[rowindex - 1].setModuleGubun(sheetName);
//						vo[rowindex - 1].setModuleName(moduleName);
						int cells = row.getPhysicalNumberOfCells();
						boolean check = true;
						System.out.println("");
						for (columnindex = 0; columnindex <= 32; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);
							String value = "";
							System.out.println("순서 : " + columnindex);
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									FormulaEvaluator evaluator = workbook2.getCreationHelper().createFormulaEvaluator();
									if(evaluator.evaluateInCell(cell)!=null) {
										value = evaluator.evaluateInCell(cell) + "";	
									} else {
										value = cell.getCellFormula() + "";	
									}
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}
									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								
								/*
								if(columnindex==6) {
									BufferedReader reader = new BufferedReader(new StringReader(value));
							        while (true) {
							         String line = reader.readLine();
							         if (line == "" || line == null)
							          break;
							         System.out.println(line);
							         System.out.println("/r/n");
							        }
								}
								*/

								switch (columnindex) {
								case 0:
									break;
								case 1:
									System.out.println("No은 " + value);
									break;
								case 2:
									System.out.println("구매 구분은 " + value);
									vo[rowindex - 1].setDealGubun(value);									
									break;
								case 3:
									System.out.println("사업장은 "+value);
									vo[rowindex - 1].setWorkPlaceNm(value);
									break;
								case 4: 
									System.out.println("거래처 코드는 "+value);
									vo[rowindex - 1].setDealCorpCd(value);
									break;
								case 5:
									System.out.println("업체명은 " + value);
									if(!value.equals("")&&value!=null) {
										vo[rowindex - 1].setDealCorpNm(value);
									} else {
										check=false;
									}
									break;
								case 6:
									System.out.println("약칭은 " + value);
									vo[rowindex - 1].setInitial(value);
									break;
								case 7:
									System.out.println("대표자는 " + value);
									vo[rowindex - 1].setRepresentative(value);
									break;
								case 8:
									System.out.println("사업자번호는 " + value);
									vo[rowindex - 1].setCompanyNumber(value);
									break;
								case 9:
									System.out.println("대표품목은 " + value);
									vo[rowindex - 1].setMasterItem(value);
									break;
								case 10:
									System.out.println("업태는 " + value);
									vo[rowindex - 1].setBusinessStatus(value);
									break;
								case 11:
									System.out.println("종목은 " + value);
									vo[rowindex - 1].setProduceType(value);
									break;
								case 12:
									System.out.println("우편번호는 " + value);
									vo[rowindex - 1].setPostNumber(value);
									break;
								case 13:
									System.out.println("국내/해외 " + value);
									vo[rowindex - 1].setAbroadGubun(value);
									break;
								case 14:
									System.out.println("주소는 "+value);
									vo[rowindex - 1].setAddressAdm(value);
									break;
								case 15:
									System.out.println("상세주소는 "+value);
									vo[rowindex - 1].setAddressDtl(value);
									break;
								case 16:
									System.out.println("납품처주소는 "+value);
									vo[rowindex - 1].setDealCorpAddress(value);
									break;
								case 17:
									System.out.println("중요도는 "+value);
									vo[rowindex - 1].setImportantLevel(value);
									break;
								case 18:
									System.out.println("회사구분은 "+value);
									vo[rowindex - 1].setCompanyGubun(value);
									break;
								case 19:
									System.out.println("전화번호는 "+value);
									vo[rowindex - 1].setPhoneNumber(value);
									break;
								case 20:
									System.out.println("팩스번호는 "+value);
									vo[rowindex - 1].setFaxNumber(value);
									break;
								case 21:
									System.out.println("본사영업담당은 "+value);
									vo[rowindex - 1].setSalesManagerNm(value);
									break;
								case 22:
									System.out.println("거래처 담당부서는 "+value);
									vo[rowindex - 1].setChargeDepartment(value);
									break;
								case 23:
									System.out.println("거래처 담당자명은 "+value);
									vo[rowindex - 1].setChargeName(value);
									break;
								case 24:
									System.out.println("거래처 담당자 전화번호는 "+value);
									vo[rowindex - 1].setChargePhoneNumber(value);
									break;
								case 25:
									System.out.println("거래처 담당자 이메일은 "+value);
									vo[rowindex - 1].setChargeEmail(value);
									break;
								case 30:
									System.out.println("결제구분은 "+value);
									vo[rowindex - 1].setPaymentInfo(value);
									break;
								case 31:
									System.out.println("거래 상태는 "+value);
									vo[rowindex - 1].setDealCorpStatus(value);
									break;
								case 32:
									System.out.println("비고는 "+value);
									vo[rowindex - 1].setDealCorpDesc(value);
									break;
								}
							}
						}
						System.out.println("");
						if(check) {
							list.add(vo[rowindex - 1]);
						}
						
					}
				}
			
//				list.get(0).setSheetCount(Integer.toString(1));
//				list.get(0).setSheetNameList(sheetNameList);
				
				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}
	
}
