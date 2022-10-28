package org.zerock.domain;

import lombok.Data;

@Data
public class TradeVO {
	private String user_id;
	private int total_count_s;
	private int fail_count_s;
	private int total_count_b;
	private int fail_count_b;
}
