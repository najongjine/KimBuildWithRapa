package com.open.cmmn.excel;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.AbstractView;

import com.open.cmmn.util.StringUtil;
import com.open.vo.Msm0089VO;

import net.sf.jxls.transformer.Configuration;
import net.sf.jxls.transformer.XLSTransformer;

@Service
public class ExcelView extends AbstractView {

	//private Logger logger = LoggerFactory.getLogger(this.getClass());

	public ExcelView() {
		this.setContentType("application/vnd.ms-excel");
	}
	
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProperties;

	
	/**
	 * @uml.property  name="excelPath"
	 */
	@Value("excel")
	private String excelPath;
	private static SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.view.document.AbstractExcelView#buildExcelDocument(java.util.Map, org.apache.poi.hssf.usermodel.HSSFWorkbook, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@SuppressWarnings("rawtypes")
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, SQLException, Exception, InvalidFormatException {
		// TODO Auto-generated method stub	
		XLSTransformer xls = new XLSTransformer();
		Configuration cf = xls.getConfiguration();
		cf.setUTF16(true);	// 
		xls.setConfiguration(cf);

		InputStream is = null;
		FileInputStream fis = null;

		try {
			String imgChk = (String)model.get("imgChk");
			is = readTemplate((String)model.get("source") );
			Map<String, Object> beans = new HashMap<String, Object>();

			SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			beans.put("date", df.format( new Date() ) );
			beans.put("now", new Date() );
		
			Set key = model.keySet();
			for (Iterator iterator = key.iterator(); iterator.hasNext();) {
			    String keyName = (String) iterator.next();
			    beans.put( keyName,  model.get(keyName) );
			    
			    if( keyName.endsWith("List") ) {
			        List list = (List)model.get(keyName);
			    	if( list.size() == 0 ) {
						String str = "<script>alert('목록이 존재하지 않습니다.'); history.back(-1);</script>";
						response.setContentType("text/html; charset=utf-8");
						response.getOutputStream().write(str.getBytes("UTF-8"));
						return;
			    	}			
			    }
			}
			
			if(imgChk != null && !imgChk.equals("")){
				XSSFWorkbook wb10 = new XSSFWorkbook(is);
		        XSSFSheet sheet10 = wb10.getSheetAt(0);
		        
		        @SuppressWarnings("unchecked")
				List<Msm0089VO> imgList = (List<Msm0089VO>) model.get("imgList");
		        for (Msm0089VO img : imgList) {
		        	if(!StringUtil.nullConvert(img.getImg1()).equals("")){
		        		drawSheet10( sheet10, wb10, img.getImg1(),img.getExcelRow(),"20");
		        	}
		        	if(!StringUtil.nullConvert(img.getImg2()).equals("")){
		        		drawSheet10( sheet10, wb10, img.getImg2(),img.getExcelRow(),"21");
		        	}
		        	if(!StringUtil.nullConvert(img.getImg3()).equals("")){
		        		drawSheet10( sheet10, wb10, img.getImg3(),img.getExcelRow(),"22");
		        	}
		        	if(!StringUtil.nullConvert(img.getImg4()).equals("")){
		        		drawSheet10( sheet10, wb10, img.getImg4(),img.getExcelRow(),"23");
		        	}
		        	if(!StringUtil.nullConvert(img.getImg5()).equals("")){
		        		drawSheet10( sheet10, wb10, img.getImg5(),img.getExcelRow(),"24");
		        	}
		        	if(!StringUtil.nullConvert(img.getImg6()).equals("")){
		        		drawSheet10( sheet10, wb10, img.getImg6(),img.getExcelRow(),"25");
		        	}
		        	if(!StringUtil.nullConvert(img.getImg7()).equals("")){
		        		drawSheet10( sheet10, wb10, img.getImg7(),img.getExcelRow(),"26");
		        	}
		        	if(!StringUtil.nullConvert(img.getImg8()).equals("")){
		        		drawSheet10( sheet10, wb10, img.getImg8(),img.getExcelRow(),"41");
		        	}
				}
		        
		        
		        // Write the file out.
		        String CONTEXT_PATH = getServletContext().getRealPath("");
		        String templateFilePath = fileUploadProperties.getProperty("file.exlImg.path") + "\\" +StringUtil.getTimeStamp();
		        FileOutputStream fileOut10 = (FileOutputStream) outTemplateNew(templateFilePath); // 이미지 삽입된 엑셀파일
		        wb10.write(fileOut10);
		        fileOut10.close();
		        
		        Thread.sleep(1000);
		        is = readTemplateNew(templateFilePath);
			}
			
			writeWorkbook(sf.format(new Date() ) + "_" + (String)model.get("target"), response, xls.transformXLS(is, beans) );

		}finally {
			if( is != null ) {
				try {
					is.close();

				}catch (IOException e) {
					//////System.out.println("Exception occured");
				}
			}
		}
	}

