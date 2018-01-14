package com.itheima.anli06_utils;

import java.util.List;

public class Pager<T> {
		private int total;//总数量,需要从数据库查
		private List<T> rows;//数据集合,需要从数据库查
		
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
		public List<T> getRows() {
			return rows;
		}
		public void setRows(List<T> rows) {
			this.rows = rows;
		}
}
