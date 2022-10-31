package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Bid_historyVO;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;

public interface ProductMapper {
	public void registProductPic (ProductPicVO productpic);
	public void registProductSK(ProductVO product);	
	public void registProduct (ProductVO product);
	public List<ProductPicVO> piclist(int product_id);
	public int picCount(int product_id);
	public ProductVO readProduct(int product_id);
	public void updateCP(@Param("product_id")int product_id,@Param("current_price")int current_price);
	public int readCP(int product_id);
	public void insertCP(@Param("product_id")int product_id,@Param("current_price")int current_price,@Param("user_id")String user_id);
	public String readCPU(int product_id);

	
	
	// 아래 동길
	public List<ProductVO> getList();

	
	public int delete(Integer product_id);
	public int update(ProductVO product);
	public ProductVO read(int product_id);
	
	
	// 호준
	public List<Bid_historyVO> readBidList(String user_id);
	
	
}
