package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;

public interface ProductMapper {
	public List<ProductPicVO> piclist(int product_id);
	public int picCount(int product_id);
	public ProductVO read(int product_id);
	public void updateCP(@Param("product_id")int product_id,@Param("current_price")int current_price);
	public int readCP(int product_id);
	public void insertCP(@Param("product_id")int product_id,@Param("current_price")int current_price,@Param("user_id")String user_id);
	//current_price
	public String readCPU(int product_id);
	//current_price&user
}