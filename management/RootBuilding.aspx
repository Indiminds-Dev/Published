<%@ page language="C#" autoeventwireup="true" inherits="management_RootBuilding, App_Web_kqhq1k1d" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    

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
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=650)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '650px';
        window.frameElement.Width = document.body.scrollWidth;
    }
     function showhistory(obj)
    {
    
        var URL='Contact_Document.aspx?idbldng='+obj;
       
        //parent.OnMoreInfoClick(URL,"Modify Contact Details",'10px','10px',"Y");
        editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Document", "width=1000px,height=400px,center=0,resize=1,top=-1", "recal");                 
        editwin.onclose=function()
             {
                 grid.PerformCallback();
             }

    }
    function Show() 
    {
        var url = "RootBuildingInsertUpdate.aspx?id=ADD";
       // popup.SetContentUrl(url);
        parent.OnMoreInfoClick(url,"Modify Building Details",'940px','450px',"Y");
       // popup.Show();
    }
    function OnMoreInfoClick(keyValue) 
    {
        var url='RootBuildingInsertUpdate.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Modify Building Details",'940px','450px',"Y");
    }
    function callback()
    {
   // alert('1');
        buildingGrid.PerformCallback('All');
    } 
    </script>

    <%--</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">--%>
    <form id="form1" runat="server">

        <script language="javascript" type="text/javascript">
    
  
//    function OnMoreInfoClick(keyValue) 
//    {
//     var url='RootBuildingInsertUpdate.aspx?id='+ keyValue;
//     
//     frmOpenNewWindow1(url,'450','750');

//    }
    
    
    
   
    function frmOpenNewWindow1(location,v_height,v_weight)
      { 
        var x=(screen.availHeight-v_height)/2;
        var y=(screen.availWidth-v_weight)/2
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ x +",left="+ y +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no'");       
      } 
//    function OnAddButtonClick() 
//    {
//     var url='RootBuildingInsertUpdate.aspx?id=' + 'ADD';
//     frmOpenNewWindow1(url,'450','750');
//    }
//    

           
    function ShowHideFilter(obj)
    {
       buildingGrid.PerformCallback(obj);
    }
        </script>

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="2" style="text-align: center;">
                    <strong><span style="color: #000099">Building Details</span></strong>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; vertical-align: top">
                    <table>
                        <tr>
                            <td id="ShowFilter">
                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                    Show Filter</span></a>
                            </td>
                            <td id="Td1">
                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                    All Records</span></a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="gridcellright">
                    &nbsp;<dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                        ValueType="System.Int32" Width="130px">
                        <items>
                            <dxe:ListEditItem Text="Select" Value="0"/>
                            <dxe:ListEditItem Text="PDF" Value="1" />
                            <dxe:ListEditItem Text="XLS" Value="2" />
                            <dxe:ListEditItem Text="RTF" Value="3" />
                            <dxe:ListEditItem Text="CSV" Value="4" />
                        </items>
                        <buttonstyle backcolor="#C0C0FF" forecolor="Black">
                        </buttonstyle>
                        <itemstyle backcolor="Navy" forecolor="White">
                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                            </HoverStyle>
                        </itemstyle>
                        <border bordercolor="White" />
                        <dropdownbutton text="Export">
                        </dropdownbutton>
                    </dxe:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left" colspan="2">
                    <dxwgv:ASPxGridView ID="RootGrid" ClientInstanceName="buildingGrid" runat="server"
                        AutoGenerateColumns="False" KeyFieldName="Id"  Width="100%"
                        OnHtmlRowCreated="RootGrid_HtmlRowCreated" OnCustomCallback="RootGrid_CustomCallback"
                        OnRowDeleting="RootGrid_RowDeleting">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Building Name" FieldName="Building" VisibleIndex="0"
                                Width="25%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CareTaker" ReadOnly="True" VisibleIndex="1"
                                Width="25%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Address" ReadOnly="True" VisibleIndex="2"
                                Width="25%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="3">
                                <DataItemTemplate>
                                    <%--  <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">Update</a>--%>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        Edit</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099; text-decoration: underline">
                                        Add New</span></a>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="document" ReadOnly="True" VisibleIndex="5"
                                Caption="Document">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                            EditFormColumnCount="1" />
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsText PopupEditFormCaption="Add/Modify CallDisposition" ConfirmDelete="Are You Want To Delete This Record ???" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        <Templates>
                            <EditForm>
                            </EditForm>
                        </Templates>
                    </dxwgv:ASPxGridView>
                    <dxpc:ASPxPopupControl runat="server" ClientInstanceName="popup" CloseAction="CloseButton"
                        ContentUrl="RootBuilding.aspx.cs" HeaderText="Building Master" Left="150" Top="10"
                        Width="700px" Height="400px" ID="ASPXPopupControl">
                        <ContentCollection>
                            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                    </dxpc:ASPxPopupControl>
                </td>
            </tr>
        </table>
        <%--<asp:SqlDataSource ID="RootSource" ConflictDetection="CompareAllValues" runat="server"
            ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand=""
            DeleteCommand="delete from tbl_master_building where bui_id=@Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="decimal" />
            </DeleteParameters>
        </asp:SqlDataSource>--%>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
