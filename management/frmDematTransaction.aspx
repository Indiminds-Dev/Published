<%@ page language="C#" autoeventwireup="true" inherits="management_frmDematTransaction, App_Web__yen2upk" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <!--___________________________________________________________________________-->
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
		z-index:30000;
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
		z-index:5000;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
 
    function callback()
        {
            DematGrid.PerformCallback();
        } 
 
     function OnAddButtonClick() 
    {
    var datefo=TxtApplicableDate.GetText();
     var acid= document.getElementById("DDAcountType").value;
     var typ= document.getElementById("cmbType").value;
     alert(typ);
//    alert(datefo);
//    alert(acid);
    
         var url='frmDematAddNew.aspx?id=' + 'ADD'+'&dt='+ datefo +'&ac='+ acid+'&type='+ typ;
         parent.OnMoreInfoClick(url,"Add New Demat Transaction",'700px','350px',"Y");
    }
 
  var globvar;
    function keyVal(obj)
    {
    globvar=obj;
    //alert(obj);
    }
     function CallList(obj1,obj2,obj3)
    {
       ajax_showOptions(obj1,obj2,obj3,null,'Main');
    }
    function CallList1(obj1,obj2,obj3)
    {
       ajax_showOptions(obj1,obj2,obj3,null,'Main');
    }
    
     function CallList2(obj1,obj2,obj3)
    {
        ajax_showOptions(obj1,obj2,obj3,globvar);
    }
    FieldName='UpdateButton';
   function TypeSelect1()
        {
         

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
     function OnMoreInfoClick(keyValue)
      {
         var typ= document.getElementById("cmbType").value;
       var url='frmDematAddNew.aspx?id='+keyValue+'&type='+typ;
        parent.OnMoreInfoClick(url,"Update Demat Transaction",'700px','350px',"Y");
   
    }
    
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
          <%-- <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True">
            </asp:ScriptManager>--%>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Demat Transaction</span></strong></td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td width="200px">
                                    Demat Opening Stocks For :
                                </td>
                                <td>
                                    <asp:DropDownList ID="cmbType" runat="server" Width="100px" Font-Size="10px" AutoPostBack="true" OnChange="javascript:TypeSelect1(this);"
                                        OnSelectedIndexChanged="cmbType_SelectedIndexChanged" TabIndex="1">
                                        <asp:ListItem Value="A">Client Margin </asp:ListItem>
                                        <asp:ListItem Value="B">Pro-Holding </asp:ListItem>
                                        <asp:ListItem Value="C">Holding In Pool A/c </asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td width="200px">
                                    Select Account :
                                </td>
                                <td>
                                <%--<asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                       <ContentTemplate>--%>
                                    <asp:DropDownList ID="DDAcountType" runat="server" Width="400px">
                                    </asp:DropDownList>
                                   <%-- </ContentTemplate>
                                    </asp:UpdatePanel>
                                     <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="cmbType" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
                                        </Triggers>--%>
                                    </td>
                            </tr>
                            
                            <tr>
                                <td width="200px">
                                    Opening Stock As On:
                                </td>
                                <td>
                                    <dxe:ASPxDateEdit ID="TxtApplicableDate"   runat="server" EditFormat="Custom" UseMaskBehavior="true"
                                        Width="200px" ClientInstanceName="TxtApplicableDate">
                                        <ButtonStyle Width="13px"></ButtonStyle>
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td width="200px">
                                </td>
                                <td>
                                    <asp:Button ID="btnSave" CssClass="btnUpdate" runat="server" Text="Show" OnClick="btnSave_Click1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="showGrid1">
                    <td>
                        <dxwgv:ASPxGridView ID="DematGrid" ClientInstanceName="DematGrid" KeyFieldName="DematTransactions_ID"
                            DataSourceID="DematDataSource" runat="server" Width="100%" AutoGenerateColumns="False" OnCustomCallback="DematGrid_CustomCallback"
                            >
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="DematTransactions_ID" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Client" FieldName="DematTransactions_CustomerID"
                                    VisibleIndex="4" Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Scrip" FieldName="DematTransactions_ProductSeriesID"
                                    VisibleIndex="5" Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                               
                                <dxwgv:GridViewDataTextColumn Caption="ISIN" FieldName="DematTransactions_ISIN" VisibleIndex="4"
                                    Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn Caption="Settlement No" FieldName="DematTransactions_SettlementNumberS"
                                    VisibleIndex="4" Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Quantity" FieldName="DematTransactions_Quantity"
                                    VisibleIndex="5" Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Rmarks" FieldName="DematTransactions_Remarks"
                                    VisibleIndex="5" Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <%--<dxwgv:GridViewCommandColumn VisibleIndex="7">
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <HeaderTemplate>
                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>
                                        <a href="javascript:void(0);" onclick="DematGrid.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                        <%} %>
                                    </HeaderTemplate>
                                </dxwgv:GridViewCommandColumn>--%>
                                
                                
                                  <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="5" Width="5%">
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        Edit</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="javascript:OnAddButtonClick();"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                                
                                
                                
                            </Columns>
                            <Settings ShowTitlePanel="false" />
                            <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" />
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsBehavior AllowFocusedRow="true" ConfirmDelete="True" />
                            <Styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                           
                            <Templates>
                             
                            </Templates>
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="DematDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                       <%-- SelectCommand="select DematTransactions_ID,DematTransactions_FinYear,DematTransactions_Date,DematTransactions_CompanyID,DematTransactions_SegmentID,DematTransactions_BranchID,DematTransactions_CustomerID,DematTransactions_ProductSeriesID,DematTransactions_ISIN,DematTransactions_Type,DematTransactions_SettlementNumberS,DematTransactions_SettlementTypeS,DematTransactions_Quantity,DematTransactions_OwnAccountS,DematTransactions_Remarks,DematTransactions_GenerationType,DematTransactions_GenerateUser,DematTransactions_IsAuthorized from  Trans_DematTransactions"
                       InsertCommand=" ">--%>
                       
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr id="showGrid2"">
                    <td>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
