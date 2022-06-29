package com.study.common.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.study.attach.vo.AttachVO;
import com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV;

@Service
public class StudyAttachUtils {
	
    @Value("#{util['file.upload.path']}")
    private String uploadPath; // 
	
	public List<AttachVO> getAttachListByMultiparts(MultipartFile[] boFiles, String category, String path) throws IOException {
		List<AttachVO> attaches = new ArrayList<AttachVO>();
			
		for(MultipartFile boFile : boFiles) {
			if(!boFile.isEmpty()) {
			AttachVO attach = getAttachByMultipart(boFile, category, path);
			attaches.add(attach);
			}
		}
		
		return attaches;
	}
	
	public AttachVO getAttachByMultipart(MultipartFile boFile, String category, String path) throws IOException {
		String fileName = UUID.randomUUID().toString(); // 랜덤값 생성해서 파일이름 같은 이름을 가진 파일을 만들지 않기위해 고유한 이름 만듬
		
		String filePath = uploadPath+File.separatorChar+path;
		// /home/pc52/upload/free /"free" 운영체제에 맞춰 만들어줌 
		
		FileUtils.copyInputStreamToFile(boFile.getInputStream()
				, new File(filePath, fileName)); // 여기서 실제로 파일저장
		
		AttachVO attach = new AttachVO();
		attach.setAtchCategory(category);
		attach.setAtchFileName(fileName);
		attach.setAtchOriginalName(boFile.getOriginalFilename());
		attach.setAtchFileSize(boFile.getSize()); // byte 형태//  1024MB >> 
	 	attach.setAtchFancySize(fancySize( boFile.getSize() ) ); // 뷰에서 볼 때 편하게 보기 위해
		attach.setAtchContentType(boFile.getContentType());
		attach.setAtchPath(filePath);
	 	
	 	return attach;
		
		
		
	}
	
	DecimalFormat df = new DecimalFormat("#,###.0");
	
	public String fancySize(long size) {
		if(size < 1024) return size + "B";
		if(size < 1024*1024) return df.format(size/1024.0) + "KB";
		if(size < 1024*1024*1024) return df.format(size/(1024.0 *1024.0)) + "KB";
		if(size < 1024*1024) return df.format(size/(1024.0*1024.0*1024.0)) + "GB";
				
		return "큰 파일";
	}
}