package org.zerock.service;

import java.util.List;

import org.zerock.domain.Bid_historyVO;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;

public interface ProductService {
	
	public List<ProductPicVO> piclistRead(int product_id);
	public int picCountRead(int product_id);
	public ProductVO productRead(int product_id);
	public void currentPriceUpdate(int product_id, int current_price);
	public int currentPriceRead(int product_id);
	public void currentPriceInsert(int product_id, int current_price,String user_id);
	public String currentPriceUserRead(int product_id);
	
	
	public List<Bid_historyVO> readBidList(String user_id);
	
	// 아래 동길
	public void register(ProductVO product);
	public ProductVO get(int product_id);
	public boolean modify(ProductVO product);
	public boolean remove(int product_id);
	public List<ProductVO> getList();
	public ProductVO read(int product_id);
	
	
}
