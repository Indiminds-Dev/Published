<%@ page language="C#" autoeventwireup="true" inherits="management_DPChargeMain, App_Web_njtlujlb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    
   
    <%--<script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js" ></script>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    --%>
    
      
    

    <script language="javascript" type="text/javascript">

 
 function PopulateGrid(obj)
 {
   grid.PerformCallback(obj);
 }
   
  function OnMoreInfoClick(keyValue)
   {
      var str="DPChargeDetail.aspx?id="+keyValue;
      frmOpenNewWindow1(str,330,590);
       
    }
    
     
       function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no");       
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

  function OnAddButtonClick() 
    {  
      
      var bid; 
      var mbid=document.getElementById("hddnmainbid").value;
      var id=document.getElementById("hddnid").value;
   
      if(id==''&& mbid=='')
      {
       alert("First Add DPCharge Main Details");
      }
      else if(id!='' && mbid=='')
      {
        bid=id;
        var str = "DPChargeDetail.aspx?id=" + 'ADD'+'/'+ bid;
         frmOpenNewWindow1(str,330,590);
      }
      else if(id=='' && mbid!='')
      {
          bid=mbid;
          var str = "DPChargeDetail.aspx?id=" + 'ADD'+'/'+ bid;
          frmOpenNewWindow1(str,330,590);
      }
     
    }
        function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=yes,resizable=no,dependent=no");
    }


    function ISINPopClick() {




        var keyValue = document.getElementById("hdngroupid").value

      //  alert(keyValue);


        var url = 'ISINPopUp.aspx?id=' + keyValue;
      //  parent.ISINPopClick(url, "Members Details", '400px', '450px', "Y");

        frmOpenNewWindow1(url, 400, 900);

    }
    

//--></script>

