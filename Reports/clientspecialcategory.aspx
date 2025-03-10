<%@ page language="C#" autoeventwireup="true" inherits="Reports_clientspecialcategory, App_Web_xpx38is4" enableeventvalidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
  
        if(document.body.scrollHeight>=600)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function ValidatePage()
     {

   selecttion();
//      if(document.getElementById("txtClientID").value=='')
//      {
//         alert('Please Type Client ID!..');
//         return false;
//      }

    }
    
    
     
   function ShowHideFilter(obj)
    {
           grid.PerformCallback(obj);
    } 

    
//    function SearchOpt(obj)
//    {
//   
//         var cmbt=document.getElementById('cmbDuplicate');
//         if(cmbt.value == 'None')
//         {
//             document.getElementById("txtClientID").style.display="inline";
//            document.getElementById("TrFilter").style.display="none"
//         }
//         else if (cmbt.value == 'PANEXEMPT') 
//         {
//             document.getElementById("txtClientID").style.display="none";
//             document.getElementById("TrFilter").style.display="inline";
//             
//         
//         }
//         else
//         {
//         document.getElementById("txtClientID").style.display="none";
//             document.getElementById("TrFilter").style.display="none";
//         }
//     
//    }
//    function ShowHideFilter(obj)
//    {
//         if(document.getElementById('TxtSeg').value=='N')
//           {
//             document.getElementById('TxtTCODE').style.display="none";
//           }
//           else
//           {
//            document.getElementById('TxtTCODE').style.display="inline";
//           }
//        InitialTextVal();
//        if(obj=="s")
//            document.getElementById('TrFilter').style.display="inline";
//        else
//        {
//            document.getElementById('TrFilter').style.display="none";
//            grid.PerformCallback(obj);
//        }
//    }
     function btnSearch_click()
   {
        document.getElementById('TrFilter').style.display="none";
        grid.PerformCallback('s');
   }  
//   function InitialTextVal()
//   {
//   

//        document.getElementById('txtName').value = "ADD1";
//        document.getElementById('txtBranchName').value = "ADD2";
//        document.getElementById('txtCode').value = "ADD3";
//        document.getElementById('txtRelationManager').value = "Landmark";
//        document.getElementById('txtReferedBy').value = "Country";
//        document.getElementById('txtPhNumber').value = "State";
//        document.getElementById('txtContactStatus').value = "City";
////        document.getElementById('txtStatus').value = "Status";
//        
//        document.getElementById('TxtTCODE').value = "Area";
//        //document.getElementById('txtPAN').value = "PAN No.";
//   }  
//    function ClearTextboxes()
//        {
//            document.getElementById('txtName').value = '';
//           
//            document.getElementById('txtBranchName').value = ''; 
//            document.getElementById('txtCode').value= '';
//            document.getElementById('TxtTCODE').value= '';
//            document.getElementById('txtPAN').value= '';
//            document.getElementById('txtRelationManager').value= '';
//            document.getElementById('txtReferedBy').value= '';
//            document.getElementById('txtPhNumber').value= '';           
        //}

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
                        <strong><span style="color: #000099">Client Special Category</span></strong></td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" style="background-color: #B7CEEC;border:solid 1px #ffffff"
                            border="0" width="100%">
                            <tr>
                                <td class="gridcellleft" width="150px">
                               <span style="font-weight:bold"> Special Category </span>
                                </td>
                                <td class="gridcellleft" colspan="2">
                                    <asp:DropDownList ID="cmbDuplicate" runat="server"  OnSelectedIndexChanged="cmbDuplicate_SelectedIndexChanged" >
                                       <asp:ListItem Text="None" Value="None"></asp:ListItem>
                                    <asp:ListItem Text="Politician" Value="Politician"></asp:ListItem>
                                    <asp:ListItem Text="NRI" Value="NRI"></asp:ListItem>
                                    <asp:ListItem Text="Foreign National" Value="Foreign National"></asp:ListItem>
                                    </asp:DropDownList>
                                                                 
                               
                                   
                                </td>
                                
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                <td>
                <table>
               <td  class="gridcellright">
                                    <asp:Button ID="btnSave" runat="server" TabIndex="3" Text="Show" CssClass="btnUpdate"
                                        OnClick="btnSave_Click" />
                              
                                    <asp:Button ID="btnExport" runat="server" TabIndex="4" Text="Export to Excel" CssClass="btnUpdate"
                                        OnClick="btnExport_Click" />
                                </td>
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
                                    top: 8; background-color: white; layer-background-color: white; height: 80; width: 150;'>
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
                                            <dxwgv:ASPxGridView ID="gridContract" ClientInstanceName="grid" Width="100%" 
                                                runat="server" AutoGenerateColumns="False" OnCustomCallback="gridContract_CustomCallback">
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
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="1"  Visible="false" FieldName="CustomerID" Caption="CustomerID">
                                                        <CellStyle Wrap="True" CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="ClientName" Caption="Name">
                                                        <CellStyle Wrap="True" CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                     <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="Ucc" Caption="Ucc">
                                                        <CellStyle Wrap="True" CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="branch" Caption="Branch">
                                                        <CellStyle Wrap="True" CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="PhoneNo" Caption="Phone">
                                                        <CellStyle Wrap="True" CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="Email" Caption="Email">
                                                        <CellStyle Wrap="True" CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="False"></EditFormSettings>
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
        </div>
    </form>
</body>
</html>
