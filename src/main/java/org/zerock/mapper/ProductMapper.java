package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Bid_historyVO;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;

public interface ProductMapper {
	public List<ProductPicVO> piclist(int product_id);
	public int picCount(int product_id);
	public ProductVO readProduct(int product_id);
	public void updateCP(@Param("product_id")int product_id,@Param("current_price")int current_price);
	public int readCP(int product_id);
	public void insertCP(@Param("product_id")int product_id,@Param("current_price")int current_price,@Param("user_id")String user_id);
	//current_price
	public String readCPU(int product_id);
	//current_price&user
	
	public List<Bid_historyVO> readBidList(String user_id);
	
	// 아래 동길
	public List<ProductVO> getList();
	public void insert (ProductVO product);
	public void insertSelectKey(ProductVO product);	
	public int delete(Integer product_id);
	public int update(ProductVO product);
	public ProductVO read(int product_id);
	
	
}
