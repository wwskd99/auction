package org.zerock.service;

import java.util.List;

import org.zerock.domain.ProductPicVO;
import org.zerock.domain.ProductVO;

public interface ProductService {
	
	public List<ProductPicVO> piclistRead(int product_id);
	public int picCountRead(int product_id);
	public ProductVO productRead(int product_id);
}
