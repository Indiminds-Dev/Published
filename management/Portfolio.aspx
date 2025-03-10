<%@ page language="C#" autoeventwireup="true" inherits="management_Portfolio, App_Web_d3reltht" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
    <%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Portfolio</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

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
		z-index:100;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
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
		z-index:5;
	}
	
	form{
		display:inline;
	}
	</style>

    <script language="javascript" type="text/javascript">
        function BindPortFolio()
        {
            gridPortFolio.PerformCallback();
        }
        function CallClientName(obj1,obj2,obj3)
        {
            var StockFor;
            var obj4=document.getElementById("ddlStockFor");
            if(obj4.value=='Pro-Trading')
                StockFor='T';
            else if(obj4.value=='Pro-Investment')
                StockFor='I';
            else if(obj4.value=='Client')
                StockFor='C';
            ajax_showOptions(obj1,obj2,obj3,StockFor,'Sub');
        }
        function CallProduct(obj1,obj2,obj3)
        {
            ajax_showOptions(obj1,obj2,obj3,null,'Main');
        }
        function CallISIN(obj1,obj2,obj3)
        {
            ajax_showOptions(obj1,obj2,obj3,ProductID,'Sub');
        }
        function height()
        {
            if(document.body.scrollHeight>=500)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '500';
            }
            window.frameElement.width = document.body.scrollWidth;
        }
       function InsertData()
       {   
            var CustID=document.getElementById('txtCustomerID_hidden').value;
            if(CustID==null || CustID=='')
                alert('First Select Customer !!');
            else
                gridPortFolio.AddNewRow();
       }
       function HoldingMode(obj)
       {
            if(obj=="D")
            {
                document.getElementById('TdIsin').style.display="inline";
                document.getElementById('TdIsin1').style.display="inline";
            }
            else    
            {
                document.getElementById('TdIsin').style.display="none";
                document.getElementById('TdIsin1').style.display="none";
            }
       }
       function keyVal(obj)
       {
            var objVal=obj.split('~');
            //New Work
            //ProductID=objVal[0];
            ProductID=objVal[1];
            //End of New Work
       }
       function CheckingTD(obj)
       {
            if(obj!=null)
            {
                if(obj=='D')
                {
                    document.getElementById('TdIsin').style.display="inline";
                    document.getElementById('TdIsin1').style.display="inline";  
                }
                else if(obj=='P')
                {
                    document.getElementById('TdIsin').style.display="none";
                    document.getElementById('TdIsin1').style.display="none";
                }
                else if(obj=='Insert')
                {
                    alert('Insert Successfully !!');
                    gridPortFolio.PerformCallback();
                }
                else if(obj=='Update')
                {
                    alert('Update Successfully !!');
                    gridPortFolio.PerformCallback();
                }
                else if(obj=='Delete')
                {
                    alert('Deleted Successfully !!');
                    gridPortFolio.PerformCallback();
                }
            }
       }
        function DateChangeForFrom()
        {
            var sessionVal ="<%=Session["LastFinYear"]%>";
            var objsession=sessionVal.split('-');
            var MonthDate=dtAcquiredDate.GetDate().getMonth()+1;
            var DayDate=dtAcquiredDate.GetDate().getDate();
            var YearDate=dtAcquiredDate.GetDate().getYear();
            if(YearDate>objsession[0])
            {
                 alert('This is Not Acquired Date !!');
                 var datePost=(3+'-'+31+'-'+objsession[0]);
                 dtAcquiredDate.SetDate(new Date(datePost));
            }
            else if(YearDate==objsession[0])
            {
                if(MonthDate>=4 && YearDate==objsession[0])
                {
                    alert('This is Not Acquired Date !!');
                    var datePost=(3+'-'+31+'-'+objsession[0]);
                    dtAcquiredDate.SetDate(new Date(datePost));
                }
            }
        }
       FieldName='btnShow'
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="gridcellleft" style="width: 105px">
                        Stock For :
                    </td>
                    <td style="width: 177px">
                        <asp:DropDownList ID="ddlStockFor" runat="server" Width="138px" Font-Size="10px">
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft" style="width: 166px">
                        Customer Name :
                    </td>
                    <td style="width: 203px">
                        <asp:TextBox ID="txtCustomerID" runat="server" Font-Size="10px" onkeyup="CallClientName(this,'PortFolio',event)"
                            Width="188px"></asp:TextBox>
                    </td>
                    <td>
                        <input id="btnShow" type="button" value="Show" class="btnUpdate" style="width: 59px;
                            height: 21px" onclick="BindPortFolio()" />
                    </td>
                    <td>
                        <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="True" BackColor="Navy"
                            ClientInstanceName="exp" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                            SelectedIndex="0" ValueType="System.Int32" Width="130px" meta:resourcekey="cmbExportResource1">
                            <Items>
                                <dxe:ListEditItem Value="0" Text="Select"></dxe:ListEditItem>
                                <dxe:ListEditItem Value="1" Text="PDF"></dxe:ListEditItem>
                                <dxe:ListEditItem Value="2" Text="XLS" ></dxe:ListEditItem>
                                <dxe:ListEditItem Value="3" Text="RTF"></dxe:ListEditItem>
                                <dxe:ListEditItem Value="4" Text="CSV" ></dxe:ListEditItem>
                            </Items>
                            <ClientSideEvents SelectedIndexChanged="OncmbExportSelectedIndexChanged" />
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
                        <asp:HiddenField ID="txtCustomerID_hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <dxwgv:ASPxGridView ID="gridPortFolio" ClientInstanceName="gridPortFolio" KeyFieldName="PortfolioDetail_ID"
                            runat="server" DataSourceID="SqlPortFolio" Width="100%" OnCustomCallback="gridPortFolio_CustomCallback"
                            OnStartRowEditing="gridPortFolio_StartRowEditing" OnCustomJSProperties="gridPortFolio_CustomJSProperties"
                            OnInitNewRow="gridPortFolio_InitNewRow" OnRowDeleting="gridPortFolio_RowDeleting"
                            OnRowInserting="gridPortFolio_RowInserting" OnRowUpdating="gridPortFolio_RowUpdating" OnHtmlEditFormCreated="gridPortFolio_HtmlEditFormCreated">
                            <ClientSideEvents EndCallback="function(s,e){CheckingTD(gridPortFolio.cpExist);height();}" />
                            <Templates><EditForm>
                                    <table>
                                        <tr>
                                            <td class="gridcellleft">
                                                Product Name :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSeriesID" runat="server" Width="158px" TabIndex="1" Font-Size="10px" onkeyup="CallProduct(this,'ProductIDForPortFolio',event)"></asp:TextBox>
                                                <asp:HiddenField ID="txtSeriesID_hidden" runat="server" />
                                            </td>
                                            <td class="gridcellleft">
                                                Holding Mode
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlHoldingMode" runat="server" Font-Size="10px" Width="162px" TabIndex="2"
                                                    onchange="HoldingMode(this.value)">
                                                    <asp:ListItem Text="Demat" Value="D"></asp:ListItem>
                                                    <asp:ListItem Text="Physical" Value="P"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="gridcellleft" id="TdIsin">
                                                ISIN :
                                            </td>
                                            <td id="TdIsin1">
                                                <asp:TextBox ID="txtISIN" runat="server" Width="158px" Font-Size="10px" TabIndex="3" onkeyup="CallISIN(this,'PortFolioISIN',event)"></asp:TextBox>
                                                <asp:HiddenField ID="txtISIN_hidden" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                Buy Quantity
                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox ID="txtBuyQty" runat="server" Font-Size="10px" Width="192px" ClientInstanceName="creceipt"
                                                    TabIndex="4" HorizontalAlign="Right">
                                                    <MaskSettings Mask="&lt;0..9999999999999g&gt;.&lt;00..999&gt;" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                Net Avg. Cost Price
                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox ID="txtNetAvgCost" runat="server" Font-Size="10px" Width="162px"
                                                    ClientInstanceName="creceipt" TabIndex="5" HorizontalAlign="Right">
                                                    <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..999999&gt;" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                Historic Price
                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox ID="txtHistoricPrice" runat="server" Font-Size="10px" Width="168px"
                                                    ClientInstanceName="creceipt" TabIndex="6" HorizontalAlign="Right">
                                                    <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..999999&gt;" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                Sec Transaction Tax
                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox ID="txtSecTax" runat="server" Font-Size="10px" Width="168px" ClientInstanceName="creceipt"
                                                    TabIndex="7" HorizontalAlign="Right">
                                                    <MaskSettings Mask="&lt;0..99999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="gridcellleft" style="width: 166px">
                                                Accquired Date :
                                            </td>
                                            <td style="width: 203px">
                                                <dxe:ASPxDateEdit ID="dtAcquiredDate" runat="server" EditFormat="Custom" TabIndex="8" ClientInstanceName="dtAcquiredDate"
                                                    UseMaskBehavior="True" Width="114px">
                                                    <DropDownButton Text="From">
                                                    </DropDownButton>
                                                    <ClientSideEvents ValueChanged="function(s,e){DateChangeForFrom();}"/>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td style="text-align: right">
                                                <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data" TabIndex="9"
                                                    Height="18px" Width="88px" AutoPostBack="False">
                                                    <ClientSideEvents Click="function(s, e) {gridPortFolio.UpdateEdit();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="text-align: left;" colspan="1">
                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data" TabIndex="10"
                                                    Height="18px" Width="88px" AutoPostBack="False">
                                                    <ClientSideEvents Click="function(s, e) {gridPortFolio.CancelEdit();}" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                
</EditForm>
</Templates>
                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" AllowFocusedRow="True" />
                            <styles>
<Header BackColor="#8EB3E7"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</styles>
                            <Columns>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="PortfolioDetail_ID">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="PortfolioDetail_CustomerID" Caption="Customer Name">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="PortfolioDetail_ProductID" Caption="Product Name">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="2" FieldName="PortfolioDetail_BuyQuantity" Caption="Buy Qty">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="3" FieldName="PortfolioDetail_NetAverageUnitCost" Caption="Net Avg. Cost">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="4" FieldName="PortfolioDetail_NetValue" Caption="Net Value">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="5" FieldName="PortfolioDetail_HostoricalCost" Caption="Historic Cost">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="6" FieldName="PortfolioDetail_TradeDate" Caption="Acc. Date">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="7">
<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="InsertData()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span></a>
                                    
</HeaderTemplate>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
                            <SettingsText ConfirmDelete="Are you sure to Delete this Record!" />
                            <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlPortFolio" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
            </asp:SqlDataSource>
        </div>
        <div style="display: none">
                <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                </dxwgv:ASPxGridViewExporter>
            </div>
    </form>
</body>
</html>
