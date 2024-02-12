package com.board.goods;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsVO {

	private int gid, gprice, gqty;
	private String gcate, gname, gimg, gimgdtl, gshow, gdel, dname;
	private Date gupdate;
}
