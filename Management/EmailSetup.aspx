<%@ page language="C#" autoeventwireup="true" inherits="management_EmailSetup, App_Web_leuczwkw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%--<%@ Register Assembly="RichTextEditor" Namespace="AjaxControls" TagPrefix="cc1" %>--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
//   function OnMoreInfoClick(keyValue)
//    {
//      var dat=document.getElementById('dtTo_hidden').value;
//       var url='frmClosingRatesAdd.aspx?id='+ keyValue +'&dtfor='+ dat;
//       parent.OnMoreInfoClick(url,"Edit Closing Rates",'820px','400px',"Y");
//   
//    }
    function ShowHideFilter(obj)
    {
           grid.PerformCallback(obj);
    } 
    
    
    function OnEditButtonClick(keyValue)
    {
      var url='EmailSetupAddEdit.aspx?id='+ keyValue;
      parent.OnMoreInfoClick(url,"Add New Accout",'940px','500px',"Y");
    }
    
      function OnAddButtonClick() 
    {
         var url='EmailSetupAddEdit.aspx?id=ADD';
         parent.OnMoreInfoClick(url,"Add New Accout",'940px','500px',"Y");
    }
      function callback()
    {
       grid.PerformCallback();
        height();
    }  
    
     function OnMoreAccessCick(keyValue)
    {
     grid.PerformCallback('Access~'+keyValue);
                   height();
//       var url='AddCandidateForOLetter.aspx?id='+ keyValue+'&mode=edit' ;
//       parent.OnMoreInfoClick(url,"Edit Candidate",'960px','550px',"Y");
   
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Email Accounts Setup</span></strong>
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
                        <dxwgv:ASPxGridView ID="gridStatus" ClientInstanceName="grid" Width="100%" KeyFieldName="EmailAccounts_ID"
                            DataSourceID="gridStatusDataSource" runat="server" AutoGenerateColumns="False"
                            OnCustomCallback="gridStatus_CustomCallback">
                            <settingsbehavior allowfocusedrow="True" confirmdelete="True" />
                            <styles>
                                <FocusedRow CssClass="gridselectrow" BackColor="#FCA977">
                                </FocusedRow>
                                <FocusedGroupRow CssClass="gridselectrow" BackColor="#FCA977">
                                </FocusedGroupRow>
                            </styles>
                            <settingspager numericbuttoncount="20" pagesize="20" showseparators="True" alwaysshowpager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </settingspager>
                            <columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="EmailAccounts_ID" Caption="ID" >
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                            
                                <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="Company" 
                                    Caption="Company">
                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="Segment" 
                                    Caption="Segment">
                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="EmailType"
                                    Caption="Email Type">
                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="EmailAccounts_EmailID"
                                    Caption="From Email" Visible="true">
                                    <CellStyle CssClass="gridcellleft" >
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                 
                                  
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="EmailAccounts_Password"
                                    Caption="Password" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                 
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="EmailAccounts_SMTP"
                                    Caption="SMTP Host" Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                
                                    <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="EmailAccounts_SMTPPort"
                                    Caption="SMTP Port" Visible="true">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                

                                    <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="EmailAccounts_POP"
                                    Caption="SMTP Pop" Visible="false">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>

                                    <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="EmailAccounts_POPPort"
                                    Caption="Pop Prot" Visible="false">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                    
                                </dxwgv:GridViewDataTextColumn>
                                  <dxwgv:GridViewDataTextColumn VisibleIndex="8" FieldName="EmailAccounts_ReplyToAccount"
                                    Caption="ReplyTo Email" Visible="false">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                    
                                </dxwgv:GridViewDataTextColumn>
                                
                                  <dxwgv:GridViewDataTextColumn VisibleIndex="11" FieldName="EmailAccounts_Disclaimer"
                                    Caption="Disclaimer" Visible="False" >
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                    
                                </dxwgv:GridViewDataTextColumn>
                                
                        <dxwgv:GridViewDataTextColumn VisibleIndex="9" FieldName="ActiveInd"
                                    Caption="Staus">
                                    <CellStyle CssClass="gridcellleft" Wrap="True">
                                    </CellStyle>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                    
                                </dxwgv:GridViewDataTextColumn>
                                
                                         
                                <dxwgv:GridViewDataTextColumn VisibleIndex="10"  Width="60px">
                                      <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                     <DataItemTemplate>
                                                
                                                <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                Delete</a>&nbsp;|&nbsp;<a href="javascript:void(0);" onclick="OnMoreAccessCick('<%# Container.KeyValue %>')">
                                                        Allow</a>&nbsp;|&nbsp;<a href="javascript:void(0);" onclick="OnEditButtonClick('<%# Container.KeyValue %>')">More Info</a>
                             
                                    </DataItemTemplate>
                                       <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="javascript:OnAddButtonClick();"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                       
                            </columns>
                            <settingstext confirmdelete="Are You Want To Delete This Record ???" />
                            <styleseditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </styleseditors>
                            <settings showhorizontalscrollbar="True" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="gridStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="">
                            <SelectParameters>
                                <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <table align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <%-- <cc1:RichTextEditor ID="richeditor" Theme="Blue"  runat="server" />  --%>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
