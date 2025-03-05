<%@ page language="C#" autoeventwireup="true" inherits="management_frm_TemplateMaster, App_Web_zsukfi_p" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    
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
    
    
    function OnEditButtonClick(keyValue)
    {
      var url='EmailSetupAddEdit.aspx?id='+ keyValue;
      parent.OnMoreInfoClick(url,"Add New Accout",'820px','400px',"Y");
    }
    
      function OnAddButtonClick() 
    {
         var url='frm_TemplateMasterAddEdit.aspx?id=ADD';
         parent.OnMoreInfoClick(url,"Add New Template",'950px','500px',"Y");
    }
    
    function OnShowButtonClick(keyValue) 
    {
         var url='frm_TemplateTypeAdd.aspx?id=Show&TypeID='+ keyValue;;
         parent.OnMoreInfoClick(url,"Add New Accout",'820px','400px',"Y");
    }
    
    
  
     function OnMoreAccessCick(keyValue)
    {
     grid.PerformCallback('Access~'+keyValue);
                   height();

   
    }
    
    
    
       function OnAddEditClick(e,obj)
    {
          var url='frm_TemplateMasterAddEdit.aspx?id='+obj;
         parent.OnMoreInfoClick(url,"Add New Template",'950px','500px',"Y");
//        FieldName='ASPxPopupControl1_ASPxCallbackPanel1_drpBranch';
//        Filter='N';
//        RowID='';
//        var data=obj.split('~');
//        if(data.length>1)
//            RowID=data[1];
//        popup.Show();
//        popPanel.PerformCallback(obj);
    }
    
        function callback()
        {
//               var applicant=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtApplicant_hidden").value;
//               AppBank.PerformCallback(applicant);
//               cmbSubSequentBank.PerformCallback(applicant);
               grid.PerformCallback();
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
            var TemplateName=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtShortName").value; 
            var Content=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtContent").value; 
       
            if(TemplateName =='')
              {
                 alert('Template Name is Required.')
                 return false;
              }
              else if(Content=='')
              {
               alert('Content can not be blank.')
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
    
    function OnAddButtonClick() 
    {
         var url='frm_TemplateMasterAddEdit.aspx?id=ADD';
         parent.OnMoreInfoClick(url,"Add New Template",'950px','500px',"Y");
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div style="height: 800px;">
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Template Master</span></strong>
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
                        <dxwgv:ASPxGridView ID="gridStatus" ClientInstanceName="grid" Width="100%" KeyFieldName="Tmplt_ID"
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
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="Tmplt_ID" Caption="ID">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="Tmplt_UsedFor" Caption="Template UsedFor">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="Tmplt_ShortName" Caption="Template Description">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="12">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnAddEditClick(this,'<%# Container.KeyValue %>')">
                                            <u>Edit</u> </a> &nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
                                                <u>Delete</u> </a>
                                        <%--<a href="javascript:void(0);" onclick="btnDetail_Click('<%# Container.KeyValue %>')">
                                                            <u>Detail</u> </a>--%>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate>
                                        <%--<a href="javascript:void(0);" onclick="OnAddEditClick(this,'AddNew')"><u>Add New</u>
                                        </a>--%>
                                         <a href="javascript:void(0);" onclick="javascript:OnAddButtonClick();"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="False" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                
                                
                                
                                
                                
                                
                                
                                <%-- <dxwgv:GridViewDataTextColumn VisibleIndex="13">
                                                <DataItemTemplate>
                                                    <a href="javascript:void(0);" onclick="OnDeleteClick(this,'Delete~'+'<%# Container.KeyValue %>')">
                                                        <u>Delete</u> </a>
                                                </DataItemTemplate>
                                                <EditFormSettings Visible="False" />
                                                <CellStyle CssClass="gridcellleft">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>--%>
                                <%--<dxwgv:GridViewDataTextColumn VisibleIndex="2" ><DataItemTemplate>
                                
                     
                                                <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                Delete</a>&nbsp;                                  
                                    
</DataItemTemplate>

<CellStyle CssClass="gridcellleft"></CellStyle>
<HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="javascript:OnAddButtonClick();"><span style="color: #000099;
                                            text-decoration: underline">Add Template</span> </a>
                                    
</HeaderTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>--%>
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
                            AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Template Master"
                            EnableHotTrack="False" BackColor="#DDECFE" Width="100%" CloseAction="CloseButton">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl runat="server">
                                    <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="popPanel"
                                        OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                                        <panelcollection>
                                                        <dxp:PanelContent runat="server">
                                                            <table class="TableMain100">
                              <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Template Used For</span>
                                </td>
                                <td class="gridcellleft">
                                          <asp:DropDownList ID="cmbType" runat="server" Width="300px" Font-Size="11px"  TabIndex="6">
                                          <asp:ListItem Value="AL" Text="Both"></asp:ListItem>
                                          <asp:ListItem Value="EM" Text="Employee"></asp:ListItem>
                                          <asp:ListItem Value="CL" Text="Client"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Short Name:</span>
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtShortName" runat="server" Width="300px" Font-Size="11px" TabIndex="1"></asp:TextBox>
                                </td>
                            </tr>
                           
                            
                            <tr id="TrUploadFile">
                                <td class="gridcellleft" >
                                    <span class="Ecoheadtxt"> Content</span>
                                </td>
                                <td class="gridcellleft">
                                <br />
                                
                               <%-- <asp:LinkButton ID="btnReserve" runat="server" Text="Use Reserved Word"></asp:LinkButton>              --%>                  
                                 <a id="btnReserve" runat="server" style="cursor: pointer;"><span style="color: #000099;
                                                                                                    font-size: 8pt; text-decoration: underline;">Use Reserved Variable</span></a>
                                    <asp:TextBox TextMode="MultiLine" ID="txtContent" runat="server" Width="750px" Height="370px" Font-Size="11px"
                                        TabIndex="2"></asp:TextBox>
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
                            </ContentCollection>
                            <HeaderStyle HorizontalAlign="Left">
                                <Paddings PaddingRight="6px" />
                            </HeaderStyle>
                            <SizeGripImage Height="16px" Width="16px" />
                            <CloseButtonImage Height="12px" Width="13px" />
                            <ClientSideEvents CloseButtonClick="function(s, e) {
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
