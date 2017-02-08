<%@page language="java" contentType="text/html;charset=utf-8"%>
<%@page import="com.caipiao.pay.yeepay.PaymentForOnlineService,com.caipiao.pay.yeepay.RefundResult;"%>
<%!	String formatString(String text){ 
			if(text == null) {
				return ""; 
			}
			return text;
		}
%>
<%
	request.setCharacterEncoding("UTF-8");
	String pb_TrxId     	= formatString(request.getParameter("pb_TrxId"));   	//鏄撳疂浜ゆ槗娴佹按鍙?
	String p3_Amt     		= formatString(request.getParameter("p3_Amt"));		//閫€娆鹃噾棰?
	String p4_Cur     		= formatString(request.getParameter("p4_Cur"));		//浜ゆ槗甯佺
	String p5_Desc     		= formatString(request.getParameter("p5_Desc"));		//閫€娆捐鏄?
	//new String(formatString(request.getParameter("p5_Desc")).getBytes("iso-8859-1"),"gbk");//涓枃杞爜鐨勪緥瀛?
	try {
		RefundResult rr = PaymentForOnlineService.refundByTrxId(pb_TrxId,p3_Amt,p4_Cur,p5_Desc);	// 璋冪敤鍚庡彴澶栫悊鏌ヨ鏂规硶
		out.println("涓氬姟绫诲瀷 [r0_Cmd:" + rr.getR0_Cmd() + "]<br>");
		out.println("鏌ヨ缁撴灉 [r1_Code:" + rr.getR1_Code() + "]<br>");
		out.println("鏄撳疂鏀粯浜ゆ槗娴佹按鍙?[r2_TrxId:" + rr.getR2_TrxId() + "]<br>");
		out.println("鏀粯閲戦 [r3_Amt:" + rr.getR3_Amt() + "]<br>");
		out.println("浜ゆ槗甯佺 [r4_Cur:" + rr.getR4_Cur() + "]<br>");
	} catch(Exception e) {
		//byte[] by = e.getMessage().getBytes("UTF-8");
		
		//String errMsg = new String(by,"GBK");
		out.println("Refund fail:" + e.getMessage());
	}
%>

