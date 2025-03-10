<%@ page language="C#" autoeventwireup="true" inherits="management_frmAddDocuments, App_Web_yf04ozfw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body>
    <%--style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">--%>

    <script type="text/javascript">

    function OnCloseButtonClick(s, e)
    {
        var parentWindow = window.parent;
        parentWindow.popup.Hide();
                  
    }
    
    function Validation()
    {
        var FName = document.getElementById('TxtName');  
            if(FName.value=='')
            {
                alert('File Name Required!');
                return false;
                document.getElementById('TxtName').focus();
            }
        var Upload_Image = document.getElementById('FileUpload1'); 
        if(Upload_Image.value=='')
        {
            var fileNo = document.getElementById('TxtfileNo');  
            if(fileNo.value=='')
            {
                alert('File No Required!');
                return false;
            }
            else
            {
                var cellNo = document.getElementById('TxtCellNo');  
                if(cellNo.value=='')
                {
                    alert('Cell/Cabinet No Required!');
                    return false;
                }
                else
                {
                    var RoomNo = document.getElementById('TxtRoomNo');  
                    if(RoomNo.value=='')
                    {
                        alert('Room No Required!');
                        return false;
                    }
                    else    
                    {
                        var FloorNo = document.getElementById('TxtFloorNo');  
                        if(FloorNo.value=='')
                        {
                            alert('Floor No Required!');
                            return false;
                        }
                        else    
                        {
                            var Building = document.getElementById('Building'); 
                            if(Building.value=='Select')
                            {
                                alert('Building Required!');
                                return false;
                            }
                            else
                            {
                                return true;
                            }
                        }
                        
                    }
                    
                }
               
              }
        }              
    }
    function ShowFileUpload()
    {
    document.getElementById("txtFilepath").style.display="none";
 
    }

    </script>

    <form id="form1" runat="server">
        <div class="TableMain100">
            <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel154" runat="server">
                            <ContentTemplate>--%>
            <table class="TableMain100">
                <tr>
                    <td>
                        Document Type</td>
                    <td>
                        <asp:DropDownList ID="DTYpe" runat="server" Width="250px" TabIndex="1">
                        </asp:DropDownList>
                    </td>
                    <td>
                        File No.
                    </td>
                    <td>
                        <asp:TextBox ID="TxtfileNo" runat="server" Width="250px" TabIndex="2"> </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        File Name</td>
                    <td>
                        <asp:TextBox ID="TxtName" runat="server" Width="250px" TabIndex="3"></asp:TextBox></td>
                    <td>
                        Cell/Cabinet No.
                    </td>
                    <td>
                        <asp:TextBox ID="TxtCellNo" runat="server" Width="250px" TabIndex="4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Select File
                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="250px" TabIndex="5" />
                        <asp:TextBox ID="txtFilepath" runat="server" Visible="false" Width="250px" TabIndex="6"></asp:TextBox>
                        <asp:LinkButton ID="LinkButton1" Text="Change File" runat="server" OnClick="LinkButton1_Click"
                            TabIndex="7"></asp:LinkButton>
                    </td>
                    <td>
                        Room No.
                    </td>
                    <td>
                        <asp:TextBox ID="TxtRoomNo" runat="server" Width="250px" TabIndex="8"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Building</td>
                    <td>
                        <asp:DropDownList ID="Building" runat="server" Width="250px" TabIndex="9">
                        </asp:DropDownList>
                    </td>
                    <td>
                        Floor No.
                    </td>
                    <td>
                        <asp:TextBox ID="TxtFloorNo" runat="server" Width="250px" TabIndex="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Received Date:
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="dtReceived" ClientInstanceName="dtReceived" runat="server"
                            EditFormat="Custom" UseMaskBehavior="True" Width="250px" TabIndex="11">
                            <dropdownbutton>
                            </dropdownbutton>
                        </dxe:ASPxDateEdit>
                    </td>
                    <td>
                        Renewal Date:
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="dtRenew" ClientInstanceName="dtRenew" runat="server" EditFormat="Custom"
                            UseMaskBehavior="True" Width="250px" TabIndex="12">
                            <dropdownbutton>
                            </dropdownbutton>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
            </table>
            <table class="TableMain100">
                <tr>
                    <td style="width:80px">
                        Note 1 :
                    </td>
                    <td style="width:400px; text-align:center; ">
                        <asp:TextBox ID="txt_note1" runat="server" TextMode="MultiLine" MaxLength="200" Width="300px"
                            Height="50px"></asp:TextBox>
                    </td>
                    <td style="width:20px;"></td>
                    <td style="width:80px">
                        Note 2 :
                    </td>
                    <td style="width:400px ">
                        <asp:TextBox ID="txt_note2" runat="server" TextMode="MultiLine" MaxLength="200" Width="300px"
                            Height="50px"></asp:TextBox>
                    </td>
                </tr>
                </table>
                <table>
                <tr style="height: 40px;">
                    <td colspan="4">
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <hr style="color: Black; height: 1px;" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; font-size: x-small; color: Red; width: 220px;" id="td_address"
                        runat="server">
                        * Address Proof is Mandatory Field
                    </td>
                    <td colspan="3">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; font-size: x-small; color: Red; width: 220px;" id="td_id"
                        runat="server">
                        * ID Proof is Mandatory Field
                    </td>
                    <td colspan="3" style="text-align: right;">
                        <asp:Button ID="Button1" runat="server" Text="Save" TabIndex="13" OnClick="Button1_Click"
                            CssClass="btnUpdate" Width="70px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" TabIndex="14" CssClass="btnUpdate"
                            Width="70px" /><asp:HiddenField ID="IsFileUpload" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
        <asp:SqlDataSource ID="SlectBuilding" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select bui_Name,bui_id from tbl_master_building"></asp:SqlDataSource>
    </form>
</body>
</html>
