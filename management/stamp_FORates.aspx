<%@ page language="C#" autoeventwireup="true" inherits="management_Stamp_FORates, App_Web_ptes6n28" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <!--___________________These files are for List Items__________________________-->

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
    <script language="javascript" type="text/javascript">
// <!CDATA[
//function is called on changing country
function textValidation()
   {
      
     
       var str = document.getElementById('txtGroup').value;
       var str1 = ddlcmpname.GetValue();
       var str2 = ddlsegment.GetValue()
     if(str=="")
          {
          alert("Please select group.");
          return false;
          }
      if(str1=="--Select Company--")
          {
          alert("Please select Company name.");
          return false;
          }
      if(str2==null)
          {
             alert("Please select Segment.");
             return false;
          }
      
   }
  function SignOff()
  {
   window.parent.SignOff();
  }

 function displayt()
{
   document.getElementById("trtrancharge").style.display = "none";

}
function displaynott()
{
   document.getElementById("trtrancharge").style.display = "none";
}

function displayaccount()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
   document.getElementById("trpro").style.display = "none";
}

function displaynotaccount()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
    document.getElementById("trpro").style.display = "none";
}

function noNumbers(e)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
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
           
           if(keynum>=48 && keynum<=57 || keynum==46)
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
  function displayfo()
  {
      document.getElementById("tab1").style.display = "inline";
      document.getElementById("tab11").style.display = "inline";
     document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
      document.getElementById("trdel").style.display = "none";
     document.getElementById("trsqoff").style.display = "none";
  } 
  
  function displaynotfo()
  {
      document.getElementById("tab1").style.display = "none";
      document.getElementById("tab11").style.display = "none";
     document.getElementById("tab2").style.display = "none";
     document.getElementById("tab3").style.display = "none";
     document.getElementById("tab4").style.display = "none";
     document.getElementById("trdel").style.display = "inline";
     document.getElementById("trsqoff").style.display = "inline";
  }

function display()
{
  document.getElementById("tdlevelsegment").style.display = "inline";
  document.getElementById("tdsegment").style.display = "inline";
}
function OnChargeChanged(ddlcharge)
{
   var text=ddlcharge.GetText().toString();
   if(text=="None")
   {
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trpro").style.display = "none";
   }
   else
   {
   document.getElementById("trtrancharge").style.display = "inline";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "inline";
   document.getElementById("trpro").style.display = "inline";
   }
}
function displaysubclient()
{
  document.getElementById("tdrsubacc").style.display = "inline";
}
function displaysubclientnot()
{
 document.getElementById("tdrsubacc").style.display = "none";
}

function ReceiveServerData(rValue)
    {   
   
        var DATA=rValue.split('~');  
            
        
          if(DATA[0]=="Segment")
        {
      
         if(DATA[1]!="N")
            { 
            
             document.getElementById("tdlevelsegment").style.display = "inline";
             document.getElementById("tdsegment").style.display = "inline";
            }
            
            else
            {
          
            document.getElementById("tdlevelsegment").style.display = "none";
            document.getElementById("tdsegment").style.display = "none";
            }
            
        }
    }
    function ALERT()
    {
      alert('This Date Already Exist for this combination.\n Date Should be Greater than Or Less Than From Previous Date');

    }
    
    function OnSegmentChanged(ddlsegment)
    {
       if(ddlsegment.match("-FO")||ddlsegment.match("-CD")||ddlsegment.match("-COMM"))
       {
             document.getElementById("trdel").style.display = "none";
             document.getElementById("trsqoff").style.display = "none";
             document.getElementById("tab1").style.display = "inline";
             document.getElementById("tab11").style.display = "inline";
             document.getElementById("tab2").style.display = "inline";
             document.getElementById("tab3").style.display = "inline";
             document.getElementById("tab4").style.display = "inline";         
         }
        else
        {
             document.getElementById("trdel").style.display = "inline";
             document.getElementById("trsqoff").style.display = "inline";
             document.getElementById("tab1").style.display = "none";
             document.getElementById("tab11").style.display = "none";
             document.getElementById("tab2").style.display = "none";
             document.getElementById("tab3").style.display = "none";
             document.getElementById("tab4").style.display = "none";
       }
       
    }
      function CallAjax(obj1,obj2,obj3)
    {
        FieldName='btnSave';
        ajax_showOptions(obj1,obj2,obj3);
    }
