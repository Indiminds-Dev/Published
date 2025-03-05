<%@ page language="C#" autoeventwireup="true" inherits="management_EmailSetupAddEdit, App_Web_i8xxwgwk" validaterequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
     function ValidatePage()
    {
   
   
       if(document.getElementById("cmbOrganization").value =="0")
      {
       alert('Please Select Company!.');
       return false;
      }
      else  if(document.getElementById("cmbSegment").value =="0")
      {
       alert('Please Select Segment!');
       return false;
      }
//        else if(document.getElementById("txtReplyTo").value =='')
//      {
//       alert('Reply To Email Required!..');
//       return false;
//      }
        else if(document.getElementById("txtFromName").value =='')
      {
       alert('From Name Required!..');
       return false;
      }
//        else if(document.getElementById("txtReplyToName").value =='')
//      {
//       alert('Reply To Name Required!..');
//       return false;
//      }
      
      
      
      
        else if(document.getElementById("txtRUserName").value =='')
      {
       alert('Regular Username  Required!..');
       return false;
      }
        else if(document.getElementById("txtRPassword").value =='')
      {
       alert('Regular Password  Required!.');
       return false;
      }
        else if(document.getElementById("txtOHost").value =='')
      {
       alert('Outgoing Host  Required!.');
       return false;
      }
       else if(document.getElementById("txtOPort").value =='')
      {
       alert('Outgoing Port  Required!.');
       return false;
      }
        else if(document.getElementById("txtIHost").value =='')
      {
       alert('Incoming Host  Required!.');
       return false;
      }
        else if(document.getElementById("txtIPort").value =='')
      {
       alert('Incoming Port  Required!.');
       return false;
      }
      
      
      
    }
    function Close()
    {
    parent.editwin.close();
    }
    
      function MaskMoney(evt) 
    {
    if (!(evt.keyCode == 46 || (evt.keyCode >= 48 && evt.keyCode <= 57))) return false;
    var parts = evt.srcElement.value.split('.');
    if (parts.length > 2) return false;
    if (evt.keyCode == 46) return (parts.length == 1);
    if (parts[0].length >= 14) return false;
    if (parts.length == 2 && parts[1].length >= 2) return false;
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script runat="server">
        //protected void Page_Load(Object Src, EventArgs E) {
        //    //if (!IsPostBack) {

        //        FreeTextBox FreeTextBox1 = new FreeTextBox();
        //        FreeTextBox1.ID = "FreeTextBox1";		
        //        FreeTextBoxPlaceHolder.Controls.Add(FreeTextBox1);

        //    //}
        //}
        //protected void SaveButton_Click(Object Src, EventArgs E)
        //{

        //    FreeTextBox FreeTextBox1 = FreeTextBoxPlaceHolder.FindControl("FreeTextBox1") as FreeTextBox;

        //    Output.Text = FreeTextBox1.Text;
        //}

    </script>

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <table class="TableMain100">
                            <tr>
                                <td class="gridcellleft">
                                    Company:</td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbOrganization" runat="server" Width="255px" Font-Size="11px"
                                        TabIndex="1">
                                    </asp:DropDownList>
                                </td>
                                <td class="gridcellleft">
                                    Segment:</td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbSegment" runat="server" Width="255px" Font-Size="11px" TabIndex="2">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    Email Type:</td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbType" runat="server" Width="255px" Font-Size="11px" TabIndex="3">
                                        <asp:ListItem Text="Normal Email(N)" Value="N"></asp:ListItem>
                                        <asp:ListItem Text="ECN Email(E)" Value="E"></asp:ListItem>
                                        <asp:ListItem Text="Bulk Email(B)" Value="B"></asp:ListItem>
                                        <asp:ListItem Text="Self Service Email(S)" Value="S"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                 
                                 <td class="gridcellleft">
                                   From Name:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtFromName" runat="server" Width="250px" Font-Size="11px" TabIndex="4"></asp:TextBox>
                                </td>
                              
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    From Email:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtRUserName" runat="server" Width="250px" Font-Size="11px" TabIndex="5"></asp:TextBox>
                                </td>
                                <td class="gridcellleft">
                                   From Email Password:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtRPassword" runat="server" Width="250px" Font-Size="11px" TextMode="Password"
                                        TabIndex="6"></asp:TextBox>
                                </td>
                            </tr>
                            
                             
                            
                            <tr>
                                <td class="gridcellleft">
                                    Outgoing SMTP Host:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtOHost" runat="server" Width="250px" Font-Size="11px" TabIndex="7"></asp:TextBox>
                                </td>
                                <td class="gridcellleft">
                                    Outgoing Port:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtOPort" runat="server" Width="250px" Font-Size="11px" TabIndex="8"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    Incoming SMTP Host:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtIHost" runat="server" Width="250px" Font-Size="11px" TabIndex="9"></asp:TextBox>
                                </td>
                                <td class="gridcellleft">
                                    Incoming Port:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtIPort" runat="server" Width="250px" Font-Size="11px" TabIndex="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    SSL Mode:</td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbSSL" runat="server" Width="255px" Font-Size="11px" TabIndex="11">
                                        <asp:ListItem Text="True" Value="true"></asp:ListItem>
                                        <asp:ListItem Text="False" Value="false"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="gridcellleft">
                                    Is Active:</td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbStatus" runat="server" Width="255px" Font-Size="11px" TabIndex="12">
                                        <asp:ListItem Text="Active" Value="Y"></asp:ListItem>
                                        <asp:ListItem Text="Deactive" Value="N"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                              <td class="gridcellleft">
                                     Reply To Name:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtReplyToName" runat="server" Width="250px" Font-Size="11px" 
                                        TabIndex="13"></asp:TextBox>
                                </td>
                               <td class="gridcellleft">
                                    Reply To Email:</td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="txtReplyTo" runat="server" Width="250px" Font-Size="11px" TabIndex="14"></asp:TextBox>
                                </td>
                               
                               
                            </tr>
                            
                            <tr>
                                <td class="gridcellleft">
                                    Disclaimer:</td>
                                <td class="gridcellleft" colspan="3">
                                    <div>
                                    
                                        <asp:PlaceHolder ID="FreeTextBoxPlaceHolder" runat="server" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                </td>
                                <td class="gridcellleft" colspan="3">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                                        TabIndex="15" ValidationGroup="a" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClientClick="Close()"
                                        TabIndex="16" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
