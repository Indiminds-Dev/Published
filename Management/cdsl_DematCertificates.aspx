<%@ page language="C#" autoeventwireup="true" inherits="management_cdsl_DematCertificates, App_Web_vvdfezxa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
   function PageLoad()
            {
                var arrDp = window.location.search.split('=');
                y = arrDp[1];
                x='0';
                 document.getElementById('status_Hidden').value='Y';
            }

  function update()
    {
    cmb.PerformCallback();
    //parent.editwin.close();
    }
      
  function statusCheck()
    {
    if(document.getElementById('status_Hidden').value!='N')
    {
     parent.DematpopupOpen(y);
     }
    }
       
  function showResult(s)
    {
    alert(s);
    }
  function PopUpClose()
    {
        document.getElementById('status_Hidden').value='N';
     parent.editwin.close();
     }
    </script>
</head>
<body onunload="statusCheck();">


    <form id="form1" runat="server">
        <input id="status_Hidden" type="hidden" />

        <div align="center">
        <br />
        <br />
           <table class="TableMain100">
           <tr>
           <td colspan="2" class="EHEADER">
             <strong><span style="color: #000099">Update Demat Certificates   </span></strong>
                                            
           </td>
           </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="cdslDemat" runat="server" AutoGenerateColumns="False" Width="580px" BorderColor="CornflowerBlue" DataKeyNames="CdslTransaction_ID" AllowPaging="True" BorderStyle="Solid" BorderWidth="2px" CellPadding="4" ForeColor="#333333" HorizontalAlign="Center" OnPageIndexChanging="cdslDemat_PageIndexChanging">
                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                            <Columns>
                                <asp:BoundField DataField="CdslTransaction_BenAccountNumber" HeaderText="Client ID">
                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="name" HeaderText="Name">
                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left"  />
                                </asp:BoundField>
                                <asp:BoundField DataField="CdslTransaction_ISIN" HeaderText="ISIN" >
                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CdslTransaction_Quantity" HeaderText="Quantity"  >
                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" />
                                </asp:BoundField>

                                <asp:BoundField DataField="CdslTransaction_date" HeaderText="Transaction Date" >
                                <ItemStyle BorderWidth="1px" HorizontalAlign="Right" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Certificates"  >
                                    <ItemTemplate >
                                        <dxe:ASPxTextBox ID="txtCertificates" runat="server" HorizontalAlign="Right" Width="100px" Text='<%# Bind("CdslTransaction_Certificates") %>'>
                                            <validationsettings errordisplaymode="None"></validationsettings>
                                            <masksettings mask="&lt;0..9999999999g&gt;" includeliterals="DecimalSymbol" />
                                            <paddings padding="0px"></paddings>
                                        </dxe:ASPxTextBox>
                                    </ItemTemplate>
                                     <ItemStyle BorderWidth="1px" HorizontalAlign="Right" />
                                </asp:TemplateField>
                            </Columns>
                                <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                        BorderWidth="1px"></RowStyle>                            <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                            <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                            <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue" Font-Bold="False" HorizontalAlign="Left"></HeaderStyle>
                             <AlternatingRowStyle BackColor="White" />

                        </asp:GridView>
                    </td>
                </tr>
                <tr >
                    <td style="width: 50%; padding-right:10px" align="right" >
                        <dxe:ASPxButton ID="btnUpdate" runat="server" AutoPostBack="False"  Text="Update">
                            <clientsideevents click="function(s, e) {
	                                                    update();
                                                    }"></clientsideevents>
                        </dxe:ASPxButton>
                    </td>
                    <td align="left" style="padding-left:10px">
                    <dxe:ASPxButton ID="btnClose" runat="server" AutoPostBack="False"  Text="Close">
                            <clientsideevents click="function(s, e) {
	                                                   PopUpClose();
                                                    }"></clientsideevents>
                        </dxe:ASPxButton>
                    </td>
                </tr>
                <tr style="visibility:hidden ">
                    <td>
                   <dxe:ASPxComboBox ID="cmb" Width="160px" runat="server" 
                    ValueType="System.String" Font-Bold="False" SelectedIndex="0" ClientInstanceName="cmb"
                    OnCallback="cmb_Callback" OnCustomJSProperties="cmb_CustomJSProperties">
                    <Items>
                        <dxe:ListEditItem Text="All" Value="All"></dxe:ListEditItem>
                    </Items>
                    <ButtonStyle Width="60px">
                    </ButtonStyle>
                    <DropDownButton Text="Client Type">
                    </DropDownButton>
                    <ClientSideEvents EndCallback="function(s, e) {
	                        showResult(s.cpretValue);
                                    }"></ClientSideEvents>
                    <Paddings PaddingBottom="0px"></Paddings>
                </dxe:ASPxComboBox>
                        
                        
                        
                        </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