//-->
</script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" align="center" >
                                    <strong><span id="SpanHeader" style="color: #000099">Stamp Rates Detail</span></strong>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="1">
                            <tr>
                                <td>
                                    <table style="width: 99%; z-index: 101" border="1">
                                        <tr>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Group</td>
                                            <td style="text-align: left;">
                                                <asp:TextBox ID="txtGroup" runat="server" Font-Size="11px" Width="160px"></asp:TextBox><asp:TextBox
                                                    ID="txtGroup_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox></td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Company</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" Width="130px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceCompany" TextField="cmp_Name"
                                                    ValueField="cmp_internalid" ID="ddlcmpname">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left;" id="tdsegment" runat="server">
                                                <dxe:ASPxComboBox runat="server" Width="100px" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSegment"
                                                    TextField="segment_name" ValueField="exch_internalId" ClientInstanceName="ddlsegment"
                                                    ID="ddlsegment" DropDownButton-Text="Segment">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxDateEdit runat="server" DateOnError="Today" UseMaskBehavior="True" EditFormat="Custom"
                                                    EditFormatString="dd-MM-yyyy"
                                                    Width="130px"
                                                    ID="Dateedit" DropDownButton-Text="Date">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr id="trdel" runat="server" style="display: none">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Dlv.&nbsp;Buy</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtdelpurchase" runat="server" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                                <%--                                                    <asp:RegularExpressionValidator ID="RequiredFieldValidator1" ValidationExpression="^\d{1,2}$" ControlToValidate="txtdelpurchase" runat="server" ErrorMessage="Must Be Of Two Digits No."></asp:RegularExpressionValidator>--%>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Dlv.&nbsp;Buy (Debt)</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtdelpurchaseETF" runat="server" Width="100px" onkeypress="return noNumbers(event)">
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Dlv.&nbsp;Sell</td>
                                            <td style="text-align: left">
                                                <dxe:ASPxTextBox ID="txtdelsale" runat="server" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="vertical-align: top; background-color: #b7ceec; text-align: left">&nbsp;Dlv.&nbsp;Sell (Debt)</td>
                                            <td>
                                                <dxe:ASPxTextBox ID="txtdelsaleETF" runat="server" Width="100px" onkeypress="return noNumbers(event)">
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="trsqoff" runat="server" style="display: none">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Sqr-Off</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtsoff" runat="server" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Sqr-Off (Debt)</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxTextBox ID="txtsoffETF" runat="server" Width="100px" onkeypress="return noNumbers(event)">
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Charge &nbsp;For &nbsp;Auction</td>
                                            <td style="text-align: left">
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddlauction" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="No" Value="No"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Yes" Value="Yes"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <%--      for FO--%>
                                        <tr id="tab1" style="display: none" runat="server">
                                            <td colspan="2" style="text-align: center; vertical-align: top; background-color: cornflowerblue; color: white;">Rate For Future&nbsp;</td>
                                            <td colspan="2" style="text-align: center; vertical-align: top; background-color: cornflowerblue; color: white;">&nbsp;Rate For Option</td>
                                            <td colspan="2" style="vertical-align: top; background-color: cornflowerblue; text-align: center; color: white;">&nbsp;Rate For Finaly Settlemnt</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="tab11" style="display: none" runat="server">
                                            <td></td>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="vertical-align: top; background-color: cornflowerblue; text-align: left; color: white;">Stock</td>
                                                        <td style="vertical-align: top; background-color: cornflowerblue; text-align: left; color: white;">Other</td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="vertical-align: top; background-color: cornflowerblue; text-align: left; color: white;">Stock</td>
                                                        <td style="vertical-align: top; background-color: cornflowerblue; text-align: left; color: white;">Other</td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="vertical-align: top; background-color: cornflowerblue; text-align: left; color: white;">Stock</td>
                                                        <td style="vertical-align: top; background-color: cornflowerblue; text-align: left; color: white;">Other</td>
                                                    </tr>
                                                </table>
                                            </td>

                                        </tr>
                                        <tr id="tab2" style="display: none" runat="server">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Purchase</td>
                                            <td style="text-align: left;">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtfpurchase" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtfpurchase_othr" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Basis</td>
                                            <td style="text-align: left; padding: 3px;">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList runat="server" Width="100px" ID="ddlbasis">
                                                                <asp:ListItem Value="Premium">Premium</asp:ListItem>
                                                                <asp:ListItem Value="Strike">Strike</asp:ListItem>
                                                                <asp:ListItem Value="Premium And Strike">Premium+Strike</asp:ListItem>
                                                            </asp:DropDownList></td>

                                                        <td>
                                                            <asp:DropDownList runat="server" Width="100px" ID="ddlbasis_othr">
                                                                <asp:ListItem Value="Premium">Premium</asp:ListItem>
                                                                <asp:ListItem Value="Strike">Strike</asp:ListItem>
                                                                <asp:ListItem Value="Premium And Strike">Premium+Strike</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Basis</td>
                                            <td style="text-align: left; padding: 3px;">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList runat="server" Width="100px" ID="ddlfinalbasis">
                                                                <asp:ListItem Value="Strike">Strike</asp:ListItem>
                                                                <asp:ListItem Value="Spot">Spot</asp:ListItem>
                                                                <asp:ListItem Value="Difference">Difference</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>

                                                        <td>
                                                            <asp:DropDownList runat="server" Width="100px" ID="ddlfinalbasis_othr">
                                                                <asp:ListItem Value="Strike">Strike</asp:ListItem>
                                                                <asp:ListItem Value="Spot">Spot</asp:ListItem>
                                                                <asp:ListItem Value="Difference">Difference</asp:ListItem>
                                                            </asp:DropDownList>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="tab3" style="display: none" runat="server">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Sales</td>
                                            <td style="text-align: left;">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtfsale" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtfsale_othr" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Purchase</td>
                                            <td style="text-align: left;">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtopurchase" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtopurchase_othr" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Rate</td>
                                            <td style="text-align: left">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtfsrate" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtfsrate_othr" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="tab4" style="display: none" runat="server">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Expiry</td>
                                            <td style="text-align: left;">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtfexpiry" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtfexpiry_othr" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">&nbsp;Sales</td>
                                            <td style="text-align: left;">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtosale" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxTextBox runat="server" Width="100px" ID="txtosale_othr" onkeypress="return noNumbers(event)">
                                                                <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                                <ValidationSettings ErrorDisplayMode="None">
                                                                </ValidationSettings>
                                                            </dxe:ASPxTextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: left;"></td>
                                            <td style="text-align: left"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <%--   end FO--%>
                                        <tr>
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Chargeable To&nbsp;</td>
                                            <td style="text-align: left; padding: 3px;">
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddlcharge" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnChargeChanged(s); }"></ClientSideEvents>
                                                    <Items>
                                                        <dxe:ListEditItem Text="All" Value="All"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="None" Value="None"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Selected" Value="Selected"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="All But Selected" Value="All But Selected"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Not Applicable" Value="NA"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <%-- for account--%>
                                        <tr id="accfor" style="display: none">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Stamp Control Account</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="trtranclient" style="display: none">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Realised&nbsp;</td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" Width="170px" ID="ddlrmainacc">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountChanged(s); }"></ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left; display: none;" id="tdrsubacc" runat="server"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="trtrancharge" style="display: none">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">OnRealised
                                            </td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" Width="170px" ID="ddlunracc">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountUnChanged(s); }"></ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left; display: none;" runat="server" id="tdunsubacc"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr id="trpro" style="display: none">
                                            <td style="text-align: left; vertical-align: top; background-color: #b7ceec;">Pro
                                            </td>
                                            <td style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" Width="170px" ID="ddlproacc">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountProChanged(s); }"></ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="text-align: left; display: none;" runat="server" id="td1"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <%--end account--%>
                                        <tr>
                                            <td colspan="9" style="text-align:center">
                                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"
                                                    CssClass="btnUpdate" Width="130px" />
                                            </td>
                                        </tr>
                                    </table>
                                    <span style="width: 98%; text-align: center">
                                       
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company] where cmp_internalid in(select distinct exch_compid from tbl_master_companyExchange)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourcesegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select A.EXCH_INTERNALID AS exch_internalId ,isnull((TME.EXH_ShortName + '-' + A.EXCH_SEGMENTID),exch_membershipType) AS segment_name from (SELECT TMCE.* FROM TBL_MASTER_COMPANYEXCHANGE AS TMCE WHERE  TMCE.EXCH_COMPID=@CompId ) AS A LEFT OUTER JOIN   TBL_MASTER_EXCHANGE AS TME ON TME.EXH_CNTID=A.EXCH_EXCHID">
            <SelectParameters>
                <asp:SessionParameter Name="CompId" SessionField="LastCompany" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceaccount" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT MainAccount_Name,MainAccount_AccountCode FROM [Master_MainAccount]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceSubAcc" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT SubAccount_Name,SubAccount_ReferenceID FROM [Master_SubAccount] WHERE SubAccount_MainAcReferenceID
IN (SELECT MainAccount_AccountCode FROM [Master_MainAccount] WHERE (MainAccount_SubLedgerType='Custom')
and (MainAccount_AccountCode=@RfId))
 ">
            <SelectParameters>
                <asp:Parameter Name="RfId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
