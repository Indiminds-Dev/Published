<%@ page language="C#" autoeventwireup="true" inherits="management_frmTradeCodeLink, App_Web_yxggcryg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
      <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
    <script language="javascript" type="text/javascript">
   FieldName='btnCancel';
    
       function CallList(obj1,obj2,obj3)
        {
         
            ajax_showOptions(obj1,obj2,obj3)
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
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
    }
  function DeleteRow(keyValue)
    {
             doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   grid.PerformCallback('Delete~'+ keyValue);
                   height();
                }
            else{
                  
                }

   
    }

    function ShowHideFilter(obj)
    {
    
           grid.PerformCallback(obj);
    } 
    
    
 
    
  
  
     function OnMoreAccessCick(keyValue)
    {
     grid.PerformCallback('Access~'+keyValue);
                   height();

   
    }
    
    
    
    function OnAddEditClick(e,obj)
    {
       
    
        FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
        Filter='N';
        RowID='';
        var data=obj.split('~');
        if(data.length>1)
            RowID=data[1];
        popup.Show();
        popPanel.PerformCallback(obj);
    }
    
        function callback()
        {
               var applicant=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
               AppBank.PerformCallback(applicant);
               cmbSubSequentBank.PerformCallback(applicant);
        } 
        
       
     function OnDeleteClick(e,obj)
    {
        if(confirm('Are You Sure you want to Delete This Transaction?')==true)
        {
            grid.PerformCallback(obj);
        }
    }
    function btnSave_Click()
    {
     
        Filter='Y';
        if(RowID=='')
        {

          var TargetName=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtTarget_hidden").value; 
          var SourceName=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtSource_hidden").value; 
         // var SourceCompSeg=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtBroker_hidden").value; 
          var BrokerAcc=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbCompSeg").value; 
             if(TargetName=='')
              {
               alert('Target Client can not be blank.')
                 return false;
              }
               else if(SourceName=='')
              {
               alert('Source can not be blank.')
                 return false;
              }
//               else if(document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_SourceCompSeg").value =="0")
//              {
//                 alert('Company[Segment] can not be blank.')
//                 return false;
//              }
              else if(BrokerAcc=='')
              {
               alert('Broker A/C can not be blank.')
                 return false;
              }
               else
              {
                    var obj='SaveNew';
                    popPanel.PerformCallback(obj);
                   
            }
             
        }
        else
        {
            var obj='SaveOld~'+RowID;
            popPanel.PerformCallback(obj);
        }
       
    }
    function EndCallBack(obj)
    {
        if(obj !='')
        {
            var data=obj.split('~');
            if(data[0]=='Edit')
            {
                
            }
        }
        if(Filter=='Y')
        {
            popup.Hide();
            grid.PerformCallback();
        }
    }

   function calldispose()
    {
      var  type=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value;
            var y=(screen.availHeight-450)/2;
        var x=(screen.availWidth-900)/2;
        var str = 'frm_TemplateReservedWord.aspx?Type='+type;
        window.open(str,"Search_Conformation_Box","height=350,width=700,top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
      

    }
    
    
   function btnCancel_Click()
    {
        popup.Hide();
    }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
     <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">TRADE CODE LINK</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td id="Td1" align="left">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                            text-decoration: underline">All Records</span></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridContract" ClientInstanceName="grid" Width="100%" KeyFieldName="TradeCodeLink_ID"
                            DataSourceID="gridStatusDataSource" runat="server" AutoGenerateColumns="False"
                            OnCustomCallback="gridStatus_CustomCallback">
                            <settingsbehavior allowfocusedrow="True" confirmdelete="True" />
                            <styles>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <FocusedRow BackColor="#FEC6AB">
                                </FocusedRow>
                            </styles>
                            <columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="TradeCodeLink_ID" Caption="ID">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="TargeName" Caption="Trades For[Target Client]">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="SourceName" Caption="Trades Of[Source Client]">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="SourceCompany" Caption="Source Company[Segment]">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                           <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="BrokerAc" Caption="Broker A/C">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn VisibleIndex="5">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Edit~'+'<%# Container.KeyValue %>')">
                                            <u>Edit</u> </a> &nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
                                                <u>Delete</u> </a>
                                       
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate>
                                       <a href="javascript:void(0);" onclick="OnAddEditClick(this,'AddNew')"><u>Add New</u>
                                        </a>
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="False" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                
    
                            </columns>
                            <styleseditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </styleseditors>
                            <settingsbehavior allowfocusedrow="True" allowsort="False" allowmultiselection="True" />
                            <settingspager alwaysshowpager="True" numericbuttoncount="20" showseparators="True"
                                pagesize="15">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </settingspager>
                            <settingstext title="Template" />
                            <settings showgroupedcolumns="True" showgrouppanel="True" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="gridStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="">
                            <SelectParameters>
                                <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                            AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Trade Code Link"
                            EnableHotTrack="False" BackColor="#DDECFE" Width="600px" CloseAction="CloseButton">
                            <contentcollection>
                                <dxpc:PopupControlContentControl runat="server">
                                    <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="600px" ClientInstanceName="popPanel"
                                        OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                        <panelcollection>
                                                        <dxp:PanelContent runat="server">
                                                            <table class="TableMain100">
                              <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Target For[Target Client]:</span>
                                </td>
                                <td class="gridcellleft">
                                     <asp:TextBox ID="txtTarget" runat="server" Width="320px"></asp:TextBox>  
                                     <asp:HiddenField ID="txtTarget_hidden" runat="server" />
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Trades of[Source Client]</span>
                                </td>
                                <td class="gridcellleft">                          
                                     <asp:TextBox ID="txtSource" runat="server"  Width="320px"></asp:TextBox>  
                                     <asp:HiddenField ID="txtSource_hidden" runat="server" />
                                       
                                </td>
                            </tr>
                           
                            
                            <tr id="TrUploadFile">
                                <td class="gridcellleft" >
                                    <span class="Ecoheadtxt"> Source Company[Segment]</span>
                                </td>
                                <td class="gridcellleft">
                               
                              <asp:DropDownList ID="cmbCompSeg" runat="server"  Width="320px"> </asp:DropDownList>
                             
                             
                                  
                                </td>
                            </tr>
                             <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Broker A/C:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtBroker" runat="server"  Width="320px"></asp:TextBox>  
                                     <asp:HiddenField ID="txtBroker_hidden" runat="server" />    
                                </td>
                            </tr>
                            
                       
                            
                            <tr>
                                <td>
                                </td>
                                <td colspan="2" class="gridcellleft">
                                     <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                            style="width: 60px" tabindex="41" />
                                                                        <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                            style="width: 60px" tabindex="42" />
                                </td>
                            </tr>
                        </table>
                                                        </dxp:PanelContent>
                                                    </panelcollection>
                                        <clientsideevents endcallback="function(s, e) {
	                                                    EndCallBack(s.cpLast);
                                                    }" />
                                    </dxcp:ASPxCallbackPanel>
                                </dxpc:PopupControlContentControl>
                            </contentcollection>
                            <headerstyle horizontalalign="Left">
                                <Paddings PaddingRight="6px" />
                            </headerstyle>
                            <sizegripimage height="16px" width="16px" />
                            <closebuttonimage height="12px" width="13px" />
                            <clientsideevents closebuttonclick="function(s, e) {
	 popup.Hide();
}" />
                        </dxpc:ASPxPopupControl>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
