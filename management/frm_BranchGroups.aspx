<%@ page language="C#" autoeventwireup="true" inherits="management_frm_BranchGroups, App_Web_yf04ozfw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
    
    <%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
    <%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    
    <script language="javascript" type="text/javascript">
         FieldName=null;
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
        function EditBranch(bgid)
            {
               var url='frm_AddEditBranchGroup.aspx?branchid='+ bgid;
               //window.open(url,'aa'); 
               parent.OnMoreInfoClick(url,"Edit BranchGroup",'940px','450px','Y');
            
            }
         function AddBranch()
            {
                 var url='frm_AddEditBranchGroup.aspx?branchid=add'
                 //window.open(url,'aa'); 
                 parent.OnMoreInfoClick(url,"Add BranchGroup",'940px','450px','Y');
                        
            }
        function ShowHideFilter(obj)
           {
              grid.PerformCallback(obj);
           }
       
     </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div>
        <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center; height: 20px;">
                        <strong><span style="color: #000099">Branch Groups</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        
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
                </tr>
                <tr>
                    <td>
                       <dxwgv:ASPxGridView ID="gridBranchGroup" KeyFieldName="BranchGroups_ID"  runat="Server" ClientInstanceName="grid" OnCustomCallback="gridBranchGroup_CustomCallback">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Branch Group Name" FieldName="Name" VisibleIndex="0">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Branch Group Code" FieldName="Code" VisibleIndex="1">
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn FieldName="status" VisibleIndex="2">
                                                        <Settings AllowAutoFilter="False"></Settings>
                                                        <DataItemTemplate>
                                                            <a href="javascript:void(0);" onclick="EditBranch('<%# Container.KeyValue %>')">                                                            
                                                                  Edit                                                              
                                                                </a>
                                                        </DataItemTemplate>
                                                        <EditFormSettings Visible="False" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                       <HeaderTemplate>
                                                                <a href="javascript:void(0);" onclick="AddBranch();" ><span style="color: #000099;
                                                                    text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                                        <HeaderStyle Wrap="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            
                             <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                            <Styles>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                            </Styles>
                       </dxwgv:ASPxGridView>
                    </td>
                </tr>              
                
        </table>
    </div>
    </form>
</body>
</html>
