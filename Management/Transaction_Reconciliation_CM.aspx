<%@ page language="C#" autoeventwireup="true" inherits="management_Transaction_Reconciliation_CM, App_Web_psdiigfa" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Transaction Reconciliation CM Segment</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet"/>
    <script language="javascript" type="text/javascript">

        function SignOff()
        {
            window.parent.SignOff();
        }
        function pageload()
        {
        height()
        }
        
        function height()
        {
    
            if(document.body.scrollHeight>=500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
        }     
        
        function ShowHideFilter(obj1,obj2)
        {
//        alert('hi');
//        alert(obj1);
//        alert(obj2);
           if(obj1 == 'cust')
               gridCust.PerformCallback(obj1+'~'+obj2);
           else if(obj1 == 'prod')
               gridProd.PerformCallback(obj1+'~'+obj2);
           else if(obj1 == 'file')
               gridFile.PerformCallback(obj1+'~'+obj2);    
               
        }
        
        function OnMoreInfoClick(obj1,obj2,obj3,obj4,obj5)
        {
//            alert(obj1);
              var url='frm_Demat_RectifyCustomer.aspx?Id='+obj1+'&DP_Client='+obj2+'&SettNumType='+obj3+'&ISIN='+obj4+'&Qty='+obj5;
              parent.OnMoreInfoClick(url,"Rectify Customer",'940px','450px',"Y");
        }
        function callback()
        {        
            gridCust.PerformCallback('all~');
            gridProd.PerformCallback('all~');
            gridFile.PerformCallback('all~');
        }
        function RectifyScripClick(obj1,obj2,obj3,obj4,obj5)
        {
        
            var url='frm_Demat_RectifyISIN.aspx?Id='+obj1+'&DP_Client='+obj2+'&SettNumType='+obj3+'&ISIN='+obj4+'&Qty='+obj5;
            parent.OnMoreInfoClick(url,"Rectify Scrip",'940px','450px',"Y");
        }
</script>
</head>

<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">

    
    <form id="form1a" runat="server">
        <div>
            <table class="TableMain100" >
            <tr>
                <td>
                
                </td>
            </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server"
                            ActiveTabIndex="1" ClientInstanceName="page"
                            Font-Size="10px" Width="100%" BackColor="#DDECFE">
                            <TabPages>
                                <dxtc:TabPage Text="CustomerID">
<ContentCollection>
<dxw:ContentControl runat="server"><table><tr><td ><a href="javascript:ShowHideFilter('cust','s');"><span style="color: #000099; text-decoration: underline">Show Filter</span></a> </td><td ><a href="javascript:ShowHideFilter('cust','All');"><span style="color: #000099; text-decoration: underline">All Records</span></a> </td></tr></table><dxwgv:aspxgridview id="gridCustomer" runat="server" width="100%" ClientInstanceName="gridCust"
                                            KeyFieldName="DematTransactions_ID" autogeneratecolumns="False"
                                            OnCustomCallback="grid_CustomCallback"><Columns>
                                                <dxwgv:GridViewDataTextColumn Caption="Scrip Name" FieldName="ScripName" VisibleIndex="0">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="ISIN" FieldName="DematTransactions_ISIN" VisibleIndex="1">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Quantity" FieldName="DematTransactions_Quantity" VisibleIndex="2">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Received In Account" FieldName="acc_shortname" VisibleIndex="3">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Settlement Number" FieldName="SettlementNumberType" VisibleIndex="4">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Received From&lt;br&gt;DPID - ClientId" FieldName="sourceDPId_ClientId" VisibleIndex="5">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Customer Name" FieldName="CustomerName" VisibleIndex="6">
                                                    <Settings AutoFilterCondition="Contains"></Settings>
                                                    <CellStyle ForeColor="Red"></CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption=" " VisibleIndex="7">
                                                    <DataItemTemplate>
                                                           <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>','<%#Eval("sourceDPId_ClientId") %>','<%#Eval("SettlementNumberType") %>','<%#Eval("DematTransactions_ISIN") %>','<%#Eval("DematTransactions_Quantity") %>')"><span style="color: red;
                                                            text-decoration: underline">Rectify</span></a>
                                                    </DataItemTemplate>
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
</dxwgv:aspxgridview>
 </dxw:ContentControl>
</ContentCollection>
<TabStyle Font-Bold="True"></TabStyle>
</dxtc:TabPage>
                                <dxtc:TabPage Text="Scrip Name">
<ContentCollection>
<dxw:ContentControl runat="server">  
                                          <table>
                                            <tr>
                                                <td >
                                                    <a href="javascript:ShowHideFilter('prod','s');"><span style="color: #000099; text-decoration: underline">
                                                        Show Filter</span></a>
                                                </td>
                                                <td >
                                                    <a href="javascript:ShowHideFilter('prod','All');"><span style="color: #000099; text-decoration: underline">
                                                        All Records</span></a>
                                                </td>
                                            </tr>
                                        </table>                                       
                                            <dxwgv:aspxgridview id="gridProduct" runat="server" width="100%" ClientInstanceName="gridProd"
                                            KeyFieldName="DematTransactions_ID" autogeneratecolumns="False"
                                            OnCustomCallback="grid_CustomCallback"><Columns>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="0" Caption="Scrip Name" FieldName="ScripName">
                                                        <CellStyle ForeColor="Red">
                                                        </CellStyle>
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="1" Caption="ISIN" FieldName="DematTransactions_ISIN" >
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="2" Caption="Quantity" FieldName="DematTransactions_Quantity">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="3" Caption="Received In Account" FieldName="acc_shortname">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="4" Caption="Settlement Number" FieldName="SettlementNumberType">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="5" Caption="Received From&lt;br&gt;DPID - ClientId" FieldName="sourceDPId_ClientId">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="6" Caption="Customer Name" FieldName="CustomerName">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="7" Caption=" " >
                                                        <DataItemTemplate>                                                           
                                                           <a href="javascript:void(0);" onclick="RectifyScripClick('<%# Container.KeyValue %>','<%#Eval("sourceDPId_ClientId") %>','<%#Eval("SettlementNumberType") %>','<%#Eval("DematTransactions_ISIN") %>','<%#Eval("DematTransactions_Quantity") %>')">
                                                           <span style="color: red;text-decoration: underline">Rectify</span></a>
                                                        </DataItemTemplate>
                                                    </dxwgv:GridViewDataTextColumn>
                                            </Columns>
</dxwgv:aspxgridview>

                                        </dxw:ContentControl>
</ContentCollection>
<TabStyle Font-Bold="True"></TabStyle>
</dxtc:TabPage>



<dxtc:TabPage Text="File">
<ContentCollection>
<dxw:ContentControl runat="server">  
                                          <table>
                                            <tr>
                                                <td >
                                                    <a href="javascript:ShowHideFilter('file','s');"><span style="color: #000099; text-decoration: underline">
                                                        Show Filter</span></a>
                                                </td>
                                                <td >
                                                    <a href="javascript:ShowHideFilter('file','All');"><span style="color: #000099; text-decoration: underline">
                                                        All Records</span></a>
                                                </td>
                                            </tr>
                                        </table>                                       
                                            <dxwgv:aspxgridview id="gridFile" runat="server" width="100%" ClientInstanceName="gridFile"
                                            KeyFieldName="DematTransactions_ID" autogeneratecolumns="False"
                                            OnCustomCallback="grid_CustomCallback"><Columns>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="0" Caption="Scrip Name" FieldName="ScripName">
                                                        <CellStyle ForeColor="Red">
                                                        </CellStyle>
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="1" Caption="ISIN" FieldName="DematTransactions_ISIN" >
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="2" Caption="Quantity" FieldName="DematTransactions_Quantity">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="3" Caption="Received In Account" FieldName="acc_shortname">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="4" Caption="Settlement Number" FieldName="SettlementNumberType">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="5" Caption="Received From&lt;br&gt;DPID - ClientId" FieldName="sourceDPId_ClientId">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="6" Caption="Customer Name" FieldName="CustomerName">
                                                        <Settings AutoFilterCondition="Contains"></Settings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="7" Caption=" ">
                                                        <DataItemTemplate>                                                           
                                                           <a href="javascript:void(0);" onclick="RectifyScripClick('<%# Container.KeyValue %>','<%#Eval("sourceDPId_ClientId") %>','<%#Eval("SettlementNumberType") %>','<%#Eval("DematTransactions_ISIN") %>','<%#Eval("DematTransactions_Quantity") %>')">
                                                           <span style="color: red;text-decoration: underline">Rectify</span></a>
                                                        </DataItemTemplate>
                                                    </dxwgv:GridViewDataTextColumn>
                                            </Columns>
</dxwgv:aspxgridview>

                                        </dxw:ContentControl>
</ContentCollection>
<TabStyle Font-Bold="True"></TabStyle>
</dxtc:TabPage>
 
                            </TabPages>
                           
                            
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
            </table>
        </div>
        <asp:TextBox runat="server" ID="QueryStr" />
    </form>
</body>
</html>