</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER1">
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <table width="40%" style="background-color: #FFF3DF;">
                                        <tr>
                                            <asp:HiddenField ID="hddnmainbid" runat="server" />
                                            <asp:HiddenField ID="hddnid" runat="server" />
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl51" Width="100px" runat="server" Text="DP Charge Of:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="lbl52" runat="server" Width="270px" ForeColor="Brown" Font-Size="X-Small"></asp:Label></td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="lbl53" runat="server" Text="In:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <asp:Label Width="100px" ID="lbl54" runat="server" ForeColor="Brown" Font-Size="X-Small"></asp:Label></td>
                                            <td class="Ecoheadtxt" style="width: 222px;">
                                                <dxe:ASPxLabel ID="lbl4" runat="server" Text="Date:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" EditFormat="Custom"
                                                    Width="150px" ID="Dateedit">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl41" runat="server" Width="110px" Text="ServTax/GST Mode:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" ID="ddlservicetax" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Exclusive" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Inclusive" Value="2"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="TableMain100" style="border: solid 1px white">
                                        <tr>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl14" Width="120px" runat="server" Text="Acc Opening Chrg:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 5%;">
                                                <dxe:ASPxTextBox runat="server" ID="txtaccopeningcharge" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl18" Width="90px" runat="server" Text="Doc Charges:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" ID="txtdoccharges" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td id="Td2" class="Ecoheadtxt" runat="server">
                                                <dxe:ASPxLabel ID="lbl13" Width="100px" runat="server" Text="Book Issue Chrg:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" ID="txtibic" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lb22" runat="server" Width="110px" Text="IB App From:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddlappfrom" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="First" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Second" Value="2"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Third" Value="3"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Fourth" Value="4"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Fifth" Value="5"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl24" Width="120px" runat="server" Text="Security Dep Amt:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 5%;">
                                                <dxe:ASPxTextBox runat="server" ID="txtsecurityamt" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lb23" runat="server" Width="110px" Text="Deposit Type:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddldeposittype" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Refundable" Value="0"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Non-Refundable" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Adjustable with Bills" Value="3"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lb25" runat="server" Width="110px" Text="Billing Cycle:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddlbillingcycle" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="monthly" Value="0"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="bi-monthly" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="quarterly" Value="3"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl26" runat="server" Text="Min Bill Amt:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox runat="server" ID="txtminbillamt" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl27" runat="server" Text="Max Bill Amt:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox runat="server" ID="txtmaxbillamt" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl29" runat="server" Text="Delay Chrg Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox runat="server" ID="txtdelaychrate" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl5" runat="server" Text="Billing Day:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding-left: 5px">
                                                <dxe:ASPxSpinEdit ID="txtbillingday" runat="server" Width="50px" Number="5" NumberType="Integer"
                                                    MinValue="1" MaxValue="15">
                                                </dxe:ASPxSpinEdit>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl7" runat="server" Text="Payment Due Day:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding-left: 5px">
                                                <dxe:ASPxSpinEdit ID="txtpaymentday" runat="server" Width="50px" Number="7" NumberType="Integer"
                                                    MinValue="1" MaxValue="10">
                                                </dxe:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="Td1" class="Ecoheadtxt" runat="server">
                                                <dxe:ASPxLabel ID="lbl12" Width="120px" runat="server" Text="Annual Maint Chrg:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" ID="txtannualmintchrg" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl6" runat="server" Width="110px" Text="AMC Frequency:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddlfrequncy" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Monthly" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Quarterly" Value="2"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Semi-Annually" Value="3"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Annually" Value="4"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lbl9" runat="server" Width="110px" Text="AMC Calc. Basis:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddlcalbasis" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Full" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Pro-rata" Value="2"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lb21" runat="server" Width="110px" Text="AMC Basis:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddlchargebasis" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Active Date" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Fyn Year" Value="2"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lb211" runat="server" Width="110px" Text="AMC App From:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddlamcapp" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="First Period" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Second Period" Value="2"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Third Period" Value="3"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lb218" runat="server" Width="110px" Text="Trans.RndOff:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddltransrndoff" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Nearst Paisa" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Higher Paisa" Value="2"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Nearst 5 Paisa" Value="3"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Higher 5 Paisa" Value="4"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Truncate" Value="5"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lb219" runat="server" Width="110px" Text="NetRndOff:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                <dxe:ASPxComboBox runat="server" ID="ddlnetrndoff" Width="100px" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Nearst Rupee" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Higher Rupee" Value="2"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="None" Value="3"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="lblKraCharges" runat="server" Text="KRA Charges:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox runat="server" ID="txtKraCharges" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        
                                        
                                      <%--  ------------- For New Field Start ------------------------------------%>
                                      
                                      
                                      
                                         <tr>
                                            <td class="Ecoheadtxt">
                                                <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Width="150px" Text="Monthly Settlement Fee:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                               
                                                 <dxe:ASPxTextBox runat="server" ID="TxtMSFee" Width="100px" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999999g>.<00..99>" IncludeLiterals="DecimalSymbol" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                               
                                            </td>
                                            <td class="Ecoheadtxt">
                                                &nbsp
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 300px; padding: 3px">
                                                 &nbsp
                                            </td>
                                            <td class="Ecoheadtxt" colspan="4">
                                                &nbsp
                                                
                                                
                                                
                                                  <a  style="color: Red; margin-right:30px; " href="javascript:ISINPopClick();"  >ISINs Exempt From Billing</a>
                                                
                                            </td>
                                           
                                        </tr>
                                      
                                      
                                     <%-- --------------For New Field End -------------------------%>
                                        
                                        
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td style="text-align: right; padding: 2px 2px 2px 2px;" colspan="2">
                                                 <asp:LinkButton ID="btnSave" runat="server" Text="Save" Style="cursor: pointer; text-decoration: underline;"
                                                    OnClick="btnSave_Click"></asp:LinkButton>&nbsp;
                                                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" Style="cursor: pointer;
                                                    text-decoration: underline;" OnClick="btnCancel_Click"></asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                        <td>
                                        <asp:HiddenField id="cmpid" runat="server"/>
                                        <asp:HiddenField id="segid" runat="server"/>
                                        <asp:HiddenField id="type" runat="server"/>
                                        <asp:HiddenField id="customerid" runat="server"/>
                                         <asp:HiddenField id="hdngroupid" runat="server"/>
                                        </td>
                                        </tr>
                                    </table>
                                </td>
                        </table>
                        <table class="TableMain100">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="DPChargeDetailGrid" runat="server" KeyFieldName="DPChargeDetail_ID"
                                        AutoGenerateColumns="False" Width="100%" ClientInstanceName="grid" DataSourceID="DPChargeDetailDataSource"
                                        OnCustomCallback="DPChargeDetailGrid_CustomCallback">
                                        <columns>
                        <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_ID" Caption="ID" VisibleIndex="0"
                            Visible="False">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                         <dxwgv:GridViewDataTextColumn FieldName="DPCharge_Name" Caption="Charge Type" VisibleIndex="0" Width="30%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>               
                           <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_FixedAmount" Caption="Flat" VisibleIndex="1" Width="8%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>  
                              <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_FAPer" Caption="Per" VisibleIndex="2" Width="7%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn> 
                         <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_Rate" Caption="Rate" VisibleIndex="3" Width="8%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn> 
                         <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_RatePer" Caption="Per" VisibleIndex="4" Width="7%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn> 
                           <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_MinAmount" Caption="Min" VisibleIndex="5" Width="8%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn> 
                        <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_MinAmountPer" Caption="Per" VisibleIndex="6" Width="7%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn> 
                             <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_MaxAmount" Caption="Max " VisibleIndex="7" Width="8%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn> 
                           <dxwgv:GridViewDataTextColumn FieldName="DPChargeDetail_MaxAmountPer" Caption="Per" VisibleIndex="8" Width="7%">
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Right">
                            </EditFormCaptionStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="9" Width="5%">
                            <DataItemTemplate>
                                <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                    More Info...</a>
                            </DataItemTemplate>
                            <EditFormSettings Visible="False" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                   <HeaderStyle HorizontalAlign="Left" />
                        <HeaderTemplate>
                        
                         <%--  <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                             { %>--%>
                            <a href="javascript:void(0);" onclick="OnAddButtonClick( )">
                              <span style="color: #000099; text-decoration: underline">Add Detail</span>
                            </a>
                          <%--  <%} %>--%>
                        </HeaderTemplate>
                            
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewCommandColumn VisibleIndex="10" Caption="Delete">
                            <DeleteButton Visible="True">
                            </DeleteButton>
                        </dxwgv:GridViewCommandColumn>
                    </columns>
                                        <styles>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                    </styles>
                                        <settings showtitlepanel="True" showfooter="True" showstatusbar="Visible" showgroupbuttons="False"
                                            showverticalscrollbar="True" verticalscrollbarstyle="Virtual" />
                                        <templates>
                        <TitlePanel>

                        </TitlePanel>
                        <EditForm>
                        </EditForm>
                    </templates>
                                        <settingstext popupeditformcaption="Add/ Modify Employee" />
                                        <settingsediting mode="PopupEditForm" popupeditformhorizontalalign="Center" popupeditformmodal="True"
                                            popupeditformverticalalign="WindowCenter" popupeditformwidth="900px" editformcolumncount="3" />
                                        <settingsbehavior allowfocusedrow="True" confirmdelete="True" columnresizemode="NextColumn" />
                                        <settingspager showseparators="True" alwaysshowpager="True" numericbuttoncount="20"
                                            pagesize="20">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </settingspager>
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                            <asp:SqlDataSource ID="DPChargeDetailDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                DeleteCommand="DPChargeDetail_Delete" DeleteCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter Name="DPChargeDetail_ID" Type="String" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
