<%@ page language="C#" autoeventwireup="true" inherits="management_Import_Custom_CashBank, App_Web_yq8u0p-o" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
   <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>
    <title>Import Custom Cash/Bank CSV File</title>

    <script language="javascript" type="text/javascript">
       
    function PageLoad()///Call Into Page Load
    {        
        HideShow("LinkImprted","H"); 
       
    }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function onClickImport()
    {
        if(GetValue('FileControle')== "")
        {
         alert("Please Atfirst Select a CSV File");
         return;
        }
       // HideShow("LinkImprted","S"); 
    }
    function TypeChange()
    {
//     if(cComboReImpOrDel.GetValue()=="1")
//       alert('You Can Only Delete previously imported JVs');
    }
    function ShowExcelPattern_Click()
    {
         var btn = document.getElementById('btnhide');
         btn.click();            
    }
    function onClickExcelGen()
    {
       var btnXL = document.getElementById('btnhideXL');
       btnXL.click();  
    }
    function FnShowlnk()
    {
     HideShow("LinkImprted","S"); 
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
        <div align="center">
        <div style="width:90%;height:50px"></div>
            <asp:Panel ID="Panelmain" runat="server" Visible="true">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" style="width: 500px">
                    <tbody>
                        <tr>
                            <td class="lt1" style="width: 485px">
                                <h5>
                                    Import CashBank Vouchers
                                </h5>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="lt brdr" style=" width:700px;">
                                <table cellspacing="0" cellpadding="0" align="center">
                                    <tbody>
                                        <tr>
                                            <td class="lt" style=" width: 600px;">
                                                <table class="width100per" cellspacing="12" cellpadding="0">
                                                    <tbody>
                                                        
                                                         <tr>
                                                            <td class="lt" style="height: 16px;">
                                                            <a href="javascript:void(0); " tabindex="11" onclick="ShowExcelPattern_Click()"><span style="color: blue; text-decoration:underline; font-size: 8pt;">View File Format</span></a>
                                                            <%--<asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue" Width="266px"  NavigateUrl="~/C:/SAMPLE_JV.csv" Target="_blank">View File Format</asp:HyperLink>--%>
                                                            </td>
                                                        </tr>
                                                       
                                                        <tr>
                                                        
                                                            <td align="left">
                                                            <div style="float:left">&nbsp;&nbsp;
                                                                Select File: &nbsp;&nbsp;<asp:FileUpload ID="FileControle" runat="server" Width="300px" />
                                                            </div>
                                                                <div style="float:left;margin-left:4px">
                                                                <dxe:aspxcombobox id="ComboReImpOrDel" runat="server" clientinstancename="cComboReImpOrDel" 
                                                                    enableincrementalfiltering="True" font-size="10px" selectedindex="0" valuetype="System.String"
                                                                    width="75px">
                                                                    <items>
                                                                                <dxe:ListEditItem Value="G" Text="Generate"></dxe:ListEditItem>
                                                                                <dxe:ListEditItem Value="D" Text="Delete"  ></dxe:ListEditItem>
                                                                    </items>
                                                                     <ClientSideEvents SelectedIndexChanged="function(s,e){TypeChange()}" />
                                                                </dxe:aspxcombobox>
                                                                </div>
                                                                </td>
                                                        </tr>
                                                      
                                                        <tr>
                                           
                                                            <td valign="top" align="left" style="height: 19px">
                                                               <div style="float:left">&nbsp;&nbsp;
                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click" OnClientClick="onClickImport()"
                                                                    Width="84px" /></div>
                                                                
                                                                <div style="float:right"><a id="LinkImprted" href="javascript:void(0);" tabindex="11" onclick="onClickExcelGen()">
                                                                <span style="color: #00B2EE; text-decoration: underline; font-size: 10pt;">Download Report</span></a></div>
                                                            </td>
                                                                   
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" >
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Red" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            <div style="display:none">
            &nbsp; <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
            <asp:Button ID="btnhideXL" runat="server" Text="Button" OnClick="btnhideXL_Click" />
            </div>
        </div>
    </form>
</body>
</html>
