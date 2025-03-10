<%@ page language="C#" autoeventwireup="true" inherits="management_frm_TemplateMasterAddEdit, App_Web_5zwtjf_c" validaterequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script language="javascript" type="text/javascript">
     function calldispose()
    {
   
      var  type=document.getElementById("cmbType").value;
            var y=(screen.availHeight-450)/2;
        var x=(screen.availWidth-900)/2;
        var str = 'frm_TemplateReservedWord.aspx?Type='+type;
      //  editwin=dhtmlmodal.open("Editbox", "iframe", str, "Bill For - "+type+"", "width=640px,height=350px,center=1,resize=1,top=500", "recal");    
        window.open(str,"Search_Conformation_Box","height=350,width=700,top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
      

    }
    
     
    
     function calback()
     {
       alert("123");
     }
      function Close()
    {
    parent.editwin.close();
    }
        function  TypeSet(obj)
    { 
       if(obj=='ND')
       {
            document.getElementById("trFName").style.display="none";
            document.getElementById("trMName").style.display="none";
            document.getElementById("trLName").style.display="none";
            document.getElementById("trCode").style.display="inline";
            document.getElementById("trAdd1").style.display="inline";
            document.getElementById("trAdd2").style.display="inline";
            document.getElementById("trAdd3").style.display="inline";
            document.getElementById("trCity").style.display="inline";
            document.getElementById("trState").style.display="none";
            document.getElementById("trCountry").style.display="none";
            document.getElementById("trPIN").style.display="inline";
            document.getElementById("trISD").style.display="none";
            document.getElementById("trSTD").style.display="none";
            document.getElementById("trPhone").style.display="inline";
            document.getElementById("trMob").style.display="none";
            document.getElementById("trPAN").style.display="inline";
            document.getElementById("trDOB").style.display="none";
            document.getElementById("trClientName").style.display="inline";
            
            
            document.getElementById("trSalutaion").style.display="none";
           
       }
       else if(obj=='CD')
       {
         document.getElementById("trFName").style.display="none";
            document.getElementById("trMName").style.display="none";
            document.getElementById("trLName").style.display="none";
            document.getElementById("trCode").style.display="inline";
            document.getElementById("trAdd1").style.display="inline";
            document.getElementById("trAdd2").style.display="inline";
            document.getElementById("trAdd3").style.display="inline";
            document.getElementById("trCity").style.display="inline";
            document.getElementById("trState").style.display="inline";
            document.getElementById("trCountry").style.display="none";
            document.getElementById("trPIN").style.display="inline";
            document.getElementById("trISD").style.display="none";
            document.getElementById("trSTD").style.display="none";
            document.getElementById("trPhone").style.display="inline";
            document.getElementById("trMob").style.display="none";
            document.getElementById("trPAN").style.display="inline";
            document.getElementById("trDOB").style.display="none";
            document.getElementById("trClientName").style.display="inline";
            
            document.getElementById("trSalutaion").style.display="none";
       }
       else
       {
           document.getElementById("trFName").style.display="inline";
            document.getElementById("trMName").style.display="inline";
            document.getElementById("trLName").style.display="inline";
            document.getElementById("trCode").style.display="inline";
            document.getElementById("trAdd1").style.display="inline";
            document.getElementById("trAdd2").style.display="inline";
            document.getElementById("trAdd3").style.display="inline";
            document.getElementById("trCity").style.display="inline";
            document.getElementById("trState").style.display="inline";
            document.getElementById("trCountry").style.display="inline";
            document.getElementById("trPIN").style.display="inline";
            document.getElementById("trISD").style.display="inline";
            document.getElementById("trSTD").style.display="inline";
            document.getElementById("trPhone").style.display="inline";
            document.getElementById("trMob").style.display="inline";
            document.getElementById("trPAN").style.display="inline";
            document.getElementById("trDOB").style.display="inline";
            document.getElementById("trClientName").style.display="none";
            
            document.getElementById("trSalutaion").style.display="inline";
       }
          
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <%--     <asp:ScriptManager ID="ScriptManager1" runat="server"  		#FAF8CC B7CEEC AsyncPostBackTimeout="3600">
            </asp:ScriptManager>--%>
            <table class="TableMain100"  >
                <tr>
                    <td colspan="2">
                        <table style="margin: 0px 0px 0px 0px; background-color: #EBDDE2;border:solid 1px black"  width="100%" >
                            <tr>
                                <td class="gridcellleft">
                                    <span class="Ecoheadtxt">Template Used For:</span>
                                </td>
                                <td class="gridcellleft" colspan="2">
                                    <asp:DropDownList ID="cmbType" runat="server" Width="300px" Font-Size="11px" TabIndex="6"
                                        onchange="TypeSet(this.value)">
                                        <asp:ListItem Value="CL" Text="Customer"></asp:ListItem>
                                        <asp:ListItem Value="ND" Text="NSDL Clients"></asp:ListItem>
                                        <asp:ListItem Value="CD" Text="CDSL Clients"></asp:ListItem>
                                        <asp:ListItem Value="EM" Text="Employee"></asp:ListItem>
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
                                <td  class="gridcellleft">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                            TabIndex="14" ValidationGroup="a" />
                                 <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClientClick="Close()"
                            TabIndex="15" />
                                </td>
                                
                            </tr>
                            
                        </table>
                    </td>
                </tr>
                <tr id="TrUploadFile">
                    <td class="gridcellleft" valign="top">
                        <%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>--%>
                        <table style="background-color:#F2F5A9; border:solid 1px black;" cellpadding="1"
                            cellspacing="1" border="1">
                             <tr id="trSalutaion" runat="server">
                                <td>
                                    <asp:Label Text="#Salutation#" ID="Label19" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trClientName" runat="server">
                                <td>
                                    <asp:Label Text="#ClientName#" ID="Label18" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trFName" runat="server">
                                <td>
                                    <asp:Label Text="#FirstName#" ID="textTE" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trMName" runat="server">
                                <td>
                                    <asp:Label Text="#MiddleName#" ID="Label1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trLName" runat="server">
                                <td>
                                    <asp:Label Text="#LastName#" ID="Label2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trCode" runat="server">
                                <td>
                                    <asp:Label Text="#ClientID#" ID="Label3" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trAdd1" runat="server">
                                <td>
                                    <asp:Label Text="#Addres1#" ID="Label4" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trAdd2" runat="server">
                                <td>
                                    <asp:Label Text="#Addres2#" ID="Label5" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trAdd3" runat="server">
                                <td>
                                    <asp:Label Text="#Addres3#" ID="Label6" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trCity" runat="server">
                                <td>
                                    <asp:Label Text="#City#" ID="Label7" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trState" runat="server">
                                <td>
                                    <asp:Label Text="#State#" ID="Label8" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trCountry" runat="server">
                                <td>
                                    <asp:Label Text="#Country#" ID="Label9" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trPIN" runat="server">
                                <td>
                                    <asp:Label Text="#Pin#" ID="Label10" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trISD" runat="server">
                                <td>
                                    <asp:Label Text="#ISDCode#" ID="Label11" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trSTD" runat="server">
                                <td>
                                    <asp:Label Text="#STDCode#" ID="Label12" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trPhone" runat="server">
                                <td>
                                    <asp:Label Text="#TelephoneNumber#" ID="Label13" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trMob" runat="server">
                                <td>
                                    <asp:Label Text="#MobNumber#" ID="Label14" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trDOB" runat="server">
                                <td>
                                    <asp:Label Text="#DateOfBirth#" ID="Label15" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trPAN" runat="server">
                                <td>
                                    <asp:Label Text="#PANNumber#" ID="Label16" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trDate" runat="server">
                                <td>
                                    <asp:Label Text="#CurrentDate#" ID="Label17" runat="server"></asp:Label>
                                </td>
                            </tr>
                            
                        </table>
                        <%--         </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave"  EventName="Click"  />
                        </Triggers>
                    </asp:UpdatePanel>--%>
                    </td>
                    <td>
                        <div>
                            <asp:PlaceHolder ID="FreeTextBoxPlaceHolder" runat="server" />
                        </div>
                    </td>
                </tr>
               
            </table>
        </div>
    </form>
</body>
</html>
