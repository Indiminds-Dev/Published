<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_InsTransactionReport, App_Web_nguyhzf5" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
    
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and 

.optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
    
    function callheight(obj)
    {
        height();
        parent.CallMessage();
    }
    
    function ShowHideFilter(obj)
    {
        //var showrecord='Show~'+obj
        grid.PerformCallback(obj);
          height();
    } 
    
        function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
   
        if(document.body.scrollHeight>=600)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '600px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    FieldName='BtnShow';
    function InsurerCompany(obj1,obj2,obj3,obj4)
    {   
    ajax_showOptions(obj1,obj2,obj3,obj4,'Main');
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <table class="TableMain100">
                            <tr>
                                <td class="EHEADER" align="center">
                                    <span style="color: blue"><strong>Transaction Report</strong></span></td>
                            </tr>
                        </table>
                        <table class="TableMain100">
                            <tr>
                                <td align="left" valign="top">
                                    &nbsp;Company:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtInsurerCompany" runat="server" Width="225px" CssClass="EcoheadCon"
                                        TabIndex="0"></asp:TextBox>
                                    <asp:HiddenField ID="txtInsurerCompany_hidden" runat="server" />
                                </td>
                                <td align="left">
                                    From Date:
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                        <buttonstyle width="13px">
                                        </buttonstyle>
                                        <dropdownbutton>
                                        </dropdownbutton>
                                    </dxe:ASPxDateEdit>
                                    <%--   <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem>2005</asp:ListItem>
                                        <asp:ListItem>2006</asp:ListItem>
                                        <asp:ListItem>2007</asp:ListItem>
                                        <asp:ListItem>2008</asp:ListItem>
                                        <asp:ListItem>2009</asp:ListItem>
                                        <asp:ListItem>2010</asp:ListItem>
                                        <asp:ListItem>2011</asp:ListItem>
                                        <asp:ListItem>2012</asp:ListItem>
                                        <asp:ListItem>2013</asp:ListItem>
                                        <asp:ListItem>2014</asp:ListItem>
                                        <asp:ListItem>2015</asp:ListItem>
                                        <asp:ListItem>2016</asp:ListItem>
                                        <asp:ListItem>2017</asp:ListItem>
                                        <asp:ListItem>2018</asp:ListItem>
                                        <asp:ListItem>2019</asp:ListItem>
                                        <asp:ListItem>2020</asp:ListItem>
                                    </asp:DropDownList>--%>
                                </td>
                                <td>
                                    To Date:
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="txtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                        <buttonstyle width="13px">
                                        </buttonstyle>
                                        <dropdownbutton>
                                        </dropdownbutton>
                                    </dxe:ASPxDateEdit>
                                    <%-- <asp:DropDownList ID="DropDownList2" runat="server">
                                        <asp:ListItem Value="1">January</asp:ListItem>
                                        <asp:ListItem Value="2">February</asp:ListItem>
                                        <asp:ListItem Value="3">March</asp:ListItem>
                                        <asp:ListItem Value="4">April</asp:ListItem>
                                        <asp:ListItem Value="5">May</asp:ListItem>
                                        <asp:ListItem Value="6">June</asp:ListItem>
                                        <asp:ListItem Value="7">July</asp:ListItem>
                                        <asp:ListItem Value="8">August</asp:ListItem>
                                        <asp:ListItem Value="9">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList>--%>
                                </td>
                                <td>
                                    Options:
                                </td>
                                <td>
                                    <asp:DropDownList ID="cmbType" runat="server">
                                       <%-- <asp:ListItem Value="A">All Transaction</asp:ListItem>--%>
                                        <asp:ListItem Value="M">Match Transaction</asp:ListItem>
                                        <asp:ListItem Value="U">Unmatch Transaction</asp:ListItem>
                                        <asp:ListItem Value="N">Not Log Transaction</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Button ID="BtnShow" runat="server" Text="Show" CssClass="btnUpdate" OnClick="BtnShow_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                        <tr>
                        
                            <td id="ShowFilter" style="width:70px;">
                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                    Show Filter</span></a>
                            </td>
                            <td id="Td1"  style="width:70px;">
                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                    All Records</span></a>
                            </td>
                            <td align="right">
                               <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                        ValueType="System.Int32" Width="130px">
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="PDF" Value="1" />
                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                            <dxe:ListEditItem Text="RTF" Value="3" />
                                            <dxe:ListEditItem Text="CSV" Value="4" />
                                        </Items>
                                        <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                        </ButtonStyle>
                                        <ItemStyle BackColor="Navy" ForeColor="White">
                                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                                            </HoverStyle>
                                        </ItemStyle>
                                        <Border BorderColor="White" />
                                        <DropDownButton Text="Export">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                            </td>
                                </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <dxwgv:ASPxGridView ID="GridMessage" ClientInstanceName="grid" runat="server" Width="100%"
                                    KeyFieldName="TranID" OnCustomCallback="GridMessage_CustomCallback" AutoGenerateColumns="False">
                                    <clientsideevents begincallback="function(s, e) {
	callheight(s.cpHeight);
}" />
                                    <settingsbehavior allowmultiselection="True" />
                                    <styles>
<Header SortingImageSpacing="5px" BackColor="LightSteelBlue" ImageSpacing="5px"></Header>

<FocusedRow BackColor="#FFC080"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow BackColor="#FFC080"></FocusedGroupRow>
</styles>
                                    <settingspager alwaysshowpager="True" numericbuttoncount="20" showseparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                                    <columns>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="0" FieldName="InsCompany" Caption="Company">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="PlanName" Caption="Plan Name">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="2" FieldName="Name" Caption="ClientName">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="3" FieldName="Branch" Caption="Branch">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="4" FieldName="ApplicationNo" Caption="Applicatio No.">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="5" FieldName="PloicyNo" Caption="Policy No.">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="6" FieldName="PremiumAmount" Caption="Premium Amt.">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="7" FieldName="Stat" Caption="Status">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="8" FieldName="RecieveDate" Caption="Receive Date">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="9" FieldName="IssueDate" Caption="Issue Date">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="10" FieldName="Region" Caption="Region">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="11" FieldName="Location" Caption="Location">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="12" FieldName="Associate" Caption="Associate">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="13" FieldName="Telecaller" Caption="Telecaller">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
</columns>
                                    <settings showgrouppanel="True" verticalscrollableheight="700" verticalscrollbarstyle="Virtual" />
                                </dxwgv:ASPxGridView>
                                 <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
