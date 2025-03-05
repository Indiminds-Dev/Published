<%@ page language="C#" autoeventwireup="true" inherits="management_ArbFinalSettlement, App_Web_amufh4kc" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Arbitrage Final Settlement Process</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript">

    function Page_Load()///Call Into Page Load
            {
                 Hide('TabGrid');   
                 height();
            }
   function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
   function fnAlert(obj,TxtId)
   {
        if(obj=="1")
        {
         Hide('TabGrid');   
         alert('No Record Found !!');
        }
        if(obj=="2")
        {
          Show('TabGrid');  
          TabIndexSet_SettelPl(TxtId);
        }
        if(obj=="3")
        {
          Show('TabGrid');  
          TabIndexSet_SettelPl(TxtId);
          alert('Settel P/L Should Be Less Than [(Net PL)-(Shared PL)] !!');
        }
        if(obj=="4")
        {
          Hide('TabGrid');  
          alert('Final Settelment Process Generate Successfully !!');
        }
        if(obj=="5")
        {
          Hide('TabGrid');  
          alert('Final Settelment Process Deleted Successfully !!');
        }
        if(obj=="6")
        {
          Show('TabGrid');  
          alert('Total Of "Other Adjustment" Should Be 0.00!!');
        }
         height();
   }
    function isNumberKey(e)      
        {     
      
            var keynum
            var keychar
            var numcheck
            if(window.event)//IE
            {
                keynum = e.keyCode 
                if(keynum>=48 && keynum<=57 || keynum==46 || keynum==45)
                   {
                      return true;
                   }
                else
                    {
                     alert("Please Insert Numeric Only");
                     return false;
                    }
             } 
         
         else if(e.which) // Netscape/Firefox/Opera
           {
               keynum = e.which  
               if(keynum>=48 && keynum<=57 || keynum==46 || keynum==45)
                     {
                      return true;
                     }
                     else
                     {
                     alert("Please Insert Numeric Only");
                     return false;
                     }     
                }
        }
  function TabIndexSet_SettelPl(obj)
    {
       
        document.getElementById(obj).focus();
        document.getElementById(obj).select();
    }
     </script>
 

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
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
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Arbitrage Final Settlement Process</span></strong></td>

           
            </tr>
        </table>
            <table border="10" cellpadding="1" cellspacing="1" id="TabSelect">
                <tr valign="top">
                 <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Generate Type :
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="dllGenerate" runat="server" Width="100px" Font-Size="10px">
                                        <asp:ListItem Value="1">Generate</asp:ListItem>
                                        <asp:ListItem Value="2">Delete</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Settlement Cycle :
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="DdlCycle" runat="server" Font-Size="10px">
                                    </asp:DropDownList></td>
                            </tr>
                        </table>
                    </td>
                   
                    <td colspan="2"><asp:Button ID="btnGenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                        Width="101px" OnClick="btnGenerate_Click"/>
</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font></td>
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
              
            </table>
              <table id="TabGrid">
                  <tr>
                      <td>
                          <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                              <ContentTemplate>
                                  <asp:GridView ID="GridFinalSettlement" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                      AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px">
                                      <Columns>
                                          <asp:TemplateField HeaderText="Group Code">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:Label ID="lblGroupCode" runat="server" Text='<%# Eval("GroupCode")%>' CssClass="gridstyleheight1"></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Client Name">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:Label ID="lblClientname" runat="server" Text='<%# Eval("Clientname")%>' CssClass="gridstyleheight1"></asp:Label>
                                                  <asp:Label ID="lblClientid" runat="server" Text='<%# Eval("Clientid")%>' Visible="false"></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="B/f PL">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:Label ID="lblBfPlDisply" runat="server" Text='<%# Eval("BfPlDisply")%>' CssClass="gridstyleheight1"></asp:Label>
                                                  <asp:Label ID="lblBfPl" Visible="false" runat="server" Text='<%# Eval("BfPl")%>'
                                                      CssClass="gridstyleheight1"></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Current PL">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:Label ID="lblCurrenctPlDisply" runat="server" Text='<%# Eval("CurrenctPlDisply")%>' CssClass="gridstyleheight1"></asp:Label>
                                                  <asp:Label ID="lblCurrenctPl" Visible="false" runat="server" Text='<%# Eval("CurrenctPl")%>'
                                                     ></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Fixed Cost">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:Label ID="lblFixedCostDisply" runat="server" Text='<%# Eval("FixedCostDisply")%>' CssClass="gridstyleheight1"></asp:Label>
                                                 <asp:Label ID="lblFixedCost" Visible="false" runat="server" Text='<%# Eval("FixedCost")%>'
                                                     ></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Net PL">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:Label ID="lblNetPlDisply" runat="server" Text='<%# Eval("NetPlDisply")%>' CssClass="gridstyleheight1"></asp:Label>
                                                  <asp:Label ID="lblNetPl" Visible="false" runat="server" Text='<%# Eval("NetPl")%>'
                                                      CssClass="gridstyleheight1"></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Other Adj.">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:TextBox ID="txtOtherAddj" AutoPostBack="True" Font-Size="10px" Width="60px" runat="server"
                                                      Onkeypress="return isNumberKey(event)" Text='<%# Eval("SettelPL") %>' Style="text-align: right;" OnTextChanged="txtOtherAddj_TextChanged"
                                                      ></asp:TextBox>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Shared PL">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:Label ID="lblSharedPlDisply" runat="server" Text='<%# Eval("SharedPlDisply")%>'
                                                      CssClass="gridstyleheight1"></asp:Label>
                                                  <asp:Label ID="lblSharedPl" Visible="false" runat="server" Text='<%# Eval("SharedPl")%>'
                                                      CssClass="gridstyleheight1"></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Settel P/L">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:TextBox ID="txtSettelPL" AutoPostBack="True" Font-Size="10px" Width="60px" runat="server"
                                                      Onkeypress="return isNumberKey(event)" Text='<%# Eval("SettelPL") %>' Style="text-align: right;"
                                                      OnTextChanged="txtSettelPL_TextChanged"></asp:TextBox>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="C/f PL">
                                              <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                              <ItemTemplate>
                                                  <asp:Label ID="lblCfPl" runat="server" Text='<%# Eval("CfPl")%>' CssClass="gridstyleheight1"></asp:Label>
                                              </ItemTemplate>
                                          </asp:TemplateField>
                                      </Columns>
                                      <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                          BorderWidth="1px"></RowStyle>
                                      <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                          Font-Bold="True" Wrap="False"></HeaderStyle>
                                  </asp:GridView>
                              </ContentTemplate>
                              <Triggers>
                                  <asp:AsyncPostBackTrigger ControlID="btnGenerate" EventName="Click" />
                              </Triggers>
                          </asp:UpdatePanel>
                      </td>
                  </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnProcessing2" runat="server" Text="Generate Final Settelment" CssClass="btnUpdate"
                                                    Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnProcessing2_Click"  />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnProcessing2" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>