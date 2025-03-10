<%@ page language="C#" autoeventwireup="true" inherits="management_cntrgenpattern, App_Web_4andsqnv" %>

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

            var Content=document.getElementById("ASPxPopupControl1_ASPxCallbackPanel1_txtContent").value; 
       
         
              if(Content=='')
              {
               alert('Start Number can not be blank.')
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
    <div style="height: 800px;">
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">CONTRACT NUMBER GENERATION PATTERN</span></strong>
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
                        <dxwgv:ASPxGridView ID="gridContract" ClientInstanceName="grid" Width="100%" KeyFieldName="CntrGenPattern_ID"
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
                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="CntrGenPattern_ID" Caption="ID">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="PatternType" Caption="Generation Order">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="StartDate" Caption="Start Date">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="CntrGenPattern_StartNumber" Caption="Start Number">
                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                           <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="ReasetPatern" Caption="Reset Pattern">
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
                                        Edit/Delete
                                    </HeaderTemplate>
                                    <HeaderStyle Wrap="False" />
                                </dxwgv:GridViewDataTextColumn>
                                
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="6">
                                    <DataItemTemplate>
                                      ##                                      
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
                            AllowDragging="True" PopupHorizontalAlign="OutsideRight" HeaderText="Template Master"
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
                                    <span class="Ecoheadtxt">Generation Order Type:</span>
                                </td>
                                <td class="gridcellleft">
                                          <asp:DropDownList ID="cmbType" runat="server" Width="200px" Font-Size="11px"  TabIndex="6">
                                          <asp:ListItem Value="1" Text="Branch+UCC"></asp:ListItem>
                                          <asp:ListItem Value="2" Text="Branch+ClientName"></asp:ListItem>
                                          
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Start Date:</span>
                                </td>
                                <td class="gridcellleft">                          
                                    
                                          <dxe:ASPxDateEdit ID="txtTranDate" runat="server" ClientInstanceName="Tdate" EditFormat="Custom"
                                                                                                    UseMaskBehavior="True" Width="202px" Font-Size="10px" TabIndex="1">
                                                                                                    <ButtonStyle Width="13px">
                                                                                                    </ButtonStyle>
                                                                                                </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                           
                            
                            <tr id="TrUploadFile">
                                <td class="gridcellleft" >
                                    <span class="Ecoheadtxt"> Start Number</span>
                                </td>
                                <td class="gridcellleft">
                                <br />
                           
                                    <asp:TextBox  ID="txtContent" runat="server" Width="200px" Font-Size="11px"
                                        TabIndex="2"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Generation Order Type:</span>
                                </td>
                                <td class="gridcellleft">
                                          <asp:DropDownList ID="cmbReset" runat="server" Width="200px" Font-Size="11px"  TabIndex="6">
                                          <asp:ListItem Value="F" Text="Financial Year"></asp:ListItem>
                                          <asp:ListItem Value="C" Text="Calender Year"></asp:ListItem>
                                          
                                    </asp:DropDownList>
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
