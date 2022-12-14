package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;
import org.zerock.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	private ProductMapper pMapper;
	
	@Override
	public List<ProductPicVO> piclistRead(int product_id) {
		log.info("----- ProductServiceImpl piclistRead Start -----");
		
		
		
		log.info("----- ProductServiceImpl piclistRead end -----");
		return pMapper.piclist(product_id);
		
	}
	@Override
	public int picCountRead(int product_id) {
		
		return pMapper.picCount(product_id);
	}
	
	@Override
	public ProductVO productRead(int product_id) {
		
		return pMapper.read(product_id);
	}
}
