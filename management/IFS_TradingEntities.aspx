<%@ page language="C#" autoeventwireup="true" inherits="management_IFS_TradingEntities, App_Web_itibbj7j" %>

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
    <title>Trading Entities Details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <script language="javascript" type="text/javascript"></script>
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
    <script type="text/javascript">
    
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
//        if ( name == "tab1")
//        {
//        //alert(name);
//        document.location.href="IFS_TradingEntities.aspx"; 
//        }
        if ( name == "tab2")
        {
        //alert(name);
        document.location.href="IFS_FundManagers.aspx"; 
        }
//        else if ( name == "tab3")
//        {
//        //alert(name);
//        //document.location.href="Contact_DPDetails.aspx"; 
//        }
//        else if ( name == "tab4")
//        {
//        //alert(name);
//        document.location.href="Contact_Document.aspx"; 
//        }
//        else if ( name == "tab12")
//        {
//        //alert(name);
//        document.location.href="Contact_FamilyMembers.aspx"; 
//        }
//        else if ( name == "tab5")
//        {
//        //alert(name);
//        document.location.href="Contact_Registration.aspx"; 
//        }
//        else if ( name == "tab7")
//        {
//        //alert(name);
//        document.location.href="Contact_GroupMember.aspx"; 
//        }
//        else if ( name == "tab8")
//        {
//        //alert(name);
//        document.location.href="Contact_Deposit.aspx"; 
//        }
//        else if ( name == "tab9")
//        {
//        //alert(name);
//        document.location.href="Contact_Remarks.aspx"; 
//        }
//        else if ( name == "tab10")
//        {
//        //alert(name);
//        document.location.href="Contact_Education.aspx"; 
//        }
//        else if ( name == "tab11")
//        {
//        //alert(name);
//        document.location.href="contact_brokerage.aspx"; 
//        }
//        else if ( name == "tab6")
//        {
//        //alert(name);
//            document.location.href="contact_other.aspx"; 
//        }
//         else if(name=="tab13")
//        {
//             document.location.href="contact_Subscription.aspx";
//        }
//        else if(name=="tab14")
//        {
//             document.location.href="Contact_Nominee.aspx";
//        }
    }
    function RefreshPage()
    {
      setTimeout(RefreshWork(),3000);
    }
    function RefreshWork()
    {
      alert('Data Updated Successfully.');
      document.location.href="IFS_TradingEntities.aspx";
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
      document.location.href="IFS_TradingEntities.aspx";
    }
    function OldState()
    {
      document.location.href="IFS_TradingEntities.aspx";
    }

    function CallList(obj,obj1,obj2)
        {
            ajax_showOptions(obj,obj1,obj2);
        } 
    function CallAjaxForTrader(obj,obj1,obj2,obj3)
        {
            var sourcesegmentid=document.getElementById('txtSegment_hidden');
//            ajax_showOptions(obj,obj1,obj2);
            ajax_showOptions(obj,obj1,obj2,obj3);
        } 
        FieldName='ASPxPageControl1_IFSTEDetailsGrid_DXSelInput';
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
            gridIFSTE.UpdateEdit();
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
                   gridIFSTE.PerformCallback('Delete~'+keyValue);
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
         gridIFSTE.PerformCallback('GridBind');       
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
        var len=document.getElementById('ASPxPageControl1_IFSTEDetailsGrid_txtClientID').value;
        alert(len);
    }  
    
    function ShowAddForm() {
        var url = "frmAddEditIFS_TradingEntities.aspx?id=IFS_TradingEntities.aspx&id1=<%=Session["requesttype"]%>&AcType=Add";
        popup.SetContentUrl(url);
        //alert (url);
        popup.Show();
    }
     function ShowEditForm(KeyValue)
    {
       var url = 'frmAddEditIFS_TradingEntities.aspx?id=IFS_TradingEntities.aspx&id1=<%=Session["requesttype"]%>&AcType=Edit&docid='+KeyValue;
        popup.SetContentUrl(url);
        //alert (url);
        popup.Show();
    }
     
    </script>
    

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
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" Width="100%" ActiveTabIndex="1"
                            ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage Name="IFS">
                                <TabTemplate ><span style="font-size:x-small">IFS</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="TradingEntities" >
                                <TabTemplate ><span style="font-size:x-small">TradingEntities</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxwgv:ASPxGridView ID="IFSTEDetailsGrid" runat="server" ClientInstanceName="gridIFSTE" KeyFieldName="Id" AutoGenerateColumns="False" DataSourceID="IFSTEDetailsdata"
                                                Width="100%" Font-Size="10px" OnCustomJSProperties="IFSTEDetailsGrid_CustomJSProperties" 
                                                OnCustomCallback="IFSTEDetailsGrid_CustomCallback" OnHtmlEditFormCreated="IFSTEDetailsGrid_HtmlEditFormCreated" 
                                                OnRowInserting="IFSTEDetailsGrid_RowInserting" OnRowValidating="IFSTEDetailsGrid_RowValidating" OnRowUpdating="IFSTEDetailsGrid_RowUpdating">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" Caption="Type" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False" Caption="ID"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="Trader" Caption="Trader" VisibleIndex="0" Width="100px">
                                                        <EditFormSettings Visible="False" Caption="Trader"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="Company" Caption="Company" VisibleIndex="1">
                                                        <EditFormSettings Visible="False" Caption="Company"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="Segment" Caption="Segment" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" Caption="Segment"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>

                                                    <dxwgv:GridViewDataTextColumn FieldName="DateFrom" Caption="Date From" VisibleIndex="3" Width="60px" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
                                                        <EditFormSettings Visible="True" Caption="Date From"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="DateTo" Caption="Date TO" VisibleIndex="4" Width="60px" PropertiesTextEdit-DisplayFormatString="dd-MM-yyyy">
                                                        <EditFormSettings Visible="True" Caption="Date To"></EditFormSettings>
                                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="TradeId" Caption="TradeId" Visible="False" VisibleIndex="0">
                                                    <EditFormSettings Visible="True" Caption="TradeId"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="CompanyId" Caption="CompanyId" Visible="False" VisibleIndex="0">
                                                    <EditFormSettings Visible="True" Caption="CompanyId"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="SegmentId" Caption="SegmentId" Visible="False" VisibleIndex="0">
                                                    <EditFormSettings Visible="True" Caption="SegmentId"></EditFormSettings>
                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <%--<dxwgv:GridViewCommandColumn VisibleIndex="5">
                                                        <EditButton Visible="True"></EditButton>
                                                        <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridIFSTE.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>--%>

                                                    <%--<dxwgv:GridViewDataTextColumn Width="60px" Caption="Details" VisibleIndex="6">
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
                                                    </dxwgv:GridViewDataTextColumn>--%>
                                                    
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="5"  Width="100px">
                                                          <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                         <DataItemTemplate>
                                                               
                                                                    <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                                    Delete</a>&nbsp;&nbsp;&nbsp;                                                
                                                                 <a href="javascript:void(0);" onclick="ShowEditForm('<%# Container.KeyValue %>');">
                                                                                    Edit</a>      
                                                            
                                                        </DataItemTemplate>
                                                           <HeaderTemplate>
                                                          <a href="javascript:void(0);" onclick="ShowAddForm();"><span style="color: #000099; text-decoration: underline">
                                                                                    Add New</span> </a>
                                                        </HeaderTemplate>
                                                        <EditFormSettings Visible="False"></EditFormSettings>
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

                                                <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify Trading Entities"></SettingsText>

                                                <Styles>
                                                    <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="EHEADER"></Header>
                                                    <AlternatingRow BackColor="AliceBlue" Font-Bold="True"></AlternatingRow>
                                                    <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                                </Styles>
                                                
                                                
                                                <%--New Work 17/10/2024--%>
                                                <%--<Templates>
                                                    <TitlePanel>
                                                        <span style="color :Maroon;font-size :12px">Trading Entities Details</span>
                                                    </TitlePanel>
                                                    <EditForm>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="text-align: center;">
                                                                    <table>
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                Source Company :</td>
                                                                            <td class="lt" style="text-align: left">                                                                       
                                                                                <asp:TextBox ID="txtCompany" runat="server" TabIndex="1" width="200px" Text='<%#Bind("Company") %>'>
                                                                                </asp:TextBox>
                                                                                <asp:Label ID="lblSegmentErrorMsg" runat="server" Text="This Company+Segment is already exists!" ForeColor="red" Visible="false" ></asp:Label>
                                                                                <asp:Label ID="lblCompanyErrorMsg" runat="server" Text="Please Enter Source Company." ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                Source Segment :</td>
                                                                            <td class="lt" style="text-align: left">
                                                                                <asp:Label ID="lblId" runat="server" Text='<%#Bind("Id") %>' Visible="false" ></asp:Label>
                                                                                <asp:TextBox ID="txtSegment" runat="server" TabIndex="2" width="200px" Text='<%#Bind("Segment") %>'>
                                                                                </asp:TextBox>
                                                                                <asp:Label ID="lblSegmentNameErrorMsg" runat="server" Text="Please Enter Source Segment." ForeColor="red" Visible="false" ></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                            <td class="lt" style="text-align: right; width: 30%">
                                                                                Trader Account :</td>
                                                                            <td class="lt" style="text-align: left">
                                                                                <asp:TextBox ID="txtTrader" runat="server" TabIndex="3" width="200px" Text='<%#Bind("Trader") %>'>
                                                                                </asp:TextBox>
                                                                                <asp:Label ID="lblTraderAcErrorMsg" runat="server" Text="Please Enter Trader Account." ForeColor="red" Visible="false" ></asp:Label>
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
                                                                                <asp:TextBox ID="txtCompany_hidden" CssClass="EcoheadCon" Text='<%#Bind("CompanyId") %>'
                                                                                    runat="server" Width="279px"></asp:TextBox>
                                                                            </td>
                                                                            <td colspan="2" style="display: none">
                                                                                <asp:TextBox ID="txtSegment_hidden" CssClass="EcoheadCon" Text='<%#Bind("SegmentId") %>'
                                                                                    runat="server" Width="279px"></asp:TextBox>
                                                                            </td>
                                                                            <td colspan="2" style="display: none">
                                                                                <asp:TextBox ID="txtTrader_hidden" CssClass="EcoheadCon" Text='<%#Bind("TradeId") %>'
                                                                                    runat="server" Width="279px"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                            
                                                                        <tr>
                                                                            <td class="lt" colspan="2" style="text-align: right; width: 30%">
                                                                                <dxe:ASPxButton ID="btnUpdate" runat="server" Text="Update" ToolTip="Update data" TabIndex="6"
                                                                                    Height="18px" width="88px" AutoPostBack="true" OnClick="btnUpdate_Click" AccessKey="U" >
                                                                                   <ClientSideEvents Click="function(s, e) {gridIFSTE.UpdateEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                            <td class="lt" colspan="2" style="text-align: left">
                                                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel data" TabIndex="7"
                                                                                    Height="18px" width="88px" AutoPostBack="False" OnClick="btnCancel_Click" AccessKey="C">
                                                                                    <ClientSideEvents Click="function(s, e) {gridIFSTE.CancelEdit();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>                                                    
                                                    </EditForm>
                                                </Templates>--%>
                                                <%--End of New Work 17/10/2024--%>
                                            </dxwgv:ASPxGridView>
                                            <%--New Work 17/10/2024--%>
                                            <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddEditIFS_TradingEntities.aspx"
                                                CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="420px"
                                                Width="900px" HeaderText="Trading Entities Details" AllowResize="true" ResizingMode="Postponed">
                                                <ContentCollection>
                                                    <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                                    </dxpc:PopupControlContentControl>
                                                </ContentCollection>
                                                <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
                                            </dxpc:ASPxPopupControl>
                                            <%--End of New Work 17/10/2024--%>                                        
                                            </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="FundManagers">
                                <TabTemplate ><span style="font-size:x-small">Fund Managers</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                     </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);	                                            
	                                            var Tab2 = page.GetTab(2);
	                                            
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }	                                           
	                                            if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
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
        <asp:SqlDataSource ID="IFSTEDetailsdata" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="PRC_IFSTEFETCH" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="IFSENTITY_IFSCODE" SessionField="KeyVal_InternalID_New" Type="String" />
<%--                <asp:SessionParameter Name="@ACTION" SessionField="userEntryProfileDP" Type="String" />--%>
            </SelectParameters>           
        </asp:SqlDataSource>
        <asp:HiddenField ID="hdnRights" runat="server" />
    </form>
</body>
</html>
