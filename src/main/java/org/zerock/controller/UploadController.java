package org.zerock.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.ProductPicVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/upload/*")
//@AllArgsConstructor
public class UploadController {

	
		@PostMapping("/uploadImages")
		public ResponseEntity<List<ProductPicVO>> uploadImages(@RequestParam("uploadImgs")MultipartFile[] uploadFile, Model model){			
			String uploadFolder = "C:\\auction\\upload";
			String voUploadFolder = "/upload";
			List<ProductPicVO> picList = new ArrayList<ProductPicVO>();
			
			
			for(MultipartFile multipartFile : uploadFile) {
				ProductPicVO productPic = new ProductPicVO();
				String fileName = multipartFile.getOriginalFilename();
				productPic.setPicture_name(fileName);
				productPic.setPicture_path(voUploadFolder);
				
				
				log.info("파일명 : " + multipartFile.getOriginalFilename());
				log.info("파일크기 : " + multipartFile.getSize());
				
				File saveFile = new File(uploadFolder, fileName);
				try {
					picList.add(productPic);
					multipartFile.transferTo(saveFile);
				}catch(Exception e) {
					log.info("파일 저장중 예외발생");
				}
			}
			
			model.addAttribute("imageList", picList);
			
			picList.forEach(s->System.out.println(s));
			
			return new ResponseEntity<List<ProductPicVO>>(picList, HttpStatus.OK);
				
		}
	
}
