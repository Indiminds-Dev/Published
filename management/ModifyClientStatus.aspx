<%@ page language="C#" autoeventwireup="true" inherits="Management_ModifyClientStatus, App_Web_ko_nrypx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp"  %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Modify Client Status</title>
    <!--Other Script-->   
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
   <!--Page and Filter Script -->
    <script type="text/javascript" language="javascript"> 
        function Page_Load()
        {            
             Height('500','500');
             HideShow("C1_Row5_Col1","S");//Excel Button
             HideShow("C1_Row5_Col2","H");//Update Button
             HideShow("C1_Row4","H");//Status Combo
        }
        function OnCmbExecSelectedIndexChanged()
        {
            var SelectedValue=cCmbExec.GetValue();
            if(SelectedValue=="E")
            {
                HideShow("C1_Row5_Col1","S");
                HideShow("C1_Row5_Col2","H");
                HideShow("C1_Row4","H");
            }
            else
            {
                HideShow("C1_Row5_Col1","H");
                HideShow("C1_Row5_Col2","S");
                HideShow("C1_Row4","S");
            }
        }
        function CbpButtons_Click()
        {
            cCbpButtons.PerformCallback(cCmbExec.GetValue());
        }
        function CbpButtons_EndCallBack()
        {
            if(cCbpButtons.cpWhichCall != null)
            {
                if(cCbpButtons.cpWhichCall == "ExportExcel")
                    document.getElementById("btnExport").click();
                else if(cCbpButtons.cpWhichCall =="UpdtSuccess")
                    alert("Selected Status Successfully Updated!!!");
                else if(cCbpButtons.cpWhichCall =="UpdtFail")
                    alert("Updation Failted. Please Retry!!!");
                else if(cCbpButtons.cpWhichCall =="NoData")
                    alert("No Data Found!!!");
                    
            }
        }
    </script>
    <!--Page Style-->
    <style type="text/css">       
         #Container1 { width: 520px;}       
         .LableWidth { width:200px;}
         .ContentWidth { width:300px; height:21px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header" class="Header">
            Modify Client Status ( For Dormant Days )
        </div>
        <div>
            <div id="Row0" class="Row">
                <div id="Container1" class="container">
                    <div id="C1_Row0" class="Row">
                        <div id="C1_Row0_Col1" class="LFloat_Lable LableWidth">
                            Company :
                        </div>
                        <div id="C1_Row0_Col2" class="LFloat_Lable LableWidth">
                            <dxe:ASPxComboBox ID="CmbCompany" runat="server" ClientInstanceName="cCmbCompany"
                                Font-Size="10px" SelectedIndex="0" ValueType="System.String" Width="200px" EnableIncrementalFiltering="True"
                                EnableSynchronization="False">
                            </dxe:ASPxComboBox>
                        </div>
                    </div>
                    <div id="C1_Row1" class="Row">
                        <div id="C1_Row1_Col1" class="LFloat_Lable LableWidth">
                            Trade Date :
                        </div>
                        <div id="C1_Row1_Col2" class="LFloat_Lable LableWidth">
                            <dxe:ASPxDateEdit ID="DtTradeDate" runat="server" EditFormat="Custom" ClientInstanceName="cDtTradeDate"
                                UseMaskBehavior="True" Font-Size="10px" Width="141px" EditFormatString="dd-MM-yyyy">
                                <ClientSideEvents DateChanged="function(s,e){ }" />
                                <ButtonStyle Width="13px">
                                </ButtonStyle>
                            </dxe:ASPxDateEdit>
                        </div>
                    </div>
                    <div id="C1_Row2" class="Row">
                        <div id="C1_Row2_Col1" class="LFloat_Lable LableWidth">
                            Dormant Days :
                        </div>
                        <div id="C1_Row2_Col2" class="LFloat_Lable LableWidth">
                            <dxe:ASPxTextBox runat="server" ID="txtDormantDay" ClientInstanceName="ctxtDormantDay"
                                Width="50px">
                                <MaskSettings Mask="<0..99999>" />
                            </dxe:ASPxTextBox>
                        </div>
                    </div>
                    <div id="C1_Row3" class="Row">
                        <div id="C1_Row3_Col1" class="LFloat_Lable LableWidth">
                            Execute :
                        </div>
                        <div id="C1_Row3_Col2" class="LFloat_Lable LableWidth">
                            <dxe:ASPxComboBox ID="CmbExec" runat="server" ClientInstanceName="cCmbExec" Font-Size="10px" Width="120px"
                                SelectedIndex="0" ValueType="System.String" EnableIncrementalFiltering="True">
                                <Items>
                                    <dxe:ListEditItem Value="E" Text="Excel"></dxe:ListEditItem>
                                    <dxe:ListEditItem Value="S" Text="Update"></dxe:ListEditItem>
                                </Items>
                                <ClientSideEvents SelectedIndexChanged="OnCmbExecSelectedIndexChanged" />
                            </dxe:ASPxComboBox>
                        </div>
                    </div>
                     <div id="C1_Row4" class="Row">
                        <div id="C1_Row4_Col1" class="LFloat_Lable LableWidth">
                            Client Status :
                        </div>
                        <div id="C1_Row4_Col2" class="LFloat_Lable LableWidth">
                            <dxe:ASPxComboBox ID="CmbClntStatus" runat="server" ClientInstanceName="cCmbClntStatus"
                                Font-Size="10px" SelectedIndex="0" ValueType="System.String" Width="200px" EnableIncrementalFiltering="True"
                                EnableSynchronization="False">
                                <Items>
                                    <dxe:ListEditItem Value="4" Text="Suspended"></dxe:ListEditItem>
                                    <dxe:ListEditItem Value="1" Text="Active"></dxe:ListEditItem>
                                    <dxe:ListEditItem Value="8" Text="DeActive"></dxe:ListEditItem>
                                </Items>
                            </dxe:ASPxComboBox>
                        </div>
                    </div>
                    <div id="C1_Row5" class="Row" style="padding-left:152px">
                        <div id="C1_Row5_Col1" class="LFloat_Lable">
                            <dxe:ASPxButton ID="xbtnExport" runat="server" AutoPostBack="False" Text="Export Excel"
                                Width="120px" Height="11px">
                                <ClientSideEvents Click="function (s, e) { CbpButtons_Click();  }" />
                            </dxe:ASPxButton>
                        </div>
                        <div id="C1_Row5_Col2" class="LFloat_Lable">
                            <dxe:ASPxButton ID="xbtnUpdate" runat="server" AutoPostBack="False" Text="Update Status"
                                Width="120px" Height="11px">
                                <ClientSideEvents Click="function (s, e) {cMsgPopUp.Show(); }" />
                            </dxe:ASPxButton>
                        </div>
                    </div>
                    <dxcp:ASPxCallbackPanel ID="CbpButtons" runat="server" Width="400px" ClientInstanceName="cCbpButtons"
                        OnCallback="CbpButtons_Callback">
                        <PanelCollection>
                            <dxp:panelcontent runat="server">
                            </dxp:panelcontent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function(s, e) {
	                                                    CbpButtons_EndCallBack(); }" />
                    </dxcp:ASPxCallbackPanel>
                    <div>
                        <dxpc:ASPxPopupControl ID="MsgPopUp" runat="server" ClientInstanceName="cMsgPopUp"
                            HeaderText="Notice" Left="100" meta:resourcekey="DeleteMsgPopUpResource1" ShowSizeGrip="False"
                            Top="100" Width="387px" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="TopSides">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl runat="server">
                                    <table class="style1">
                                        <tr>
                                            <td colspan="5">
                                                Are u Sure? Do You Want To Update Dormant Client's Status?
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 3px">
                                            </td>
                                            <td>
                                            </td>
                                            <td style="width: 164px">
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" meta:resourceKey="ASPxButton1Resource1"
                                                    Text="Yes">
                                                    <ClientSideEvents Click="function (s, e) { CbpButtons_Click(); cMsgPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="ASPxButton3" runat="server" AutoPostBack="False" meta:resourceKey="ASPxButton2Resource1"
                                                    Text="No">
                                                    <ClientSideEvents Click="function (s, e) { cMsgPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                            
                        </dxpc:ASPxPopupControl>
                    </div>
                    
                    <div id="hiddenDiv" style="display:none"><asp:Button id="btnExport" Text="Client" runat="server" OnClick="btnExport_Click" /></div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
