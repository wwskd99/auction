package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;

public interface ProductMapper {
	public List<ProductPicVO> piclist(int product_id);
	public int picCount(int product_id);
	public ProductVO read(int product_id);
}
