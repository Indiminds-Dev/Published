<%@ page language="C#" autoeventwireup="true" inherits="management_frmDPClientSearch, App_Web_6yanuau_" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
      function selecttion()
        {                   
            var combo=document.getElementById('cmbExport');         
             combo.value='0';
        }
   function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
     {
  
        if(document.body.scrollHeight>=900)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '900px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function ValidatePage()
     {

   selecttion();
   
      if(document.getElementById("txtClientID").value=='')
      {
         alert('Please Type Client ID!..');
         return false;
      }

    }
    
    
      function SearchOpt(obj)
    {
   
         var cmbt=document.getElementById('cmbDuplicate');
         if(cmbt.value == 'Selected')
         {
         
           document.getElementById("TDType").style.display="inline";

            
         }
         else 
         {
           
           document.getElementById("TDType").style.display="none";
         
         }
     
    }
    
//     function callValue(obj)
//     {     
//       if(obj.value !='')
//       {
//        var txt = document.getElementById("ChkBox");
//         txt.disabled = true;
//       }
//   
//     }
//     function CallCheckBox(obj,objchk)
//     {     
//         var txt = document.getElementById("txtClientID");
//         txt.disabled = objchk;
//              var txt1 = document.getElementById("cmbType");
//         txt1.disabled = objchk;
//     
//     }
//     function callValueOnBlur(obj)
//     {
//     
//       if(obj.value !='')
//       {
//        var txt = document.getElementById("ChkBox");
//         txt.disabled = true;
//       }
//       else
//       {
//        var txt = document.getElementById("ChkBox");
//         txt.disabled = false;
//       }

//     }
//      function ShowHideFilter(obj)
//    {
//           grid.PerformCallback(obj);
//    } 
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
             <script language="javascript" type="text/javascript">
                  var prm = Sys.WebForms.PageRequestManager.getInstance(); 
                   prm.add_initializeRequest(InitializeRequest); 
                   prm.add_endRequest(EndRequest); 
                   var postBackElement; 
                   function InitializeRequest(sender, args) 
                   { 
                      if (prm.get_isInAsyncPostBack()) 

                      args.set_cancel(true); 
                      postBackElement = args.get_postBackElement(); 
                      $get('UpdateProgress1').style.display = 'block'; 
                         
                   } 
                   function EndRequest(sender, args) 
                   {
                     $get('UpdateProgress1').style.display = 'none';                         
                   } 
            </script>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <strong><span style="color: #000099">Client Search By DP</span></strong></td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" style="background-color: #B7CEEC;border:solid 1px #ffffff"
                            border="0" width="100%">
                            <tr>
                              <td class="gridcellleft" width="70px">
                                  <span style="font-weight:bold"> Search Only </span>
                                </td>
                                  <td class="gridcellleft" colspan="2">
                                    <asp:DropDownList ID="cmbDuplicate" runat="server" onchange="SearchOpt(this.value)" >
                                       <asp:ListItem Text="Selected" Value="Selected"></asp:ListItem>
                                     <asp:ListItem Text="POA Accounts" Value="POA Accounts"></asp:ListItem>
                                    <asp:ListItem Text="Non-POA Accounts" Value="Non-POA Accounts"></asp:ListItem>
                                    <asp:ListItem Text="Missing DP Details of Own DP Clients" Value="MissingDP"></asp:ListItem>                                      
                                    <asp:ListItem Text="Duplicate DP Details" Value="Duplicate"></asp:ListItem>
                                    <asp:ListItem Text="Without Dp Details" Value="Without"></asp:ListItem>
                                    
                                    
                                    </asp:DropDownList>                              
                                    
                                </td>
                                <td class="gridcellleft" id="TDType"> 
                                    <asp:DropDownList ID="cmbType" runat="server">
                                        <asp:ListItem Text="Client ID" Value="ClientID"></asp:ListItem>
                                        <asp:ListItem Text="DP ID" Value="DPID"></asp:ListItem>
                                    </asp:DropDownList>
                           
                                    <asp:TextBox ID="txtClientID" runat="server" MaxLength="8" TabIndex="1" Width="200px"></asp:TextBox>
                                </td>
                              <%--  <td class="gridcellleft" colspan="2">
                                    OR
                                    <asp:CheckBox ID="ChkBox" runat="server" TabIndex="2" />
                                    Show Only Duplicate DP Details
                                </td>--%>
                                <td class="gridcellright">
                                    <asp:Button ID="btnSave" runat="server" TabIndex="3" Text="Show" CssClass="btnUpdate"
                                        OnClick="btnSave_Click" />
                               
                                    <asp:Button ID="btnExport" runat="server" TabIndex="4" Text="Export to Excel" CssClass="btnUpdate"
                                        OnClick="btnExport_Click" />
                                </td>
                            </tr>
                        </table>
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
                
                 <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 8; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                
                </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table class="TableMain100">
                                    <tr>
                                        <td>
                                            <dxwgv:ASPxGridView ID="gridContract" ClientInstanceName="grid" Width="100%" KeyFieldName="Id"
                                                runat="server" AutoGenerateColumns="False" OnCustomCallback="gridContract_CustomCallback">
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
                                                <dxwgv:GridViewDataTextColumn Visible="False" FieldName="Id" Caption="ID">
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="ClientName" Caption="Client Name">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="Category" Caption="Category">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="DP" Caption="DP">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="ClientOrgID" Caption="Client ID">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="POA" Caption="IS POA">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="POAName" Caption="POA Name">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                
                                                
                                                 <dxwgv:GridViewDataTextColumn VisibleIndex="8" FieldName="PAN" Caption="PAN">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                
                                                 <dxwgv:GridViewDataTextColumn VisibleIndex="9" Visible="false" FieldName="Email" Caption="Email">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                
                                                 <dxwgv:GridViewDataTextColumn VisibleIndex="10" FieldName="Address" Caption="Address">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                
                                                 <dxwgv:GridViewDataTextColumn VisibleIndex="11" FieldName="Phone" Caption="Phone">
                                                    <CellStyle Wrap="True" CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                
                                            </columns>
                                                <styleseditors>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </styleseditors>
                                                <settingsbehavior allowfocusedrow="True" allowsort="False" allowmultiselection="True" />
                                                <settingspager alwaysshowpager="True" numericbuttoncount="20" showseparators="True"
                                                    pagesize="10">
                                                <FirstPageButton Visible="True">
                                                </FirstPageButton>
                                                <LastPageButton Visible="True">
                                                </LastPageButton>
                                            </settingspager>
                                                <settingstext title="Template" />
                                                <settings showgroupedcolumns="True" showgrouppanel="True" />
                                            </dxwgv:ASPxGridView>
                                            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                                            </dxwgv:ASPxGridViewExporter>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <table>
            <tr style="height:400px;">
                                    <td style="height:400px;">
                                    
                                    </td>
                                    </tr>
                                    </table>
        </div>
    </form>
</body>
</html>
