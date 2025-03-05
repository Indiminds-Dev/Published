<%@ page language="C#" autoeventwireup="true" inherits="management_cdslRTADetails, App_Web_wqpzjxym" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

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
            <td align="center">
                <asp:FormView ID="FormView1" runat="server" Width="790px" DataSourceID="SqlDataSource1"
                                BorderWidth="1px" BorderStyle="Solid" BorderColor="white" Height="100%">
                                <ItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="1" class="TableMain100" style="padding-left:5px">
                                        <tr class="EHEADER"  >
                                            <td class="gridcellleft" style="text-align:center; " colspan="2">
                                            <strong><span style="color: #000099">  RTA Details</span> </strong>    
                                            </td>
                                            <td style="text-align:center;  " colspan="2">
                                            <strong><span style="color: #000099"> Operational Contact Person Details(RTA)</span> </strong>   
                                            </td>
                                        </tr>
                                          <tr>
                                            <td class="gridcellleft" style=" width: 20%; ">
                                               Registered Contact Name : </td>
                                            <td class="gridcellleft" style=" width: 30%;">
                                            <dxe:ASPxMemo ID="ASPxMemo4" runat="server" width="250px" Rows ="2" Text='<%#Eval("CdslRTA_RegisteredContactName")%>' ReadOnly="True">
                                                </dxe:ASPxMemo>
                                            </td>
                                              <td class="gridcellleft" style="width: 10%;">
                                                  Name:</td>
                                              <td class="gridcellleft" style="width: 40%;"><dxe:ASPxMemo ID="ASPxMemo2" runat="server" width="100%" Rows ="2" Text='<%#Eval("CdslRTA_OprContactName")%>' ReadOnly="True">
                                              </dxe:ASPxMemo>
                                              </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;">
                                                Phone 1:</td>
                                            <td class="gridcellleft" style="width: 30%;  ">
                                             <dxe:ASPxTextBox ID="ASPxTextBox12" runat="server" Width="250px" Text='<%#Eval("CdslRTA_Phone1")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="gridcellleft" style="width: 10%;">
                                                Phone1:</td>
                                            <td class="gridcellleft" style="width: 40%;">
                                             <dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%" Text='<%#Eval("CdslRTA_OprContactPhone1")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;">
                                                Phone2:</td>
                                            <td class="gridcellleft" style="width: 30%;">
                                            <dxe:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="250px" Text='<%#Eval("CdslRTA_Phone2")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="gridcellleft" style="width: 10%;">
                                                Phone2:</td>
                                            <td class="gridcellleft" style="width: 40%;  ">
                                            <dxe:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="100%" Text='<%#Eval("CdslRTA_OprContactPhone2")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;  ">
                                                Email:</td>
                                            <td  class="gridcellleft" style="width: 30%;  ">
                                              <dxe:ASPxMemo ID="ASPxMemo5" runat="server" width="250px" Rows ="2" Text='<%#Eval("CdslRTA_Email")%>' ReadOnly="True">
                                                </dxe:ASPxMemo>
                                           
                                            </td>
                                            <td class="gridcellleft" style="width: 10%;">
                                                Email:</td>
                                            <td class="gridcellleft" style="width: 40%;">
                                            <dxe:ASPxMemo ID="ASPxMemo6" runat="server" width="100%" Rows ="2" Text='<%#Eval("CdslRTA_OprContactEmail")%>' ReadOnly="True">
                                                </dxe:ASPxMemo>
                                            
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;">
                                                Fax:</td>
                                            <td class="gridcellleft" style="width: 30%;">
                                            <dxe:ASPxTextBox ID="ASPxTextBox6" runat="server" Width="250px" Text='<%#Eval("CdslRTA_Fax")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="gridcellleft" style="width: 10%;">
                                                Fax:</td>
                                            <td class="gridcellleft" style="width: 40%;">
                                            <dxe:ASPxTextBox ID="ASPxTextBox7" runat="server" Width="100%" Text='<%#Eval("CdslRTA_OprContactFax")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;vertical-align:top;">
                                                Address:</td>
                                            <td class="gridcellleft" style=" width: 30%;">
                                                <dxe:ASPxMemo ID="ASPxMemo1" runat="server" width="250px" Rows ="6" Text='<%#Eval("addressRTA")%>' ReadOnly="True">
                                        </dxe:ASPxMemo>
                                            </td>
                                            <td  class="gridcellleft" style="width: 10%;" valign="top">
                                                Address:</td>
                                            <td class="gridcellleft" style="width: 40%;">
                                            <dxe:ASPxMemo ID="ASPxMemo3" runat="server" width="100%" Rows ="6" Text='<%#Eval("addressOprContact")%>' ReadOnly="True">
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
                    SelectCommand="cdslRTADetailsShow" SelectCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:QueryStringParameter  Name="id" QueryStringField="id"
                             Type="String" />
                       
                    </SelectParameters>
                </asp:SqlDataSource>
    
    </form>
</body>
</html>

