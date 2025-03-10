<%@ page language="C#" autoeventwireup="true" inherits="management_frmAddEditIFS_TradingEntities, App_Web_nidspgif" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
    <%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    
    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
	<style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}    
    </style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script type="text/javascript">
    
    function PageLoad()
    {
        FieldName='btnSave';
    }
    
    function OnCloseButtonClick(s, e)
    {
        var parentWindow = window.parent;
        parentWindow.popup.Hide();
    }
    
    function CallAjaxForTrader(obj,obj1,obj2)
        {
//            var sourcesegmentid=document.getElementById('txtSegment_hidden');
//            ajax_showOptions(obj,obj1,obj2);
            var cmbSrcSegment=document.getElementById('cmbSrcSeg');
            var obj3=cmbSrcSegment.value;
            ajax_showOptions(obj,obj1,obj2,obj3);
        } 
    function show(obj1)
    {
         document.getElementById(obj1).style.display='inline';
    }
    function hide(obj1)
    {
         document.getElementById(obj1).style.display='none';
    }
    
    function Validation()
    {
//        var FName = document.getElementById('TxtName');  
//            if(FName.value=='')
//            {
//                alert('File Name Required!');
//                return false;
//                document.getElementById('TxtName').focus();
//            }
//        var Upload_Image = document.getElementById('FileUpload1'); 
//        if(Upload_Image.value=='')
//        {
//            var fileNo = document.getElementById('TxtfileNo');  
//            if(fileNo.value=='')
//            {
//                alert('File No Required!');
//                return false;
//            }
//            else
//            {
//                var cellNo = document.getElementById('TxtCellNo');  
//                if(cellNo.value=='')
//                {
//                    alert('Cell/Cabinet No Required!');
//                    return false;
//                }
//                else
//                {
//                    var RoomNo = document.getElementById('TxtRoomNo');  
//                    if(RoomNo.value=='')
//                    {
//                        alert('Room No Required!');
//                        return false;
//                    }
//                    else    
//                    {
//                        var FloorNo = document.getElementById('TxtFloorNo');  
//                        if(FloorNo.value=='')
//                        {
//                            alert('Floor No Required!');
//                            return false;
//                        }
//                        else    
//                        {
//                            var Building = document.getElementById('Building'); 
//                            if(Building.value=='Select')
//                            {
//                                alert('Building Required!');
//                                return false;
//                            }
//                            else
//                            {
//                                return true;
//                            }
//                        }
//                        
//                    }
//                    
//                }
//               
//              }
//        }              
    }
//    function ShowFileUpload()
//    {
//    document.getElementById("txtFilepath").style.display="none";
// 
//    }

    </script>

    <form id="form1" runat="server" autocomplete="off">
        <div>
            <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel154" runat="server">
                            <ContentTemplate>--%>
            <table class="TableMain100">
                <tr>
                    <td>
                        Source Company :</td>
                    <td>
                        <asp:DropDownList ID="cmbCompSeg" runat="server" Width="250px" AutoPostBack="true" DataTextField="Name" DataValueField="cmp_internalid" AppendDataBoundItems="true" 
                         OnSelectedIndexChanged="cmbCompSeg_SelectedIndexChanged" TabIndex="1">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Source Segment :</td>
                    <td>
                        <asp:DropDownList ID="cmbSrcSeg" runat="server" Width="250px" AutoPostBack="true" DataTextField="Name" DataValueField="exch_internalId" AppendDataBoundItems="true" 
                         OnSelectedIndexChanged="cmbSrcSeg_SelectedIndexChanged" TabIndex="2">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Trader Account :</td>
                    <td>
                        <asp:TextBox ID="txtTrader" runat="server" TabIndex="3" width="250px">
                        </asp:TextBox>
                    </td>
                    <td class="gridcellleft"  style="display:none" ><asp:TextBox ID="txtTrader_hidden" runat="server" Width="100px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date From :
                    </td>
                    <td>
                        <dxe:ASPxDateEdit ID="txtDateFrom" runat="server" ClientInstanceName="DtDateFrom" EditFormat="Custom"
                            EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="250px" Font-Size="10px" TabIndex="4">
                            <ButtonStyle Width="13px">
                            </ButtonStyle>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Date To :</td>
                    <td>
                        <dxe:ASPxDateEdit ID="txtDateTo" runat="server" ClientInstanceName="DtDateTo" EditFormat="Custom"
                            EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="250px" Font-Size="10px" TabIndex="5">
                            <ButtonStyle Width="13px">
                            </ButtonStyle>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td colspan="3" style="text-align: right;">
                        <asp:Button ID="Button1" runat="server" Text="Save" TabIndex="6" OnClick="Button1_Click"
                            CssClass="btnUpdate" Width="70px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" TabIndex="7" CssClass="btnUpdate"
                            Width="70px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
