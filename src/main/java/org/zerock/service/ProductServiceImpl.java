package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Bid_historyVO;
import org.zerock.domain.GPSVO;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;
import org.zerock.mapper.GPSMapper;
import org.zerock.mapper.ProductMapper;
import org.zerock.mapper.ProductPicMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {
	
	private GPSMapper gpsMapper;
	private ProductMapper pMapper;
	private ProductPicMapper pPicMapper;
	
	
	@Override
	public List<ProductPicVO> piclistRead(int product_id) {
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
	
	@Override
	public void productRegist(ProductVO product) {
		
		
		if (product.getNeighborhood() != null) {
			pMapper.registProductNeighborhoodSK(product);
		}else {
			pMapper.registProductSK(product);
		}
		product.getProductPic().forEach(productPic -> {
			productPic.setProduct_id(product.getProduct_id());
			pPicMapper.RegistProductPic(productPic);
		});
		

	}
	
	public void productGPSRegist(GPSVO gpsVo) {
		gpsMapper.registProductGPS(gpsVo);
	}

	
	// 아래 동길
	
	
	

	@Override
	public ProductVO get(int product_id) {
		log.info("get..." + product_id);
		return pMapper.read(product_id);
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
	public ProductVO read(int product_id) {
		
		return pMapper.read(product_id);
	}
	
	
	// 호준
	@Override
	public List<Bid_historyVO> readBidList(String user_id) {
		log.info("userid: " + user_id);
		return pMapper.readBidList(user_id);
	}
}
