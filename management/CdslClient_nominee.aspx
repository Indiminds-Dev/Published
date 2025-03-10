<%@ page language="C#" autoeventwireup="true" inherits="management_CdslClient_nominee, App_Web_itibbj7j" %>

<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <style type="text/css">
    .AccordionTitle, .AccordionContent, .AccordionContainer
{
  position:relative;
  width:950px;
}

.AccordionTitle
{
  height:20px;
  overflow:hidden;
  cursor:pointer;
  font-family:Arial;
  font-size:8pt;
  font-weight:bold;
  vertical-align:middle;
  
  background-repeat:repeat-x;
  display:table-cell;
  background-color: #eee;
  -moz-user-select:none;
  border:1px solid #ddd;
  Margin:1px;
}

.AccordionContent
{
  height:0px;
  overflow:auto;
  display:block; 
}

.AccordionContainer
{
  border-top: solid 1px #C1C1C1;
  border-bottom: solid 1px #C1C1C1;
  border-left: solid 2px #C1C1C1;
  border-right: solid 2px #C1C1C1;
}
    </style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="runAccordion(1)">

    <script language="javascript" type="text/javascript">
 function SignOff()
 {
     window.parent.SignOff();
 }
 var ContentHeight = 200;
var TimeToSlide = 250.0;

var openAccordion = '';

