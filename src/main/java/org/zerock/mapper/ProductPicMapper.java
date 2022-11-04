package org.zerock.mapper;

import org.zerock.domain.ProductPicVO;

public interface ProductPicMapper {
	
	public void RegistProductPic(ProductPicVO productPicVO);
	public ProductPicVO readProductPicOne(int product_id);
}
