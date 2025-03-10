<%@ page language="C#" autoeventwireup="true" inherits="GenericRoutines_Import_GenericImport, App_Web_zipypd-e" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxUploadControl"
    TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Generic Imports</title>
    <!--External Styles-->
        <link type="text/css" href="../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <!--External Scripts file-->
        <!--Other Script-->
        <script type="text/javascript" src="../../CentralData/JSScript/GenericJScript.js"></script>
    <style type="text/css">       
        #Container1 { width: 500px; padding:5px}
        .LableWidth { width:110px;}
        .ContentWidth { width:330px; height:21px;}
        .btnRight { margin-right:200px; } 
    </style>
    
    <!--inline JSCRIPT -->
    <script type="text/javascript" language="javascript">
        //ProtoType
        String.prototype.trim = function() {
            return this.replace(/^\s+|\s+$/g,"");
        }
        String.prototype.ltrim = function() {
            return this.replace(/^\s+/,"");
        }
        String.prototype.rtrim = function() {
            return this.replace(/\s+$/,"");
        }
        function Page_Load()
        {
            Height(450,450);
            HideShow("Row4","H");
        }
        function CmbFileType_ValueChanged(value)
        {
            if(cCmbFileType.GetText()=="XLS" || cCmbFileType.GetText()=="XLSX") HideShow("Row4","S"); else HideShow("Row4","H");
            cCmbName.PerformCallback("BindName~"+value);
        }
        function CmbName_ValueChanged()
        {
            cCbpSheetName.PerformCallback();
        }
        function BtnImport_Click()
        {
            cCbpButtons.PerformCallback("Import~"+cCmbFileType.GetValue()+"~"+cCmbName.GetValue()+"~"+cFileUploader.GetText(0));
        }
        function CbpButtons_EndCallBack()
        {
            if(cCbpButtons.cpClientMsg != null)
            {
                alert(cCbpButtons.cpClientMsg);
            }
            if(cCbpButtons.cpCommand!=null)
            {
                if(cCbpButtons.cpCommand == "Import")
                {
                    document.getElementById("btnExcelImport").click();
                    HideShow('LoadingDiv', 'S');
                }
            }
        }
    </script>
    
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="Header" class="Header">
            Import Files</div>
            <div id="Container1" class="container">
                <div id="Row1" class="Row">
                    <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                        File Extension</div>
                    <div class="LFloat_Content ContentWidth">
                        <dxe:ASPxComboBox ID="CmbFileType" Width="160px" runat="server" Font-Size="13px"
                            ValueType="System.String" ClientInstanceName="cCmbFileType" Font-Bold="False"
                            SelectedIndex="0" TabIndex="0">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {CmbFileType_ValueChanged(s.GetValue());}" />
                            <Paddings PaddingBottom="0px"></Paddings>
                        </dxe:ASPxComboBox>
                    </div>
                    <br class="clear" />
                </div>
                <div id="Row2" class="Row">
                    <div id="Row2_Col1" class="LFloat_Lable LableWidth">
                        Name</div>
                    <div class="LFloat_Content ContentWidth">
                        <dxe:ASPxComboBox ID="CmbName" Width="160px" runat="server" Font-Size="13px"
                            ValueType="System.String" ClientInstanceName="cCmbName" Font-Bold="False"
                            SelectedIndex="0" TabIndex="0" OnCallback="CmbName_Callback">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {CmbName_ValueChanged();}" />
                            <Paddings PaddingBottom="0px"></Paddings>
                        </dxe:ASPxComboBox>
                    </div>
                    <br class="clear" />
                </div>
                <div id="Row3" class="Row">
                    <div id="Row3_Col1" class="LFloat_Lable LableWidth">
                        Select File</div>
                    <div class="LFloat_Content ContentWidth">
                        <dx:ASPxUploadControl ID="FileUploader" runat="server" ClientInstanceName="cFileUploader" Width="320">
                        </dx:ASPxUploadControl>
                    </div>
                    <br class="clear" />
                </div>
                <div id="Row4" class="Row">
                    <div id="Row4_Col1" class="LFloat_Lable LableWidth">
                        Sheet Name</div>
                    <div class="LFloat_Content ContentWidth">
                        <dxcp:ASPxCallbackPanel ID="CbpSheetName" runat="server" ClientInstanceName="cCbpSheetName"
                            BackColor="White" OnCallback="CbpSheetName_Callback">
                            <PanelCollection>
                                <dxp:panelcontent runat="server">
                                    <dxe:ASPxTextBox ID="TxtSheetName" runat="server" ClientInstanceName="cTxtSheetName"
                                        Width="320">
                                    </dxe:ASPxTextBox>
                                </dxp:panelcontent>
                            </PanelCollection>
                        </dxcp:ASPxCallbackPanel>
                    </div>
                    <br class="clear" />
                </div>
                <div id="Row5" class="Row">
                    <div id="Row5_Col1" class="LFloat_Lable LableWidth">
                        </div>
                    <div class="LFloat_Content ContentWidth">
                         <dxe:ASPxButton ID="BtnImport" ClientInstanceName="cBtnImport" runat="server" AutoPostBack="False" Text="Import" Width="85px">
                        <ClientSideEvents Click="function (s, e) {BtnImport_Click();}" />
                    </dxe:ASPxButton>
                    </div>
                    <br class="clear" />
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
                
               
            </div>
        </div>
        <div id='LoadingDiv' style="display:none;position: absolute; font-family: arial; font-size: 30; left: 50%; top: 20%; 
                        background-color: white; layer-background-color: white; height: 80; width: 150;">
            <table width="250px" height="35px" border="1" cellpadding="0" cellspacing="0" bordercolor="#C0D6E4">
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td height="10" width="100%" align="center" bgcolor="#FFFFFF">
                                    <font size="1" face="Tahoma"><strong align="center">Please Wait While Importing Data..</strong></font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div id="hiddenDiv" style="display:none"><asp:Button id="btnExcelImport" Text="Client" runat="server" OnClick="btnImportExcel_Click" /></div>
    </form>
</body>
</html>
