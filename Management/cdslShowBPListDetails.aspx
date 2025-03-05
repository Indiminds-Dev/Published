<%@ page language="C#" autoeventwireup="true" inherits="management_cdslShowBPListDetails, App_Web_jdrimxnc" %>



<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <link rel="stylesheet" href="../CSS/style.css" type="text/css" /> 
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
          <script language="javascript" type="text/javascript">
        function SignOff()
        {
            window.parent.SignOff();
        }
        </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <table class="TableMain100">
         <tr>
                                            <td class="EHEADER" colspan="2" style="text-align:center; ">
                                              <strong><span style="color: #000099">DP Information </span> </strong>    </td>
                                        </tr>
        <tr>
            <td align="center">
                <asp:FormView ID="FormView1" runat="server" Width="775px" DataSourceID="SqlDataSource1"
                                BorderWidth="1px" BorderStyle="Solid" BorderColor="white" Height="100%">
                                <ItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="1" width="100%" align="left" style="padding-left:5px">
                                       
                                          <tr>
                                            <td class="gridcellleft" style="width: 10%; ">
                                                Name : </td>
                                            <td class="gridcellleft" style="width: 40%; ">
                                            <dxe:ASPxMemo ID="ASPxMemo4" runat="server" width="100%" Rows ="2" Text='<%#Eval("CdslBPList_FirstName")%>' ReadOnly="True">
                                                </dxe:ASPxMemo>
                                            </td>
                                        </tr>
                                    <tr>
                                            <td class="gridcellleft"  style="width: 10%; ">
                                                Phone1 :</td>
                                            <td class="gridcellleft" style="width: 40%; ">
                                                 <dxe:ASPxTextBox ID="ASPxTextBox13" runat="server" Width="100%" Text='<%#Eval("CdslBPList_DPPhone1")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                      <tr>
                                            <td  class="gridcellleft" style="width: 10%; ">
                                                 Phone2 :</td>
                                            <td class="gridcellleft" style="width: 40%; ">
                                                 <dxe:ASPxTextBox ID="txtBankAcNo" runat="server" Width="100%" Text='<%#Eval("CdslBPList_DPPhone2")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        
                                           <tr>
                                            <td class="gridcellleft" style="width: 10%; ">
                                                 Fax:</td>
                                            <td class="gridcellleft" style="width: 40%; ">
                                                 <dxe:ASPxTextBox ID="ASPxTextBox8" runat="server" Width="100%" Text='<%#Eval("CdslBPList_DPFax")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td class="gridcellleft" style="width: 10%; ">
                                                 Email :</td>
                                            <td class="gridcellleft" style="width: 40%; ">
                                                 <dxe:ASPxTextBox ID="ASPxTextBox10" runat="server" Width="100%" Text='<%#Eval("CdslBPList_DPEmail")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 10%; ; vertical-align:top;">
                                                Address :</td>
                                            <td class="gridcellleft" style="width: 40%; ">
                                                <dxe:ASPxMemo ID="ASPxMemo1" runat="server" width="100%" Rows ="6" Text='<%#Eval("address")%>' ReadOnly="True">
                                        </dxe:ASPxMemo>
                                            </td>
                                        </tr>
                                      
                                       
                                    </table>
                                </ItemTemplate>
                                <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            </asp:FormView>
            </td>
        </tr>
       
        
    </table>
     
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="SP_Show_BPList_Details" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>  
    
    </form>
</body>
</html>


 