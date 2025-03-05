<%@ page language="C#" autoeventwireup="true" inherits="management_rootcompany_general, App_Web_s3wzohpw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%--<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>--%>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
  
function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        //document.location.href="rootcompany_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="rootComp_Correspondence.aspx"; 
        }
        if ( name == "tab2")
        {
        //alert(name);
        document.location.href="rootComp_exchange.aspx";         
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="rootComp_dpMembership.aspx";         
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="rootComp_KRAMemberships.aspx";         
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Contact_Document.aspx";
                 
        }
    }
    
   function ValidateGeneral()
   {

       var obj1=document.getElementById('ASPxPageControl1_txtOnRole').value;
       var obj2=document.getElementById('ASPxPageControl1_txtOffRole').value;
       if(obj1.length < 1)
       {
       alert("Company Short Name Required!..")
       return false;
       }
       if(obj2.length < 1)
       {
       alert("Company Short Name Required!..")
       return false;
       }
       if(obj1.length < 4)
       {
       alert("Company Short Name should be 4 Characters!..")
       return false;
       }
       if(obj2.length < 4)
       {
       alert("Company Short Name should be 4 Characters!..")
       return false;
       }
   
    
   
   }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                            Width="100%">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table width="100%" border="1">
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        Parent Company :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                        <asp:DropDownList ID="drpParentComp" runat="server" Width="267px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        Company Name :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtCompname" runat="server" Width="267px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        Nature Of Business :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtNameofBusiness" runat="server" Width="267px"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        Directors :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtDirectors" runat="server" TextMode="MultiLine" Width="267px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        Authorised Signatories :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtAuthorised" runat="server" TextMode="MultiLine" Width="267px"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        GST Regn. No :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtRegnNo" runat="server" Width="267px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        GSTIN Validity Date :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                        <dxe:ASPxDateEdit ID="txtcstVdate" runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                                            UseMaskBehavior="True" Width="267px">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        Pan No. :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtPanNo" runat="server" Width="267px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        ServiceTax/VAT Regn. No :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtservicetaxNo" runat="server" Width="267px"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        Clearing Members PAN No. :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtlocalSalesTax" runat="server" Width="267px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        ServiceTax/VAT Regn.Validity Date :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                        <dxe:ASPxDateEdit ID="txtLocalVdate" runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                                            UseMaskBehavior="True" Width="267px">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        CIN :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtCIN" runat="server" Width="267px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        CIN Validity Date :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                        <dxe:ASPxDateEdit ID="txtCINVdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                            Width="267px">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        Date of Incorporation :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <dxe:ASPxDateEdit ID="txtincorporateDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                            Width="267px">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        ShortName[On Role Employee] :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtOnRole" runat="server" Width="267px" MaxLength="4"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        ShortName[Off Role Employee] :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox ID="txtOffRole" runat="server" Width="267px" MaxLength="4"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                        Base Currency :
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                        <asp:DropDownList ID="ddlcurrency" runat="server" Width="267px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        Kra Prefix :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox runat="server" ID="txtKraPrefix" MaxLength="8" Width="267px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%; background-color: #b7ceec;">
                                                        Kra Intermediatory ID :
                                                    </td>
                                                    <td style="text-align: left; width: 25%; background-color: #ddecfe;">
                                                        <asp:TextBox runat="server" ID="txtKraintermideatoryid" MaxLength="12" Width="267px"></asp:TextBox>
                                                    </td>
                                                    <td style="width: 21%; background-color: #b7ceec;">
                                                    </td>
                                                    <td style="text-align: left; width: 27%; background-color: #ddecfe;">
                                                    </td>
                                                </tr>
                                                <tr style="height: 10px">
                                                </tr>
                                                <tr style="background-color: #ddecfe; width: 200px;">
                                                    <td colspan="4" style="text-align: left">
                                                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                                                            Width="73px" />
                                                        <%--<asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="CorresPondence" Name="CorresPondence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Exchange Segment" Text="Exchange Segment">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DP Memberships" Text="DP Memberships">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="KRA" Text="KRA Memberships">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents" Text="Documents">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                
                            </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            else if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                            else if(activeTab == Tab3)
	                                            {
	                                                disp_prompt('tab3');
	                                            }
	                                            else if(activeTab == Tab4)
	                                            {
	                                                disp_prompt('tab4');
	                                            }
	                                            else if(activeTab == Tab5)
	                                            {
	                                                disp_prompt('tab5');
	                                            }
	                                            }"></ClientSideEvents>
                            <ContentStyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                            </ContentStyle>
                            <LoadingPanelStyle ImageSpacing="6px">
                            </LoadingPanelStyle>
                            <TabStyle Font-Size="10px">
                            </TabStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
