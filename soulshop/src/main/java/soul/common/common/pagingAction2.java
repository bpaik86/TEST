package soul.common.common;

public class pagingAction2 {

	private int currentPage2;   // ����������
	private int totalCount2;	 // ��ü �Խù� ��
	private int totalPage2;	 // ��ü ������ ��
	private int blockCount2;	 // �� ��������  �Խù��� ��
	private int blockPage2;	 // �� ȭ�鿡 ������ ������ ��
	private int startCount2;	 // �� ���������� ������ �Խñ��� ���� ��ȣ
	private int endCount2;	 // �� ���������� ������ �Խñ��� �� ��ȣ
	private int startPage2;	 // ���� ������
	private int endPage2;	 // ������ ������
	private String actionName;

	private StringBuffer pagingHtml2;

	// ����¡ ������
	public pagingAction2(int currentPage2, int totalCount2, int blockCount2,
			int blockPage2, String actionName) {

		this.blockCount2 = blockCount2;
		this.blockPage2 = blockPage2;
		this.currentPage2 = currentPage2;
		this.totalCount2 = totalCount2;
		

		// ��ü ������ ��
		totalPage2 = (int) Math.ceil((double) totalCount2 / blockCount2);
		if (totalPage2 == 0) {
			totalPage2 = 1;
		}

		// ���� �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if (currentPage2 > totalPage2) {
			currentPage2 = totalPage2;
		}

		// ���� �������� ó���� ������ ���� ��ȣ ��������.
		startCount2 = (currentPage2 - 1) * blockCount2;
		endCount2 = startCount2 + blockCount2 - 1;

		// ���� �������� ������ ������ �� ���ϱ�.
		startPage2 = (int) ((currentPage2 - 1) / blockPage2) * blockPage2 + 1;
		endPage2 = startPage2 + blockPage2 - 1;

		// ������ �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if (endPage2 > totalPage2) {
			endPage2 = totalPage2;
		}

		// ���� block ������
		pagingHtml2 = new StringBuffer();
		if (currentPage2 > blockPage2) {
			pagingHtml2.append("<a href=" + "/first/faq" + ".soul?currentPage2="
					+ (startPage2 - 1) + ">");
			pagingHtml2.append("이전");
			pagingHtml2.append("</a>");
		}

		pagingHtml2.append("&nbsp;|&nbsp;");

		//������ ��ȣ.���� �������� ���������� �����ϰ� ��ũ�� ����.
		for (int i = startPage2; i <= endPage2; i++) {
			if (i > totalPage2) {
				break;
			}
			if (i == currentPage2) {
				pagingHtml2.append("&nbsp;<b> <font color='red'>");
				pagingHtml2.append(i);
				pagingHtml2.append("</font></b>");
			} else {
				pagingHtml2
						.append("&nbsp;<a href=" + "/first/faq" + ".soul?currentPage2=");
				pagingHtml2.append(i);
				pagingHtml2.append(">");
				pagingHtml2.append(i);
				pagingHtml2.append("</a>");
			}

			pagingHtml2.append("&nbsp;");
		}

		pagingHtml2.append("&nbsp;&nbsp;|&nbsp;&nbsp;");

		// ���� block ������
		if (totalPage2 - startPage2 >= blockPage2) {
			pagingHtml2.append("<a href=" + "/first/faq" + ".soul?currentPage2="
					+ (endPage2 + 1) + ">");
			pagingHtml2.append("다음");
			pagingHtml2.append("</a>");
		}
	}

	
	public int getCurrentPage2() {
		return currentPage2;
	}

	public void setCurrentPage2(int currentPage2) {
		this.currentPage2 = currentPage2;
	}

	public int getTotalCount2() {
		return totalCount2;
	}

	public void setTotalCount2(int totalCount2) {
		this.totalCount2 = totalCount2;
	}

	public int getTotalPage2() {
		return totalPage2;
	}

	public void setTotalPage2(int totalPage2) {
		this.totalPage2 = totalPage2;
	}

	public int getBlockCount2() {
		return blockCount2;
	}

	public void setBlockCount2(int blockCount2) {
		this.blockCount2 = blockCount2;
	}

	public int getBlockPage2() {
		return blockPage2;
	}

	public void setBlockPage2(int blockPage2) {
		this.blockPage2 = blockPage2;
	}

	public int getStartCount2() {
		return startCount2;
	}

	public void setStartCount2(int startCount2) {
		this.startCount2 = startCount2;
	}

	public int getEndCount2() {
		return endCount2;
	}

	public void setEndCount2(int endCount2) {
		this.endCount2 = endCount2;
	}

	public int getStartPage2() {
		return startPage2;
	}

	public void setStartPage2(int startPage2) {
		this.startPage2 = startPage2;
	}

	public int getEndPage2() {
		return endPage2;
	}

	public void setEndPage2(int endPage2) {
		this.endPage2 = endPage2;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public StringBuffer getPagingHtml2() {
		return pagingHtml2;
	}

	public void setPagingHtml2(StringBuffer pagingHtml2) {
		this.pagingHtml2 = pagingHtml2;
	}


}