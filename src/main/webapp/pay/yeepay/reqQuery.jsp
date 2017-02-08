<%@page language="java" contentType="text/html;charset=utf-8"%>
<%@page import="com.caipiao.pay.yeepay.PaymentForOnlineService,com.caipiao.pay.yeepay.QueryResult"%>
<%!	String formatString(String text){ if(text == null) return "";  return text;}%>
<%
	String p2_Order   = formatString(request.getParameter("p2_Order"));     			// 鍟嗗瑕佹煡璇㈢殑浜ゆ槗瀹氬崟鍙?
	try {
		QueryResult qr = PaymentForOnlineService.queryByOrder(p2_Order);	// 璋冪敤鍚庡彴澶栫悊鏌ヨ鏂规硶
		out.println("涓氬姟绫诲瀷 [r0_Cmd:" + qr.getR0_Cmd() + "]<br>");
		out.println("鏌ヨ缁撴灉 [r1_Code:" + qr.getR1_Code() + "]<br>");
		out.println("鏄撳疂鏀粯浜ゆ槗娴佹按鍙?[r2_TrxId:" + qr.getR2_TrxId() + "]<br>");
		out.println("鏀粯閲戦 [r3_Amt:" + qr.getR3_Amt() + "]<br>");
		out.println("浜ゆ槗甯佺 [r4_Cur:" + qr.getR4_Cur() + "]<br>");
		out.println("鍟嗗搧鍚嶇О [r5_Pid:" + qr.getR5_Pid() + "]<br>");
		out.println("鍟嗘埛璁㈠崟鍙?[r6_Order:" + qr.getR6_Order() + "]<br>");
		out.println("鍟嗘埛鎵╁睍淇℃伅 [r8_MP:" +  qr.getR8_MP() + "]<br>");
		out.println("鏀粯鐘舵€?[rb_PayStatus:" +  qr.getRb_PayStatus() + "]<br>");
		out.println("宸查€€娆炬鏁?[rc_RefundCount:" + qr.getRc_RefundCount() + "]<br>");
		out.println("宸查€€娆鹃噾棰?[rd_RefundAmt:" + qr.getRd_RefundAmt() + "]<br>");
	} catch(Exception e) {
		out.println(e.getMessage());
	}
%>