	private InputStream readTemplate(String finalTemplate) throws FileNotFoundException {
		System.out.println("## readTemplate");
    	String CONTEXT_PATH = getServletContext().getRealPath("");
    	System.out.println("## CONTEXT_PATH:"+CONTEXT_PATH);
        String templateFilePath = CONTEXT_PATH+ File.separator + excelPath + File.separator + finalTemplate;
        System.out.println("## templateFilePath:"+templateFilePath);
	    //////System.out.println("templateFilePath ================>"+templateFilePath);
        return new FileInputStream(templateFilePath);
    }
	 private InputStream readTemplateNew(String finalTemplate) throws FileNotFoundException {
		 System.out.println("## readTemplateNew");
        return new FileInputStream(finalTemplate);
    }
    
    private OutputStream outTemplateNew(String finalTemplate) throws FileNotFoundException {
    	System.out.println("## outTemplateNew");
    	return new FileOutputStream(finalTemplate);
    }

    private void writeWorkbook(
        String filename, HttpServletResponse response, org.apache.poi.ss.usermodel.Workbook workbook)
        throws IOException {
    	System.out.println("## writeWorkbook");
        response.setHeader("Content-disposition", "attachment;filename=" + encodeFileName(filename + ".xlsx"));
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "-1");
        workbook.write(response.getOutputStream());
    }

    private String encodeFileName(String filename) {
    	System.out.println("## encodeFileName");
        try {
            return URLEncoder.encode(filename, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
    
    private static void drawSheet10( XSSFSheet sheet, XSSFWorkbook wb, String imgUrl, String row, String col ) throws IOException {
    	System.out.println("## drawSheet10");
        // Create the drawing patriarch.  This is the top level container for
        // all shapes. This will clear out any existing shapes for that sheet.
    	CreationHelper helper = wb.getCreationHelper();
        Drawing drawing = sheet.createDrawingPatriarch();
        ClientAnchor anchor = helper.createClientAnchor();
        int sRow = Integer.parseInt(row);
        int sCol = Integer.parseInt(col);
        anchor.setAnchorType( ClientAnchor.MOVE_AND_RESIZE );
        anchor.setCol1(sCol);
        anchor.setRow1(sRow);
        anchor.setCol2(sCol+1);
        anchor.setRow2(sRow+1);
        
        /*anchor.setDx1(0);
        anchor.setDx2(1000);
        anchor.setDy1(0);
        anchor.setDy2(1000);*/
        drawing.createPicture(anchor, loadPicture10( imgUrl, wb )); // 삽입 할 이미지
    }

    private static int loadPicture10( String path, XSSFWorkbook wb ) throws IOException {
        int pictureIndex;
        FileInputStream fis = null;
        ByteArrayOutputStream bos = null;
        System.out.println("path :: "+path);
        File file = new File(path);
        try {
            fis = new FileInputStream(file);
            bos = new ByteArrayOutputStream( );
            int c;
            while ( (c = fis.read()) != -1) {
                bos.write( c );
            }
            pictureIndex = wb.addPicture( bos.toByteArray(), HSSFWorkbook.PICTURE_TYPE_PNG  );
        } finally {
            if (fis != null) fis.close();
            if (bos != null) bos.close();
        }
        return pictureIndex;
    }
    
    
    
}
