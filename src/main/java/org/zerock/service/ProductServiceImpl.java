package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
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
		
		return pMapper.readProduct(product_id);
	}
	@Override
	public void currentPriceUpdate(int product_id, int current_price) {
		pMapper.updateCP(product_id, current_price);
	}
	
	@Override
	public int currentPriceRead(int product_id) {
		
		return pMapper.readCP(product_id);
	}
	
	
	@Override
	public void currentPriceInsert(int product_id, int current_price, String user_id) {
		
		pMapper.insertCP(product_id, current_price, user_id);
	}
	
	@Override
	public String currentPriceUserRead(int product_id) {
		
		return pMapper.readCPU(product_id);
	}
	
	// 아래 동길
	@Override
	public void register(ProductVO product) {
		log.info("register..." + product);
		pMapper.insertSelectKey(product);

	}


	@Override
	public boolean modify(ProductVO product) {
		log.info("modify..." + product);
		return pMapper.update(product) == 1;
	}

	@Override
	public boolean remove(int product_id) {
		log.info("remove..." + product_id);
		return pMapper.delete(product_id) == 1;
	}

	@Override
	public List<ProductVO> getList() {
		log.info("getList");
		return pMapper.getList();
	}	
	
	@Override
	public List<ProductVO> searchList(Criteria cri) {
		
		return pMapper.searchList(cri);
	}
}