function runAccordion(index)
{
//alert(index);

  var nID = "Accordion" + index + "Content";
  if(openAccordion == nID)
    nID = '';
    
  setTimeout("animate(" + new Date().getTime() + "," + TimeToSlide + ",'" 
      + openAccordion + "','" + nID + "')", 33);
 
  openAccordion = nID;
  

}
function animate(lastTick, timeLeft, closingId, openingId)
{  

  var curTick = new Date().getTime();
  var elapsedTicks = curTick - lastTick;
  
  var opening = (openingId == '') ? null : document.getElementById(openingId);
  var closing = (closingId == '') ? null : document.getElementById(closingId);
 
  if(timeLeft <= elapsedTicks)
  {
  
    if(opening != null)
      opening.style.height = ContentHeight + 'px';
    
    if(closing != null)
    {
      closing.style.display = 'none';
      closing.style.height = '0px';
    }
    
    if ((document.getElementById('T1').innerHTML=='[ + ]') &&(document.getElementById('Accordion1Content').style.display=='block'))
        {
        
        document.getElementById('T1').innerHTML="[ - ]";
        
        }
     else
        {
        
        document.getElementById('T1').innerHTML="[ + ]";
        }
        
        if ((document.getElementById('T2').innerHTML=='[ + ]') &&(document.getElementById('Accordion2Content').style.display=='block'))
        {
        
        document.getElementById('T2').innerHTML="[ - ]";
        
        }
     else
        {
        
        document.getElementById('T2').innerHTML="[ + ]";
        }
         if ((document.getElementById('T3').innerHTML=='[ + ]') &&(document.getElementById('Accordion3Content').style.display=='block'))
        {
        
        document.getElementById('T3').innerHTML="[ - ]";
        
        }
     else
        {
        
        document.getElementById('T3').innerHTML="[ + ]";
        }
         if ((document.getElementById('T4').innerHTML=='[ + ]') &&(document.getElementById('Accordion4Content').style.display=='block'))
        {
        
        document.getElementById('T4').innerHTML="[ - ]";
        
        }
     else
        {
        
        document.getElementById('T4').innerHTML="[ + ]";
        }
    
      
    
    return;
  }
 
  timeLeft -= elapsedTicks;
  var newClosedHeight = Math.round((timeLeft/TimeToSlide) * ContentHeight);

  if(opening != null)
  {
 
    if(opening.style.display != 'block')
      opening.style.display = 'block';
    opening.style.height = (ContentHeight - newClosedHeight) + 'px';
     
    
  }
  
  if(closing != null)
    closing.style.height = newClosedHeight + 'px';

  setTimeout("animate(" + curTick + "," + timeLeft + ",'" 
      + closingId + "','" + openingId + "')", 33);


}
function disp_prompt(name)
    {
       
        if ( name == "tab0")
        {
            document.location.href="CdslClient_general.aspx"; 
        }
        else if ( name == "tab1")
        {
             document.location.href="CdslClient_jointHolders.aspx"; 
        }
        else if ( name == "tab2")
        {
            document.location.href="CdslClient_aditionalHolder.aspx"; 
        }
        else if ( name == "tab3")
        {
            document.location.href="CdslClient_bankDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
            document.location.href="CdslClient_nominee.aspx"; 
        }
        
        else if ( name == "tab5")
        {
            document.location.href="cdslClientDocuments.aspx"; 
        }
        else if ( name == "tab6")
        {
            document.location.href="cdslClientGroup.aspx"; 
        }
        else if ( name == "tab7")
        {
            document.location.href="cdslClientRemarks.aspx"; 
        }
        else if ( name == "tab8")
        {
            document.location.href="CdslClient_otherDetails.aspx"; 
        }
        
        else if ( name == "tab9")
        {
            document.location.href="CdslClient_OthDetails.aspx"; 
        }
        else if ( name == "tab10")
        {
         document.location.href="cdslClient_Correspondance.aspx"; 
        }
        else if ( name == "tab11")
        {
            document.location.href="cdslClient_Subcriptions.aspx"; 
        }

        
    }
    </script>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
        </asp:ScriptManager>
        <table class="TableMain100">
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="4" ClientInstanceName="page"
                        Width="100%" Font-Size="10px">
                        <TabPages>
                            <dxtc:TabPage Name="General" Text="General">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="JointHolders" Text="Joint Holders">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="AdditionalHolders" Text="Additional Holders">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="BankDetail" Text="Bank Detail">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Nominee_POA" Text="Nominee &amp; POA">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <div id="AccordionContainer" class="AccordionContainer">
                                            <div onclick="runAccordion(1);">
                                                <div class="AccordionTitle" onselectstart="return false;">
                                                    Nominee Details 
                                                    <span id="T1">[ + ]</span>
                                                </div>
                                               
                                            </div>
                                            <div id="Accordion1Content" class="AccordionContent">
                                                <dxwgv:ASPxGridView ID="gridClients" KeyFieldName="CDSLNomineeRegister_ID" Width="950px"
                                                    runat="Server" ClientInstanceName="grid">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="1">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            <DataItemTemplate>
                                                                <%# Container.ItemIndex+1%>
                                                            </DataItemTemplate>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Name" ReadOnly="true" FieldName="CDSLNomineeRegister_Name"
                                                            VisibleIndex="2">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Address" ReadOnly="true" FieldName="add1"
                                                            VisibleIndex="3">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="IsMinor" ReadOnly="true" FieldName="minortext"
                                                            VisibleIndex="4">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Fax" ReadOnly="true" FieldName="CDSLNomineeRegister_Fax"
                                                            VisibleIndex="5">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Pan" ReadOnly="true" FieldName="CDSLNomineeRegister_PANGIR"
                                                            VisibleIndex="6">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Minor DOB" ReadOnly="true" FieldName="CDSLNomineeRegister_DOBMinor1"
                                                            VisibleIndex="7">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Phone" ReadOnly="true" FieldName="CDSLNomineeRegister_PhoneResidence"
                                                            VisibleIndex="8">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Mobile" ReadOnly="true" FieldName="CDSLNomineeRegister_PhoneMobile"
                                                            VisibleIndex="9">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Email" ReadOnly="true" FieldName="CDSLNomineeRegister_Email"
                                                            VisibleIndex="10">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Registration Number" ReadOnly="true" FieldName="CDSLNomineeRegister_ResgitrationNumber"
                                                            VisibleIndex="11">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Registration Date" ReadOnly="true" FieldName="CDSLNomineeRegister_RegistrationDate"
                                                            VisibleIndex="12">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="ITCircleWardDistrict" ReadOnly="true" FieldName="CDSLNomineeRegister_ITCircleWardDistrict"
                                                            VisibleIndex="13">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GuardianName" ReadOnly="true" FieldName="CDSLNomineeRegister_GuardianName"
                                                            VisibleIndex="14">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GuardianAddress" ReadOnly="true" FieldName="add1gur"
                                                            VisibleIndex="15">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GaurdianPhone" ReadOnly="true" FieldName="CDSLNomineeRegister_GaurdianPhoneResidence"
                                                            VisibleIndex="16">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GaurdianMobile" FieldName="CDSLNomineeRegister_GaurdianPhoneMobile"
                                                            VisibleIndex="17">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GuardianFax" ReadOnly="true" FieldName="CDSLNomineeRegister_GuardianFax"
                                                            VisibleIndex="18">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GaurdianPAN" ReadOnly="true" FieldName="CDSLNomineeRegister_GaurdianPANGIR"
                                                            VisibleIndex="19">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GaurdianResgitrationNumber" ReadOnly="true"
                                                            FieldName="CDSLNomineeRegister_GaurdianResgitrationNumber" VisibleIndex="20">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GaurdainRegistrationDate" ReadOnly="true"
                                                            FieldName="CDSLNomineeRegister_GaurdainRegistrationDate" VisibleIndex="21">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GaurdianEmail" ReadOnly="true" FieldName="CDSLNomineeRegister_GaurdianEmail"
                                                            VisibleIndex="22">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GaurdianITCircleWardDistrict" ReadOnly="true"
                                                            FieldName="CDSLNomineeRegister_GaurdianITCircleWardDistrict" VisibleIndex="23">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="CreateUser" ReadOnly="true" FieldName="CDSLNomineeRegister_CreateUser"
                                                            VisibleIndex="24">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                    <Styles>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                        </Header>
                                                    </Styles>
                                                    <SettingsPager NumericButtonCount="20" PageSize="4" ShowSeparators="True" AlwaysShowPager="true">
                                                        <FirstPageButton Visible="True">
                                                        </FirstPageButton>
                                                        <LastPageButton Visible="True">
                                                        </LastPageButton>
                                                    </SettingsPager>
                                                    <Settings ShowHorizontalScrollBar="true" />
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                                </dxwgv:ASPxGridView>
                                            </div>
                                            <div onclick="runAccordion(2);">
                                                <div class="AccordionTitle" onselectstart="return false;">
                                                   <%--<span style="width:400px; float:left;"> &nbsp; </span>--%> 
                                                   POA Details
                                                    <span id="T2">[ + ]</span>
                                                </div>
                                            </div>
                                            <div id="Accordion2Content" class="AccordionContent">
                                                <dxwgv:ASPxGridView ID="Poagrid" KeyFieldName="CDSLPOAMapping_ID" Width="950px" runat="Server"
                                                    ClientInstanceName="grid">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="1">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            <DataItemTemplate>
                                                                <%# Container.ItemIndex+1%>
                                                            </DataItemTemplate>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Registration No" ReadOnly="true" FieldName="CDSLPOAMapping_RegistrarNumber"
                                                            VisibleIndex="2">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Setup Date" ReadOnly="true" FieldName="CDSLPOAMapping_SetupDate1"
                                                            VisibleIndex="3">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="GpabpaFlag" ReadOnly="true" FieldName="CDSLPOAMapping_GPABPAFlag"
                                                            VisibleIndex="4">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="From Date" ReadOnly="true" FieldName="CDSLPOAMapping_FromDate1"
                                                            VisibleIndex="5">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="To Date" ReadOnly="true" FieldName="CDSLPOAMapping_ToDate1"
                                                            VisibleIndex="6">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Remarks" ReadOnly="true" FieldName="CDSLPOAMapping_Remarks"
                                                            VisibleIndex="7">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Holder No" ReadOnly="true" FieldName="CDSLPOAMapping_HolderNumber"
                                                            VisibleIndex="8">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Status" ReadOnly="true" FieldName="CDSLPOAMapping_Status"
                                                            VisibleIndex="9">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Create User" ReadOnly="true" FieldName="CDSLPOAMapping_CreateUser"
                                                            VisibleIndex="10">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                    <Styles>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                        </Header>
                                                    </Styles>
                                                    <SettingsPager NumericButtonCount="20" PageSize="4" ShowSeparators="True" AlwaysShowPager="true">
                                                        <FirstPageButton Visible="True">
                                                        </FirstPageButton>
                                                        <LastPageButton Visible="True">
                                                        </LastPageButton>
                                                    </SettingsPager>
                                                    <Settings ShowHorizontalScrollBar="true" />
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                                </dxwgv:ASPxGridView>
                                            </div>
                                            <div onclick="runAccordion(3);">
                                                <div class="AccordionTitle" onselectstart="return false;">
                                                   <%--<span style="width:400px; float:left;"> &nbsp; </span>--%>
                                                   BO Signatory Details
                                                    <span id="T3">[ + ]</span>
                                                </div>
                                            </div>
                                             <div id="Accordion3Content" class="AccordionContent">
                                                <dxwgv:ASPxGridView ID="Bosignatorygrid" KeyFieldName="CDSLBOSignatory_ID" Width="950px" runat="Server"
                                                    ClientInstanceName="grid">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="1">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            <DataItemTemplate>
                                                                <%# Container.ItemIndex+1%>
                                                            </DataItemTemplate>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Sequence No" ReadOnly="true" FieldName="CDSLBOSignatory_SequenceNumber"
                                                            VisibleIndex="2">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="BO Name" ReadOnly="true" FieldName="CDSLBOSignatory_BOName"
                                                            VisibleIndex="3">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Remarks" ReadOnly="true" FieldName="CDSLBOSignatory_Remarks"
                                                            VisibleIndex="4">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Create user" ReadOnly="true" FieldName="CDSLBOSignatory_CreateUser"
                                                            VisibleIndex="5">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        
                                                       
                                                        
                                                    </Columns>
                                                    <Styles>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                        </Header>
                                                    </Styles>
                                                    <SettingsPager NumericButtonCount="20" PageSize="4" ShowSeparators="True" AlwaysShowPager="true">
                                                        <FirstPageButton Visible="True">
                                                        </FirstPageButton>
                                                        <LastPageButton Visible="True">
                                                        </LastPageButton>
                                                    </SettingsPager>
                                                    <Settings ShowHorizontalScrollBar="true" />
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                                </dxwgv:ASPxGridView>
                                            </div>
                                             <div onclick="runAccordion(4);">
                                                <div class="AccordionTitle" onselectstart="return false;">
                                                   <%--<span style="width:400px; float:left;"> &nbsp; </span>--%> 
                                                   Freeze Details
                                                    <span id="T4">[ + ]</span>
                                                </div>
                                            </div>
                                            <div id="Accordion4Content" class="AccordionContent">
                                                <dxwgv:ASPxGridView ID="Freezegrid" KeyFieldName="CDSLBOFreezeDetail_ID" Width="950px" runat="Server"
                                                    ClientInstanceName="grid">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="1">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            <DataItemTemplate>
                                                                <%# Container.ItemIndex+1%>
                                                            </DataItemTemplate>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Freeze ID" ReadOnly="true" FieldName="CDSLBOFreezeDetail_FreezeID"
                                                            VisibleIndex="2">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Initiation Date" ReadOnly="true" FieldName="CDSLBOFreezeDetail_InitiationDate1"
                                                            VisibleIndex="3">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Activation Date" ReadOnly="true" FieldName="CDSLBOFreezeDetail_ActivationDate1"
                                                            VisibleIndex="4">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Exp Date" ReadOnly="true" FieldName="CDSLBOFreezeDetail_ExpiryDate1"
                                                            VisibleIndex="5">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Frozen For" ReadOnly="true" FieldName="CDSLBOFreezeDetail_FrozenFor"
                                                            VisibleIndex="6">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Status" ReadOnly="true" FieldName="CDSLBOFreezeDetail_Status"
                                                            VisibleIndex="7">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Activation Type" ReadOnly="true" FieldName="CDSLBOFreezeDetail_ActivationType"
                                                            VisibleIndex="8">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                         <dxwgv:GridViewDataTextColumn Caption="Activation Type" ReadOnly="true" FieldName="CDSLBOFreezeDetail_Remarks"
                                                            VisibleIndex="9">
                                                            <CellStyle CssClass="gridcellleft" Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        
                                                       
                                                        
                                                    </Columns>
                                                    <Styles>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                        </Header>
                                                    </Styles>
                                                    <SettingsPager NumericButtonCount="20" PageSize="4" ShowSeparators="True" AlwaysShowPager="true">
                                                        <FirstPageButton Visible="True">
                                                        </FirstPageButton>
                                                        <LastPageButton Visible="True">
                                                        </LastPageButton>
                                                    </SettingsPager>
                                                    <Settings ShowHorizontalScrollBar="true" />
                                                    <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                                </dxwgv:ASPxGridView>
                                            </div>
                                        </div>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Documents" Text="Documents">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Groups" Text="Groups">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Remarks" Text="Remarks">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="AdditionalDetail" Text="Additional Detail">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="OtherDetail" Text="Other Detail">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Correspondance" Text="Correspondance">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Subscription" Text="Subscription">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                        </TabPages>
                        <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
	                                            var Tab6 = page.GetTab(6);
	                                            var Tab7 = page.GetTab(7);
	                                            var Tab8 = page.GetTab(8);
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
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
	                                            else if(activeTab == Tab6)
	                                            {
	                                                disp_prompt('tab6');
	                                            }
	                                            else if(activeTab == Tab7)
	                                            {
	                                                disp_prompt('tab7');
	                                            }
	                                            else if(activeTab == Tab8)
	                                            {
	                                                disp_prompt('tab8');
	                                            }
	                                            else if(activeTab == Tab9)
	                                            {
	                                                disp_prompt('tab9');
	                                            }
	                                            else if(activeTab == Tab10)
	                                            {
	                                                disp_prompt('tab10');
	                                            }
	                                            else if(activeTab == Tab11)
	                                            {
	                                                disp_prompt('tab11');
	                                            }
                                                }" />
                    </dxtc:ASPxPageControl>
                </td>
                <td>
                </td>
            </tr>
        </table>
        <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="cdslClientNomineeDetails" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="CdslClients_BOID" Type="String" />
                       
                    </SelectParameters>
                </asp:SqlDataSource>--%>
    </form>
</body>
</html>
