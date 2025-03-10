<%@ page language="C#" autoeventwireup="true" inherits="Management_rootComp_KRAMemberships, App_Web_lyh0nvfl" %>

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
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

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
    FieldName='btnCancel';
      
    function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="rootcompany_general.aspx"; 
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
        //document.location.href="rootComp_KRAMemberships.aspx";                
        }
        else if ( name == "tab5")
        {
        //alert(name);
         
        document.location.href="Contact_Document.aspx";        
        }
    }
    
//     function OnAuthSigInfoClick(keyValue) 
//    {
//      
//         var url='AuthoSignatory.aspx?id='+keyValue;
////         parent.OnMoreInfoClick(url,"Modify Athorised Signatory Details",'940px','450px',"Y");
//        var HeaderText='Authorised Signatory';
////        var width='940px';
////        var Height='450px'
//         editwin1=dhtmlmodal.open("Editbox", "iframe", url,HeaderText , "width=840px,height=350px,center=1,resize=1,scrolling=2,top=500", "recal")
//         editwin1.onclose=function()
//         {
//               
//         }
//     
//    }
    
     function CallList(obj1,obj2,obj3)
        {
        var obj5='';
                   ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    
   
   
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
     {
     //alert("123");
  
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
    
    function FilterOff(obj)
    {
   
        /*if(obj=='EXA0000001')
        {
              document.getElementById("trSegment").style.display="none";
              document.getElementById("trMemType").style.display="none";
              document.getElementById("TmCode").style.display="none";
              document.getElementById("CmCode").style.display="none";  
              document.getElementById("trSEBI").style.display="none";
              document.getElementById("trExp").style.display="none";
              document.getElementById("TrFMC").style.display="none";
              document.getElementById("TrFmcEX").style.display="none";
              document.getElementById("TrCompOf").style.display="none";
              document.getElementById("Cmbpid").style.display="none";  
              document.getElementById("Trbroker").style.display="none";
              document.getElementById("Trexchange").style.display="none";
    
        }
        else
        {
        
              document.getElementById("trSegment").style.display="inline";
              document.getElementById("trMemType").style.display="inline";
              document.getElementById("TmCode").style.display="inline";
              document.getElementById("CmCode").style.display="inline";
              document.getElementById("trSEBI").style.display="inline";
              document.getElementById("trExp").style.display="inline";
              document.getElementById("TrFMC").style.display="inline";
              document.getElementById("TrFmcEX").style.display="inline";
              document.getElementById("TrCompOf").style.display="inline";
              document.getElementById("Cmbpid").style.display="inline";
              document.getElementById("Trbroker").style.display="inline";
              document.getElementById("Trexchange").style.display="inline";
        
        }*/
    
    }
    

    function ShowHideFilter(obj)
    {
    
           grid.PerformCallback(obj);
    } 
  
     
    
    
    function OnAddEditClick(e,obj)
    {
    
        // FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
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
                var obj='SaveNew';
                popPanel.PerformCallback(obj);
            
        }
        else
        {
            var obj='SaveOld~'+RowID;
            popPanel.PerformCallback(obj);
        }
       
    }
    function EndCallBack(obj,obj1)
    {
  
    
     //Validate();
        if(obj1=='Y')
        {
         alert("Already Exists!..");
         return false;
        }
        
        if(obj1=='S')
        {
         FilterOff('EXA0000001')
        }
        
   
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

//   function calldispose()
//    {
//      var  type=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_cmbType").value;
//            var y=(screen.availHeight-450)/2;
//        var x=(screen.availWidth-900)/2;
//        var str = 'frm_TemplateReservedWord.aspx?Type='+type;
//        window.open(str,"Search_Conformation_Box","height=350,width=700,top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
//      

//    }
    
    
   function btnCancel_Click()
    {
        popup.Hide();
    }
    function EndCall()
        {
            if(grid.cpDelmsg!=null)
                alert(grid.cpDelmsg);
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center" class="EHEADER">
                        <asp:Literal ID="LitCompName" runat="server"></asp:Literal>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="4" ClientInstanceName="page"
                            Width="100%">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
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
                                            <table class="TableMain100">
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
                                                        <dxwgv:ASPxGridView ID="gridKRA" ClientInstanceName="grid" Width="100%" KeyFieldName="KRA_ID"
                                                            DataSourceID="gridStatusDataSource" runat="server" AutoGenerateColumns="False"
                                                            OnCustomCallback="gridStatus_CustomCallback">
                                                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                            <Styles>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                                <FocusedRow BackColor="#FEC6AB">
                                                                </FocusedRow>
                                                            </Styles>
                                                            <ClientSideEvents EndCallback="function(s,e){EndCall();}" />
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="KRA_ID" Caption="ID">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="KRA_IntermediaryID" Caption="KRA IntermediaryID">
                                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="BranchCode" Caption="BranchCode">
                                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="RegionCode" Caption="Region Code">
                                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                </dxwgv:GridViewDataTextColumn>                                                                                                                                
                                                                <dxwgv:GridViewDataTextColumn VisibleIndex="5">
                                                                    <DataItemTemplate>
                                                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'Edit~'+'<%# Container.KeyValue %>')">
                                                                            <u>More Info</u> </a>&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
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
                                                            </Columns>
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                            <SettingsBehavior AllowFocusedRow="True" AllowSort="False" AllowMultiSelection="True" />
                                                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True"
                                                                PageSize="15">
                                                                <FirstPageButton Visible="True">
                                                                </FirstPageButton>
                                                                <LastPageButton Visible="True">
                                                                </LastPageButton>
                                                            </SettingsPager>
                                                            <SettingsText Title="Template" />
                                                            <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                                                        </dxwgv:ASPxGridView>
                                                        <%--<asp:SqlDataSource ID="gridStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                            SelectCommand="">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>--%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <dxpc:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="popup" runat="server"
                                                                    AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="ADD/Modify KRA Memberships Info"
                                                                    EnableHotTrack="False" BackColor="#DDECFE" Width="700px" Height="450px" CloseAction="CloseButton">
                                                                    <ContentCollection>
                                                                        <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                                                            <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="700px" Height="450px"
                                                                                ClientInstanceName="popPanel" OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                                                                <PanelCollection>
                                                                                    <dxp:PanelContent runat="server">
                                                                                        <table class="TableMain100">
                                                                                            <tr>
                                                                                                <td class="gridcellleft">
                                                                                                    KRA Agency:
                                                                                                </td>
                                                                                                <td class="gridcellleft">
                                                                                                    <asp:DropDownList ID="cmbKraAgency" runat="server" Width="300px" TabIndex="0" onchange="FilterOff(this.value);">
                                                                                                        <asp:ListItem Value="1" Text="CVL" Selected="True"></asp:ListItem>
                                                                                                        <asp:ListItem Value="2" Text="NDML" ></asp:ListItem>
                                                                                                        <asp:ListItem Value="3" Text="DOTEX" ></asp:ListItem>
                                                                                                        <asp:ListItem Value="4" Text="CKYC" ></asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                    <asp:HiddenField ID="hdnKRAID" runat="server" />
                                                                                                    <asp:HiddenField ID="hdnCompanyID" runat="server" />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr id="trSegment">
                                                                                                <td class="gridcellleft">
                                                                                                    KRA Intermediary ID :
                                                                                                </td>
                                                                                                <td class="gridcellleft">
                                                                                                    <asp:TextBox ID="txtintermediaryID" runat="server" Width="297px" TabIndex="3" MaxLength="12"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            
                                                                                            <tr id="TmCode">
                                                                                                <td class="gridcellleft">
                                                                                                    Branch Code :
                                                                                                </td>
                                                                                                <td class="gridcellleft">
                                                                                                    <asp:TextBox ID="txtBranchCode" runat="server" Width="297px" TabIndex="4" MaxLength="10"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr id="CmCode">
                                                                                                <td class="gridcellleft">
                                                                                                    Region Code :
                                                                                                </td>
                                                                                                <td class="gridcellleft">
                                                                                                    <asp:TextBox ID="txtRegionCODE" runat="server" Width="297px" TabIndex="5" MaxLength="10"></asp:TextBox>
                                                                                                </td>
                                                                                            </tr>                                                                                          
                                                                                            <tr>
                                                                                                <td class="gridcellleft">
                                                                                                </td>
                                                                                                <td class="gridcellleft">
                                                                                                    <input id="Button1" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                                                                                        style="width: 60px" tabindex="11" />
                                                                                                    <input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                                                                                                        style="width: 60px" tabindex="12" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </dxp:PanelContent>
                                                                                </PanelCollection>
                                                                                <ClientSideEvents EndCallback="function(s, e) {
	                                                                                EndCallBack(s.cpLast,s.cpfast);
                                                                                    }" />
                                                                            </dxcp:ASPxCallbackPanel>
                                                                        </dxpc:PopupControlContentControl>
                                                                    </ContentCollection>
                                                                    <HeaderStyle HorizontalAlign="Left">
                                                                        <Paddings PaddingRight="6px" />
                                                                    </HeaderStyle>
                                                                    <SizeGripImage Height="16px" Width="16px" />
                                                                    <CloseButtonImage Height="12px" Width="13px" />
                                                                    <ClientSideEvents CloseButtonClick="function(s, e) {
	                                                                    popup.Hide();}" />
                                                                </dxpc:ASPxPopupControl>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <%--    <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click"></asp:AsyncPostBackTrigger>--%>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
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
                        <asp:SqlDataSource ID="gridStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="SELECT [KRA_ID],kra_CompanyID,KRA_Agency,KRA_IntermediaryID,BranchCode,RegionCode FROM [Config_KRA]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
