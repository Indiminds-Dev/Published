<%@ page language="C#" autoeventwireup="true" inherits="management_Closingrateiframe, App_Web_sggmuspu" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server"> 
<link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
 <title>Untitled Page</title>
<script language="javascript" type="text/javascript">
                
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
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
      <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1">
                        <h5>
                            Imports Approved Securities Files for NSE-CM
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td class="lt brdr">
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                            <tbody>
                                              
                                                <tr id="trYesNo" runat="server">
                                                  
                                                    <td>
                                                        <table width="100%">
                                                            <tr>
                                                               <td class="lt" colspan="2">
                                                                <div id="divStatus" runat="server">
                                                                </div>
                                                            </td>
                                                            </tr>
                                                           
                                                        </table>
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Red" /></td>
                                                </tr>
                                                <tr cellspacing="2">
                                                  
                                                    <td class="lt">
                                                        <table>
                                                            <tr valign="top">
                                                                <td>
                                                                    <b>DATE</b></td>
                                                                <td>
                                                                    <dxe:ASPxDateEdit ID="dtfor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                        Font-Size="10px" Width="120px" ClientInstanceName="dtfor">
                                                                        <DropDownButton Text="For">
                                                                        </DropDownButton>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>

                                                            </tr>
                                                     
                                                        </table>
                                                        <%--<strong>EG: nsccl_ann19.xls/xlsx and nsccl_ann19_mf.xls/xlsx</strong>--%>
                                                        <strong>EG: nsccl_ann19.xls/xlsx and nsccl_ann19_mf.xls/xlsx and nsccl_ann_gsec.xls/xlsx</strong>
                                                       </td>
                                                </tr>
                                      
                                                <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Approved Security File"></asp:Label>
                                                   <asp:HyperLink ID="lblMessage" runat="server"  Text="www1.nseindia.com/content/nsccl/nsccl_ann19.zip"  NavigateUrl="http://www1.nseindia.com/content/nsccl/nsccl_ann19.zip" Target="_blank"></asp:HyperLink>
                                                 </td>
                                                </tr>
                                                <tr>
                                                       <td>
                                                         <asp:FileUpload ID="FileUpload" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Mutual Fund Approved Security File"></asp:Label>
                                                   <asp:HyperLink ID="lblMessage2" runat="server"  Text="https://www1.nseindia.com/content/nsccl/nsccl_cm_ann_mf.zip"  NavigateUrl="http://www1.nseindia.com/content/nsccl/nsccl_cm_ann_mf.zip" Target="_blank"></asp:HyperLink>
                                                 </td>
                                                </tr>
                                                <tr>
                                                       <td>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                                <%--New Work--%>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Approved Govt. Security File"></asp:Label>
                                                       <asp:HyperLink ID="lblMessage3" runat="server"  Text="www1.nseindia.com/content/nsccl/nsccl_ann_gsec.zip" NavigateUrl="http://www1.nseindia.com/content/nsccl/nsccl_ann_gsec.zip" Target="_blank"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:FileUpload ID="FileUpload2" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                                <%--End of New Work--%>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:HiddenField ID="hdnChk" runat="server" Value="0" />
                                                        <table cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="BtnSave" runat="server" Text="Import File(s)" CssClass="btn" OnClick="BtnSave_Click"
                                                                            Width="84px" />
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
                    </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
