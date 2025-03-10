<%@ page language="C#" autoeventwireup="true" inherits="management_IFS_FundManagers, App_Web__y0k_erv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
    <%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Fund Managers Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff()
    }
    function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="IFS_General.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="IFS_TradingEntities.aspx";
        }
//        if ( name == "tab2")
//        {
//        //alert(name);
//        document.location.href="IFS_FundManagers.aspx"; 
//        }
    }
    function RefreshPage()
    {
      setTimeout(RefreshWork(),3000);
    }
    function RefreshWork()
    {
      alert('Data Updated Successfully.');
      document.location.href="IFS_FundManagers.aspx";
    }
    function RefreshPageEdit()
    {
      setTimeout(RefreshEditWork(),3000);
    }
    function RefreshEditWork()
    {
      var WhichRights = document.getElementById('hdnRights').value;
      if(WhichRights !="F")
      {
        alert("You have no Rights to Update data.");
      }
      else
      {
        alert('Data Updated Successfully.');
      }
      document.location.href="IFS_FundManagers.aspx";
    }
    function OldState()
    {
      document.location.href="IFS_FundManagers.aspx";
    }

    function CallList(obj,obj1,obj2)
        {
            ajax_showOptions(obj,obj1,obj2);
        } 
        FieldName='ASPxPageControl1_IFSFMDetailsGrid_DXSelInput';
    function setvaluetovariable(obj)
    {
        if(obj=='1')
        {
            document.getElementById("TrPoaName").style.display="none";
        }
        else    
        {
            document.getElementById("TrPoaName").style.display="inline";
        }
    }
    
    function DPUpdate(keyValue)
        {
          var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F" && keyValue!="")
          {
            alert("You have no Rights to Update Data.");
          }
          else
          {
            gridIFSFM.UpdateEdit();
          }
        }
    
      function DeleteRow(keyValue)
        {
        var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F")
          {
            alert("You have no Rights to Delete.");
          }
          else
          {
         doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   gridIFSFM.PerformCallback('Delete~'+keyValue);
                   height();
                }
            else{
                  
                }
          }
    }

     //----------Update Status 
     
     
     function btnSave_Click()
    {  
           var obj='SaveOld~'+RowID;
           popPanel.PerformCallback(obj);
        
    }
    
    function OnAddEditClick(e,obj)
    {     
      var data=obj.split('~');
        var WhichRights = document.getElementById('hdnRights').value;
          if(WhichRights !="F")
          {
            alert("You have no Rights to Edit.");
          }
          else
          {
            if(data.length>1)
                RowID=data[1];
            popup.Show();
            popPanel.PerformCallback(obj);
          }
    }

   function EndCallBack(obj)
    {
        if(obj=='Y')
        {
         popup.Hide();        
         alert("Successfully Update!..");  
         gridIFSFM.PerformCallback('GridBind');       
        }
    }
    
     function btnCancel_Click()
    {
        popup.Hide();
    }
    function isNumberKey(evt)
     {
        
        var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && (charCode < 48 || charCode > 57))
                {
                alert('Please Enter only Numeric Value!');
                return false;
                }
             else
                
             return true;   
        
     }
   function isLength()
    {
        alert('dd');  
        var len=document.getElementById('ASPxPageControl1_IFSFMDetailsGrid_txtClientID').value;
        alert(len);
        
    
    }  
     
     
    </script>
    <!--___________________These files are for List Items__________________________-->
    <link href="../CSS/style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <!--___________________________________________________________________________-->
    <style type="text/css">
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table width="100%">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="TableMain100">
                 <tr>
                    <td colspan="2">
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" Width="100%" ActiveTabIndex="2"
                            ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage Name="IFS">
                                <TabTemplate ><span style="font-size:x-small">IFS</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="TradingEntities">
                                <TabTemplate ><span style="font-size:x-small">TradingEntities</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="FundManagers" >
                                <TabTemplate ><span style="font-size:x-small">FundManagers</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxwgv:ASPxGridView ID="IFSFMDetailsGrid" runat="server" ClientInstanceName="gridIFSFM" KeyFieldName="Id" AutoGenerateColumns="False" DataSourceID="IFSFMDetailsdata"
                                                Width="100%" Font-Size="10px" OnCustomJSProperties="IFSFMDetailsGrid_CustomJSProperties" 
                                                OnCustomCallback="IFSFMDetailsGrid_CustomCallback" OnHtmlEditFormCreated="IFSFMDetailsGrid_HtmlEditFormCreated" 
                                                OnRowInserting="IFSFMDetailsGrid_RowInserting" OnRowValidating="IFSFMDetailsGrid_RowValidating" OnRowUpdating="IFSFMDetailsGrid_RowUpdating">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" Caption="Type" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False" Caption="ID"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                                                                       
                                                    <dxwgv:GridViewDataTextColumn FieldName="FundManager" Caption="Fund Manager" VisibleIndex="0" Width="300px">
                                                        <EditFormSettings Visible="False" Caption="FundManager"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn FieldName="DateFrom" Caption="Date From" VisibleIndex="1" Width="60px" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
                                                        <EditFormSettings Visible="True" Caption="Date From"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="DateTo" Caption="Date TO" VisibleIndex="2" Width="60px" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
                                                        <EditFormSettings Visible="True" Caption="Date To"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="FMId" Caption="FMId" Visible="False" VisibleIndex="0">
                                                    <EditFormSettings Visible="True" Caption="FMId"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="5" Width="60px">
                                                        <EditButton Visible="True"></EditButton>
                                                        <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridIFSFM.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>

                                                    <dxwgv:GridViewDataTextColumn Width="60px" Caption="Details" VisibleIndex="6">
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                        <DataItemTemplate>
                                                            <a href="javascript:void(0);"  onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                                                                                    Delete</a>                                                   
                                                        </DataItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <CellStyle Wrap="False"></CellStyle>
                                                        <HeaderTemplate>
                                                            <span style="color: #000099;text-decoration: underline">Delete</span>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>

                                                <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

                                                <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True">
                                                    <FirstPageButton Visible="True"></FirstPageButton>
                                                    <LastPageButton Visible="True"></LastPageButton>
                                                </SettingsPager>

                                                <SettingsEditing PopupEditFormWidth="600px" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center" 
                                                    PopupEditFormVerticalAlign="WindowCenter" PopupEditFormModal="True" EditFormColumnCount="1">
                                                </SettingsEditing>

                                                <Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

                                                <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify Fund Managers"></SettingsText>

                                                <Styles>
                                                    <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="EHEADER"></Header>
                                                    <AlternatingRow BackColor="AliceBlue" Font-Bold="True"></AlternatingRow>
                                                    <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                                </Styles>

                                                <Templates>
                                                    <TitlePanel>
                                                        <span style="color :Maroon;font-size :12px">Fund Managers Details</span>
                                                    </TitlePanel>
                                                    <EditForm>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    <table>
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                Fund Manager :</td>
                                                                            <td class="lt" style="text-align: left">
                                                                                <asp:Label ID="lblId" runat="server" Text='<%#Bind("Id") %>' Visible="false" ></asp:Label>
                                                                                <asp:TextBox ID="txtFundManager" runat="server" TabIndex="1" width="200px" Text='<%#Bind("FundManager") %>'>
                                                                                </asp:TextBox>
                                                                                <asp:Label ID="lblFundManagerErrorMsg" runat="server" Text="Please Enter Fund Manager." ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                                                                                                
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                Date From:</td>
                                                                            <td>
                                                                                <dxe:ASPxDateEdit ID="txtDateFrom" runat="server" ClientInstanceName="DtDateFrom" EditFormat="Custom"
                                                                                    EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="200px" Font-Size="10px" TabIndex="4" Value='<%# Bind("DateFrom") %>'>
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                </dxe:ASPxDateEdit>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                Date To:</td>
                                                                            <td>
                                                                                <dxe:ASPxDateEdit ID="txtDateTo" runat="server" ClientInstanceName="DtDateTo" EditFormat="Custom"
                                                                                    EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="200px" Font-Size="10px" TabIndex="5" Value='<%# Bind("DateTo") %>'>
                                                                                    <ButtonStyle Width="13px">
                                                                                    </ButtonStyle>
                                                                                </dxe:ASPxDateEdit>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                            <td colspan="2" style="display: none">
                                                                                <asp:TextBox ID="txtFundManager_hidden" CssClass="EcoheadCon" Text='<%#Bind("FMId") %>'
                                                                                    runat="server" Width="279px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                            
                                                                        <tr>
                                                                            <td class="lt" colspan="2" style="text-align: right; width: 30%">
                                                                                <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data" TabIndex="6"
                                                                                    Height="18px" width="88px" AutoPostBack="true" OnClick="btnUpdate_Click" AccessKey="U" >
                                                                                   <ClientSideEvents Click="function(s, e) {gridIFSFM.UpdateEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: left">
                                                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data" TabIndex="7"
                                                                                    Height="18px" width="88px" AutoPostBack="False" OnClick="btnCancel_Click"  AccessKey="C">
                                                                                    <ClientSideEvents Click="function(s, e) {gridIFSFM.CancelEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>                                                    
                                                    </EditForm>
                                                </Templates>
                                            </dxwgv:ASPxGridView>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                     </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
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
                    <td colspan="2" style="display: none; visibility: hidden">
                        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="IFSFMDetailsdata" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="PRC_IFSFMFETCH" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="FUNDMANAGER_IFSCODE" SessionField="KeyVal_InternalID_New" Type="String" />
<%--                <asp:SessionParameter Name="@ACTION" SessionField="userEntryProfileDP" Type="String" />--%>
            </SelectParameters>           
        </asp:SqlDataSource>
        <asp:HiddenField ID="hdnRights" runat="server" />
    </form>
</body>
</html>
