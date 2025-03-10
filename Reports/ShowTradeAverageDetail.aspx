<%@ page language="C#" autoeventwireup="true" inherits="Reports_ShowTradeAverageDetail, App_Web_xpx38is4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .clear{ clear:both;}
        .txt_left { text-align:left;}
        .txt_right { text-align:right;}	  
        .cellHeader { padding:2px; height: 23px; border: solid .1pt #aaa;font-size: 13px; background-color: #CCC;
                        font-weight:bold; text-align:center; float:left;}                
        .cellRecord { padding:2px; border: solid .1pt  #aaa;font-size: 12px; background-color: #eee; float:left;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 0px; margin: 0px;">
            <asp:Repeater ID="rptExchAvgTrade" runat="Server">
                <HeaderTemplate>
                    <div>
                        <div class="cellHeader" style="width: 85px">
                            TradeDate</div>
                        <div class="cellHeader" style="width: 120px">
                            Scrip</div>
                        <div class="cellHeader" style="width: 100px">
                            OrderNumber</div>
                        <div class="cellHeader" style="width: 70px">
                            OrderTime</div>
                        <div class="cellHeader" style="width: 70px">
                            TradeNumber</div>
                        <div class="cellHeader" style="width: 70px">
                            TradeTime</div>
                        <div class="cellHeader" style="width: 60px">
                            Buy/Sell</div>
                        <div class="cellHeader" style="width: 75px">
                            Quantity</div>
                        <div class="cellHeader" style="width: 70px">
                            UnitPrice</div>
                        <div class="cellHeader" style="width: 80px">
                            MarketValue</div>
                    </div>
                    <div class="clear">
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div>
                        <div class="cellRecord" style="width: 85px">
                            <%#Eval("TradeDate")%>
                        </div>
                        <div class="cellRecord" style="width: 120px">
                            <%#Eval("Scrip")%>
                        </div>
                        <div class="cellRecord" style="width: 100px">
                            <%#Eval("OrderNumber")%>
                        </div>
                        <div class="cellRecord" style="width: 70px">
                            <%#Eval("OrderTime")%>
                        </div>
                        <div class="cellRecord" style="width: 70px">
                            <%#Eval("TradeNumber")%>
                        </div>
                        <div class="cellRecord" style="width: 70px">
                            <%#Eval("TradeTime")%>
                        </div>
                        <div class="cellRecord" style="width: 60px">
                            <%#Eval("[Buy/Sell]")%>
                        </div>
                        <div class="cellRecord txt_right" style="width: 75px">
                            <%#Eval("Quantity")%>
                        </div>
                        <div class="cellRecord txt_right" style="width: 70px">
                            <%#Eval("UnitPrice")%>
                        </div>
                        <div class="cellRecord txt_right" style="width: 80px">
                            <%#Eval("MarketValue")%>
                        </div>
                    </div>
                </ItemTemplate>
                <SeparatorTemplate>
                    <div class="clear">
                    </div>
                </SeparatorTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
