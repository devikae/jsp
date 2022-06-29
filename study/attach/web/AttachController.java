package com.study.attach.web;

import java.io.File;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.study.attach.service.IAttachService;
import com.study.attach.vo.AttachVO;
import com.study.exception.BizException;
import com.study.exception.BizNotEffectedException;
import com.study.exception.BizNotFoundException;

@RestController // ( responsebody + controller) 
public class AttachController {
	
	@Inject
	IAttachService attachService;
	
	@RequestMapping("/attach/download/[0-9]{1,16}")
	public void attachDownload(@PathVariable("atch") int atchNo, HttpServletResponse resp) throws BizException {
		try {
			
		
			
		AttachVO atch = attachService.getAttach(atchNo);
		String fileName = atch.getAtchFileName();
		String originalName = atch.getAtchOriginalName();
		String filePath = atch.getAtchPath();
		
		File f = new File(filePath, fileName);
		if (!f.isFile()) {
			throw new BizNotFoundException("해당 첨부파일이 존재하지 않습니다.");
		}
		// 다운로드를 위한 헤더 생성
		resp.setHeader("Content-Type", "application/octet-stream;");	// 다운로드를 위한 헤더 
		resp.setHeader("Content-Disposition", "attachment;filename=\"" + originalName + "\";");
		resp.setHeader("Content-Transfer-Encoding", "binary;");
		// 왼쪽 하단에 다운로드표시, 파일이름 설정
		
		resp.setContentLength((int) f.length()); // 진행율
		
		resp.setHeader("Pragma", "no-cache;"); // 권고사항, HTTP1.0버전 이전 
		resp.setHeader("Expires", "-1;"); // 만료기간, -1은 기한없음 
		
		
		// 저장된 파일을 응답객체의 스트림으로 내보내기,  resp의 outputStream에  해당파일을 복사
		FileUtils.copyFile(f, resp.getOutputStream()); // 파일을 resp에 
		resp.getOutputStream().close();
		attachService.increaseDownHit(atchNo);
		}catch (BizNotFoundException e) {
			e.printMessage(resp, "해당 첨부파일이 존재하지 않습니다.");
		}catch (BizNotEffectedException e) {
			e.printStackTrace(); //거의 일어나지않기때문에...
		}catch (IOException e) {
			resp.reset();
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
	}
}
}
