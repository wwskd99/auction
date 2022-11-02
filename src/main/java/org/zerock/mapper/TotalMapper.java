package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Bid_historyVO;
import org.zerock.domain.ProductVO;

public interface TotalMapper {
	public List<Bid_historyVO> readTotalBid(String user_id);
	
}
