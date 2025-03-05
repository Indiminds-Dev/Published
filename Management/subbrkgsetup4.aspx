<%@ page language="C#" autoeventwireup="true" inherits="management_subbrkgsetup4, App_Web_wqpzjxym" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
    <title></title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
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
     function Page_Load(obj)///Call Into Page Load
     {
     
        if(obj=='1')////////NSE-CM
        {
            Show('TD_MKTSEGMENTTXT');
            Show('TD_MKTSEGMENTCMB');
            ddlminper.SetEnabled(false);
            ddlmaxper.SetEnabled(false);
            ddlflatper.SetEnabled(false);
        }
        else if (obj=='2')////NSE-FO
        {
            Hide('TD_MKTSEGMENTTXT');
            Hide('TD_MKTSEGMENTCMB');
            ddlminper.SetEnabled(true);
            ddlmaxper.SetEnabled(true);
            ddlflatper.SetEnabled(true);
        }
     
     }
         function Hide(obj)
          {
             document.getElementById(obj).style.display='none';
          }
        function Show(obj)
         {
           document.getElementById(obj).style.display='inline';
         }
        function OnBrokerageForChange(ddlbrokeragefor)
        {
           var text=ddlbrokeragefor.GetText().toString();
           if(text=="Specific Instrument"||text=="Specific Underlying Asset")
           {
                Show('td_prdid');
                Show('td_prdidtxt');
           }
           else
           {
                Hide('td_prdid');
                Hide('td_prdidtxt');
          }

        }
      function OnApplicableForChange(ddlapplfor)
        {
          
           var text=ddlapplfor.GetText().toString();
           if(text=="Specific Client"||text=="Specific Group")
           {
                 Show('td_appentity');
                 Show('td_appentitytxt');
           }
           else
           {
                Hide('td_appentity');
                Hide('td_appentitytxt');
          }

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
      function fn_flatamnt()
      {
          var obj=document.getElementById('txtflatamt_I').value;
          var exchsegment="<%=Session["ExchangeSegmentID"]%>";
            if(obj!='0.000000')
            {
                    document.getElementById("txtrate_I").disabled=true;
                    document.getElementById("txtminamt_I").disabled=true;
                    document.getElementById("txtmaxamt_I").disabled=true;
                    txtrate.SetValue('0.000000');
                    txtminamt.SetValue('0.000000');
                    txtmaxamt.SetValue('0.000000');
                    ddlminper.SetEnabled(false);
                    ddlmaxper.SetEnabled(false);
            }
            else
            {
                    document.getElementById("txtrate_I").disabled=false;
                    document.getElementById("txtminamt_I").disabled=false;
                    document.getElementById("txtmaxamt_I").disabled=false;
                    
                    if(exchsegment=='2')
                    {
                       ddlminper.SetEnabled(true);
                       ddlmaxper.SetEnabled(true);
                    }
                   
            }
      } 
      
   function CallAjax(obj1,obj2,obj3)
    {
       var seg_brokg;
       var exchsegment="<%=Session["ExchangeSegmentID"]%>";
       if(exchsegment=='1')
       {
         seg_brokg='NSE-CMALL'+'-'+'2';
       }
       else if(exchsegment=='2')
       {
            seg_brokg='NSE-FO'+'-'+ddlbrokeragefor.GetValue();
       }
       else if(exchsegment=='4')
       {
            seg_brokg='NSE-CMALL'+'-'+'2';
       }
       else
       {
            seg_brokg='MCX-COMM'+'-'+'2';
       }
       ajax_showOptions(obj1,obj2,obj3,seg_brokg);
    }
    function CallAjaxAppEntity(obj1,obj2,obj3)
    {
       var subbrkg=document.getElementById('lblclientid').innerText+'-'+ddlapplfor.GetValue();
       ajax_showOptions(obj1,obj2,obj3,subbrkg);
    }
 FieldName='txtproductid';
</script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="TableMainB">
                <tr>
                    <td colspan="8" class="Ecoheadtxt" style="text-align: center;">
                        Brokerage Detail Of:<asp:Label ID="lblClientName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr valign="top">
                    <td style="text-align: left; color: Blue;display:none;" id="TD_MKTSEGMENTTXT" >
                        Market Segment :</td>
                    <td style="text-align: left; color: Blue;display:none;" id="TD_MKTSEGMENTCMB">
                        <dxe:ASPxComboBox runat="server" ID="ddlmarketseg" width="125px" DropDownStyle="DropDown"
                            EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <items>
                                                  <dxe:ListEditItem Text="All" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Rolling" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="T2T" Value="3">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Physical" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Institutional" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Auction" Value="6">
                                                  </dxe:ListEditItem>
                                                 
                                                </items>
                        </dxe:ASPxComboBox></td>
                    <td style="text-align: left; color: Blue;">
                        Instrument Type :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlinstrumenttype" DropDownStyle="DropDown"
                            EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <items>
                                              
                                                  <dxe:ListEditItem Text="All" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Equity" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Bonds" Value="3">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Debt" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="ETFs" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Equity Futures" Value="6">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Equity Options" Value="7">
                                                  </dxe:ListEditItem>
                                                   <dxe:ListEditItem Text="Index Futures" Value="8">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Index Options" Value="9">
                                                  </dxe:ListEditItem>
                                                   <dxe:ListEditItem Text="All Futures" Value="10">
                                                  </dxe:ListEditItem>
                                                   <dxe:ListEditItem Text="All Options" Value="11">
                                                  </dxe:ListEditItem>
                                                </items>
                        </dxe:ASPxComboBox></td>
                    
                </tr>
                <tr valign="top"><td style="text-align: left; color: Blue;">
                        Brokerage For :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" Width="180px" ID="ddlbrokeragefor" ClientInstanceName="ddlbrokeragefor"
                            DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <clientsideevents selectedindexchanged="function(s, e) { OnBrokerageForChange(s); }"></clientsideevents>
                            <items>
                                                  <dxe:ListEditItem Text="All" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Specific Instrument" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Specific Underlying Asset" Value="3">
                                                  </dxe:ListEditItem>
                                                 
                                                </items>
                        </dxe:ASPxComboBox></td>
                    <td style="display: none; text-align: left; color: Blue;" id="td_prdid" runat="server">
                        Product Id:</td>
                    <td id="td_prdidtxt" style="display: none; text-align: left; color: Blue;" runat="server">
                        <asp:TextBox runat="server" Width="140px" Font-Size="10px" ID="txtproductid"></asp:TextBox>
                        <asp:TextBox ID="txtproductid_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox></td></tr>
                            <tr valign="top"><td style="text-align: left; color: Blue;">
                        Applicable For :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlapplfor" ClientInstanceName="ddlapplfor"
                            DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <clientsideevents selectedindexchanged="function(s, e) { OnApplicableForChange(s); }"></clientsideevents>
                            <items>
                                                  <dxe:ListEditItem Text="All Clients" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Specific Client" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Specific Group" Value="3">
                                                  </dxe:ListEditItem>
                                                 
                                                </items>
                        </dxe:ASPxComboBox></td>
                    <td style="text-align: left; color: Blue; display: none;" id="td_appentity" runat="server">
                        App. Entity :</td>
                    <td id="td_appentitytxt" style="display: none; text-align: left; color: Blue;" runat="server">
                        <asp:TextBox runat="server" Width="160px" Font-Size="10px" ID="txtappentity"></asp:TextBox>
                        <asp:TextBox ID="txtappentity_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox></td></tr>
                <tr valign="top">
                    <td style="text-align: left; color: Blue;">
                        Brokerage Type :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" ID="ddlbrokeragetype" width="125px" DropDownStyle="DropDown"
                            EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <items>
                                                  <dxe:ListEditItem Text="Delivery" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Square-Off" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Exercise" Value="3">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Assignment" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Final Settlement" Value="5">
                                                  </dxe:ListEditItem>
                                                  
                                                 
                                                </items>
                        </dxe:ASPxComboBox></td>
                    <td style="text-align: left; color: Blue;">
                        Transaction Type :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" Width="125px" ID="ddltransttype" DropDownStyle="DropDown"
                            EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <items>
                                              
                                                  <dxe:ListEditItem Text="Purchase" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Sale" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Both" Value="3">
                                                  </dxe:ListEditItem>
                                                     <dxe:ListEditItem Text="Carry" Value="4">
                                                  </dxe:ListEditItem>
                                                </items>
                        </dxe:ASPxComboBox></td>
                    
                </tr>
                <tr valign="top">
                    <td style="text-align: left; color: Blue;">
                        Calculate On :
                    </td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" ID="ddlcalculateon" width="125px" DropDownStyle="DropDown"
                            EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <items>
                                                  <dxe:ListEditItem Text="Market Price" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Market+Strike" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Strike" Value="3">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Trade Value" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Spot" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Difference" Value="6">
                                                  </dxe:ListEditItem>
                                                </items>
                        </dxe:ASPxComboBox>
                    </td>
                    <td style="text-align: left; color: Blue;">
                        Flat Rate :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxTextBox runat="server" ID="txtflatamt" onkeypress="return noNumbers(event)" onfocusout="fn_flatamnt();">
                          <masksettings mask="<0..99g>.<00..999999>" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                        </dxe:ASPxTextBox></td>
                    <td style="text-align: left; color: Blue;">
                        Flat Per :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlflatper" ClientInstanceName="ddlflatper"
                            DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <clientsideevents></clientsideevents>
                            <items>
                                                  <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Lot" Value="2">
                                                  </dxe:ListEditItem>
                                                    
                                                 
                                                </items>
                        </dxe:ASPxComboBox></td>
                    <td colspan="2" style="display: none;">
                        <asp:Label ID="lblclientid"  runat="server"></asp:Label></td>
                </tr>
                <tr valign="top">
                    <td style="text-align: left; color: Blue;">
                        Rate :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxTextBox runat="server" width="125px" ClientInstanceName="txtrate" ID="txtrate" onkeypress="return noNumbers(event)">
                           <masksettings mask="<0..99g>.<00..999999>" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                        </dxe:ASPxTextBox></td>
                    <td style="text-align: left; color: Blue;">
                        Min :
                    </td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxTextBox runat="server" id="txtminamt" onkeypress="return noNumbers(event)"
                            Width="125px">
                            <masksettings mask="<0..99g>.<00..999999>" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                        </dxe:ASPxTextBox></td>
                    <td style="text-align: left; color: Blue;">
                        Min Per :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlminper" ClientInstanceName="ddlminper"
                            DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <clientsideevents></clientsideevents>
                            <items>
                                                  <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Lot" Value="2">
                                                  </dxe:ListEditItem>
                                                    
                                                 
                                                </items>
                        </dxe:ASPxComboBox></td>
                    <td colspan="2" style="display: none;">
                        &nbsp;</td>
                </tr>
                <tr valign="top">
                    <td style="text-align: left; color: Blue;">
                        Max :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxTextBox runat="server" id="txtmaxamt" onkeypress="return noNumbers(event)"
                            Width="125px">
                             <masksettings mask="<0..99g>.<00..999999>" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                        </dxe:ASPxTextBox></td>
                    <td style="text-align: left; color: Blue;">
                        Max Per :</td>
                    <td style="text-align: left; color: Blue;">
                        <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlmaxper" ClientInstanceName="ddlmaxper"
                            DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                            <clientsideevents></clientsideevents>
                            <items>
                                                  <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Lot" Value="2">
                                                  </dxe:ListEditItem>
                                                    
                                                 
                                                </items>
                        </dxe:ASPxComboBox></td>
                    <td colspan="4" style="display: none;">
                        &nbsp;</td>
                </tr>
                <tr><td style="text-align: left;" colspan="8"><asp:Button runat="server" ID="btnSave" Width="44px" CssClass="btnUpdate" Text="Save" Height="23px"  style="CURSOR: pointer" OnClick="btnSave_Click"></asp:Button>
 <asp:Button runat="server" ID="btnCancel" CssClass="btnUpdate" Text="Cancel" Height="23px" OnClick="btnCancel_Click" ></asp:Button></td></tr>
            </table>
        </div>
    </form>
</body>
</html>