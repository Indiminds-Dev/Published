<%@ page language="C#" autoeventwireup="true" inherits="management_Working_Schedule_General, App_Web__yen2upk" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery.timeentry.js"></script>

    <script type="text/javascript">
        $(function () {
            var i=0;
            for(i=0;i<7;i++)
            {
                    ID1='#txtINtime'+i;
                    functionBind(ID1);
                    ID2='#txtOUTtime'+i;
                    functionBind(ID2);
            }
        //	    $('#ctl00_ContentPlaceHolder3_grdUserAttendace_ctl04_txtINtime').timeEntry();
        //	    $('#ctl00_ContentPlaceHolder3_grdUserAttendace_ctl04_txtOUTtime').timeEntry();
        	
        });
        function functionBind(obj)
        {
            $(obj).timeEntry();
        }
    </script>

    <script type="text/javascript" language="javascript">
    function PageLoad()
    {
        
        showHideField('1','chkSun_I');
        showHideField('2','chkMon_I');
        showHideField('3','chktues_I');
        showHideField('4','chkwed_I');
        showHideField('5','chkthur_I');
        showHideField('6','chkfri_I');
        showHideField('7','chksat_I');
    }
    function showHideField(obj1,obj2)
    {
       
        var checkBox=document.getElementById(obj2);
        //alert(obj1+'='+ checkBox.checked);
        var id = 'td'+obj1;
        //alert(id);
        if(checkBox.checked)
        {
            var id1 = id + 'a';
            show(id1);
            id1 = id + 'b';
            show(id1);
            id1 = id + 'c';
            show(id1);
            
        }
        else
        {
            var id1 = id + 'a';
            hide(id1);
            id1 = id + 'b';
            hide(id1);
            id1 = id + 'c';
            hide(id1);
        }
    }
    function show(obj1)
    {
         document.getElementById(obj1).style.display='inline';
    }
    function hide(obj1)
    {
         document.getElementById(obj1).style.display='none';
    }
    function validatefields()
    {
        if(document.getElementById("txtSheduleName").value == "")
        {
            alert("Please enter the schedule name.");
            document.getElementById("txtSheduleName").focus();
            return false;
        }
    }
     Fieldname='pnl';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <span style="color: Blue"><strong>Working Shedule</strong></span>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <table>
                            <tr>
                                <td style="text-align: left;">
                                    <span class="Ecoheadtxt" style="color: Blue"><strong>Name:</strong></span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSheduleName" runat="server" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSheduleName"
                                        Display="Dynamic" ErrorMessage="Name Required!" Font-Bold="True"></asp:RequiredFieldValidator></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <table cellpadding="0px" cellspacing="0px" style="border: solid 3px #EBDAAB">
                        <tr>
                            <td>
                                <table style="border: solid 1px #DCBE6A">
                                <tr>
                                    <td>
                                    </td>
                                    <td style="text-align: center;">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Is Wirking Day</strong></span>
                                    </td>
                                    <td style="text-align: center;">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Day Begin</strong></span></td>
                                    <td style="text-align: center;">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Day End</strong></span></td>
                                    <td style="text-align: center;">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Total Break</strong></span></td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Monday:</strong></span>
                                    </td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxCheckBox ID="chkMon" runat="server">
                                            <ClientSideEvents CheckedChanged="function(s, e) {
	showHideField('2','chkMon_I');}" />
                                        </dxe:ASPxCheckBox>
                                    </td>
                                    <td class="gridcellcenter" id="td2a">
                                        <asp:TextBox ID="txtINtime0" runat="server" Width="60px"></asp:TextBox>
                                    </td>
                                    <td class="gridcellcenter" id="td2b">
                                        <asp:TextBox ID="txtOUTtime0" runat="server" Width="60px" /></td>
                                    <td class="gridcellcenter" id="td2c">
                                        <asp:DropDownList ID="cmbl2" runat="server" Width="49px" Font-Size="10px">
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>40</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                            <asp:ListItem>50</asp:ListItem>
                                            <asp:ListItem>60</asp:ListItem>
                                            <asp:ListItem>70</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>80</asp:ListItem>
                                            <asp:ListItem>85</asp:ListItem>
                                            <asp:ListItem>90</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Tuesday:</strong></span>
                                    </td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxCheckBox ID="chktues" runat="server" Text="">
                                            <ClientSideEvents CheckedChanged="function(s, e) {
	showHideField('3','chktues_I');}" />
                                        </dxe:ASPxCheckBox>
                                    </td>
                                    <td class="gridcellcenter" id="td3a">
                                        <asp:TextBox ID="txtINtime1" runat="server" Width="60px"></asp:TextBox></td>
                                    <td class="gridcellcenter" id="td3b">
                                        <asp:TextBox ID="txtOUTtime1" runat="server" Width="60px" /></td>
                                    <td class="gridcellcenter" id="td3c">
                                        <asp:DropDownList ID="cmbl3" runat="server" Width="49px" Font-Size="10px">
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>40</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                            <asp:ListItem>50</asp:ListItem>
                                            <asp:ListItem>60</asp:ListItem>
                                            <asp:ListItem>70</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>80</asp:ListItem>
                                            <asp:ListItem>85</asp:ListItem>
                                            <asp:ListItem>90</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Wednesday:</strong></span>
                                    </td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxCheckBox ID="chkwed" runat="server" Text="">
                                            <ClientSideEvents CheckedChanged="function(s, e) {
	showHideField('4','chkwed_I');}" />
                                        </dxe:ASPxCheckBox>
                                    </td>
                                    <td class="gridcellcenter" id="td4a">
                                        <asp:TextBox ID="txtINtime2" runat="server" Width="60px"></asp:TextBox></td>
                                    <td class="gridcellcenter" id="td4b">
                                        <asp:TextBox ID="txtOUTtime2" runat="server" Width="60px" /></td>
                                    <td class="gridcellcenter" id="td4c">
                                        <asp:DropDownList ID="cmbl4" runat="server" Width="49px" Font-Size="10px">
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>40</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                            <asp:ListItem>50</asp:ListItem>
                                            <asp:ListItem>60</asp:ListItem>
                                            <asp:ListItem>70</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>80</asp:ListItem>
                                            <asp:ListItem>85</asp:ListItem>
                                            <asp:ListItem>90</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Thursday:</strong></span>
                                    </td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxCheckBox ID="chkthur" runat="server" Text="">
                                            <ClientSideEvents CheckedChanged="function(s, e) {
	showHideField('5','chkthur_I');}" />
                                        </dxe:ASPxCheckBox>
                                    </td>
                                    <td class="gridcellcenter" id="td5a">
                                        <asp:TextBox ID="txtINtime3" runat="server" Width="60px"></asp:TextBox></td>
                                    <td class="gridcellcenter" id="td5b">
                                        <asp:TextBox ID="txtOUTtime3" runat="server" Width="60px" /></td>
                                    <td class="gridcellcenter" id="td5c">
                                        <asp:DropDownList ID="cmbl5" runat="server" Width="49px" Font-Size="10px">
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>40</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                            <asp:ListItem>50</asp:ListItem>
                                            <asp:ListItem>60</asp:ListItem>
                                            <asp:ListItem>70</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>80</asp:ListItem>
                                            <asp:ListItem>85</asp:ListItem>
                                            <asp:ListItem>90</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Friday:</strong></span>
                                    </td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxCheckBox ID="chkfri" runat="server" Text="">
                                            <ClientSideEvents CheckedChanged="function(s, e) {
	showHideField('6','chkfri_I');}" />
                                        </dxe:ASPxCheckBox>
                                    </td>
                                    <td class="gridcellcenter" id="td6a">
                                        <asp:TextBox ID="txtINtime4" runat="server" Width="60px"></asp:TextBox></td>
                                    <td class="gridcellcenter" id="td6b">
                                        <asp:TextBox ID="txtOUTtime4" runat="server" Width="60px" /></td>
                                    <td class="gridcellcenter" id="td6c">
                                        <asp:DropDownList ID="cmbl6" runat="server" Width="49px" Font-Size="10px">
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>40</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                            <asp:ListItem>50</asp:ListItem>
                                            <asp:ListItem>60</asp:ListItem>
                                            <asp:ListItem>70</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>80</asp:ListItem>
                                            <asp:ListItem>85</asp:ListItem>
                                            <asp:ListItem>90</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Saturday:</strong></span>
                                    </td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxCheckBox ID="chksat" runat="server" Text="">
                                            <ClientSideEvents CheckedChanged="function(s, e) {
	showHideField('7','chksat_I');}" />
                                        </dxe:ASPxCheckBox>
                                    </td>
                                    <td class="gridcellcenter" id="td7a">
                                        <asp:TextBox ID="txtINtime5" runat="server" Width="60px"></asp:TextBox></td>
                                    <td class="gridcellcenter" id="td7b">
                                        <asp:TextBox ID="txtOUTtime5" runat="server" Width="60px" /></td>
                                    <td class="gridcellcenter" id="td7c">
                                        <asp:DropDownList ID="cmbl7" runat="server" Width="49px" Font-Size="10px">
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>40</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                            <asp:ListItem>50</asp:ListItem>
                                            <asp:ListItem>60</asp:ListItem>
                                            <asp:ListItem>70</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>80</asp:ListItem>
                                            <asp:ListItem>85</asp:ListItem>
                                            <asp:ListItem>90</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <span class="Ecoheadtxt" style="color: blue"><strong>Sunday:</strong></span>
                                    </td>
                                    <td class="gridcellleft">
                                        <dxe:ASPxCheckBox ID="chkSun" runat="server" Text="">
                                            <ClientSideEvents CheckedChanged="function(s, e) {
	showHideField('1','chkSun_I');}" />
                                        </dxe:ASPxCheckBox>
                                    </td>
                                    <td class="gridcellcenter" id="td1a">
                                        <asp:TextBox ID="txtINtime6" runat="server" Width="60px"></asp:TextBox></td>
                                    <td class="gridcellcenter" id="td1b">
                                        <asp:TextBox ID="txtOUTtime6" runat="server" Width="60px" /></td>
                                    <td class="gridcellcenter" id="td1c">
                                        <asp:DropDownList ID="cmbl1" runat="server" Width="49px" Font-Size="10px">
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>40</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                            <asp:ListItem>50</asp:ListItem>
                                            <asp:ListItem>60</asp:ListItem>
                                            <asp:ListItem>70</asp:ListItem>
                                            <asp:ListItem>75</asp:ListItem>
                                            <asp:ListItem>80</asp:ListItem>
                                            <asp:ListItem>85</asp:ListItem>
                                            <asp:ListItem>90</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="gridcellright">
                                        <dxe:ASPxButton ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click">
                                        </dxe:ASPxButton>
                                    </td>
                                </tr>
                            </table>
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
