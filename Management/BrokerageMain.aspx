<%@ page language="C#" autoeventwireup="true" inherits="management_BrokerageMain, App_Web_rtil2eyr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>

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
    
    <%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" >
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />
    

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>
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
  function SignOff()
    {
        window.parent.SignOff();
    }
 
 function PopulateGrid(obj)
 {
   grid.PerformCallback(obj);
 }
   
   //New Work 14/03/2022
   function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    
    function callback()
    {
        grid.PerformCallback();
    }
   //End of New Work 14/03/2022
    function CallBrokerageDetail(keyValue)
    {
    //alert (keyValue);
       var mbid1=document.getElementById("ASPxPageControl1_hddnid").value;
       //alert (mbid1);
    if (mbid1=='Y')
    {
    alert("First Add Brokerage Main Details");
    }
    else    
    {
   
      var URL="BrokerageDetail.aspx?id="+keyValue;
      editwin=dhtmlmodal.open("Editbox", "iframe", URL, "BrokerageDetail", "width=800px,height=400px,center=1,resize=1,top=0", "recal");                 
      }
      editwin.onclose=function()
             {
                 grid.PerformCallback();
             }
    }
    
function DateCompare(DateobjFrm,DateobjTo)
{
 var new1 ='<%=Session["fordate"]%>';
    var Msg="To Date Can Not Be Less Than From Date!!!";
    DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
}
     function OnAddButtonClick() 
    {  
      var segname=document.getElementById("ASPxPageControl1_hdnsegment").value;
      var bid; 
      var mbid=document.getElementById("ASPxPageControl1_hddnmainbid").value;
//    alert (mbid);
      var id=document.getElementById("ASPxPageControl1_hddnbid").value;
//      alert (id);
//      if(id==''&& mbid=='')
//alert (id);
        if(id==''|| id=='0')
      {
       alert("First Add Brokerage Main Details");
      }
      else if(id!='' && mbid=='')
      {
        bid=id;
        var str = "BrokerageDetail.aspx?id=" + 'ADD'+'/'+ bid+'/'+segname;
         frmOpenNewWindow1(str,280,780);
      }
      else if(id=='' && mbid!='')
      {
          bid=mbid;
          var str = "BrokerageDetail.aspx?id=" + 'ADD'+'/'+ bid +'/'+segname;
          frmOpenNewWindow1(str,280,780);
      }
      else if(id!='' && mbid!='')
      {
          bid=id;
          var str = "BrokerageDetail.aspx?id=" + 'ADD'+'/'+ bid +'/'+segname;
          frmOpenNewWindow1(str,280,780);
      }
     
    }
    function CompareDateToControl(obj_DateControl)
    {
        DevE_CompareDateToControl(obj_DateControl,'<%=Session["fordate"]%>',"Date should be greater than or equal to Today");
    }
    function frmOpenNewWindow1(location,v_height,v_weight)
    {
        var y=(screen.availHeight-v_height)/2;
        var x=(screen.availWidth-v_weight)/2;
        editwin=dhtmlmodal.open("Editbox", "iframe", location, "BrokerageDetail", "width=800px,height=400px,center=1,resize=1,top=0", "recal"); 
        
         editwin.onclose=function()
             {
                 grid.PerformCallback();
             }
    }
   function OnTradeChanged(s)
   {
  
       var text=ASPxPageControl1_ddltradeavgtype.GetText().toString();
       if(text=="None")
           {
            //document.getElementById("ASPxPageControl1_ddlmktroundoff").disabled=true;
                   ddlmktroundoff.SetEnabled(false);
  
           }  
           else
           {
//            document.getElementById("ASPxPageControl1_ddlmktroundoff").disabled=false;
                    ddlmktroundoff.SetEnabled(true);
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

function disp_prompt(name)
    {
   
           if ( name == "tab0")
        {
        
          document.location.href="BrokerageMain.aspx"; 
          
        }
        else if ( name == "tab1")
        {
        
         if(document.getElementById('ASPxPageControl1_testhdd').value=='0')
         {
          var mid=document.getElementById('ASPxPageControl1_hddnbid').value;
          document.location.href="BrokerageCharges.aspx?id="+'ADD'+'/'+ mid; 
          
          }
      
          else
          {
          
            var g=document.getElementById('ASPxPageControl1_testhddup').value;
            document.location.href="BrokerageCharges.aspx?id="+g; 
           
          }
        }
    }

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" >
        <div>
            <table class="TableMain100" >
                <tr>
                    <td >
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                            Width="100%">
                            <TabPages>
<dxtc:TabPage Name="General" Text="General"><ContentCollection>
<dxw:ContentControl runat="server"><TABLE class="TableMain100"><TBODY><TR><TD style="HEIGHT: 32px">
<TABLE style="WIDTH: 100%" border=1><TBODY><TR><asp:HiddenField runat="server" ID="testhdd"></asp:HiddenField>
<asp:HiddenField runat="server" ID="testhddup"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hddnmainbid"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hddnbid"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hdnsegment"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hddnid"></asp:HiddenField>
<TD style="VERTICAL-ALIGN: top; WIDTH: 150px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Brkg Set up of</TD><TD style="WIDTH: 30%; HEIGHT: 12px"><asp:Label runat="server" Font-Size="X-Small" ForeColor="Brown" Width="100%" ID="lbl52"></asp:Label>
 </TD><TD style="VERTICAL-ALIGN: top; WIDTH: 87px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;In</TD><TD style="WIDTH: 30%; HEIGHT: 12px"><asp:Label runat="server" Font-Size="X-Small" ForeColor="Brown" Width="100%" ID="lbl54"></asp:Label>
 </TD><TD style="VERTICAL-ALIGN: top; WIDTH: 87px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Date</TD><TD style="WIDTH: 20%; HEIGHT: 12px"><dxe:ASPxDateEdit runat="server" DateOnError="Today" UseMaskBehavior="True" EditFormat="Custom" Width="150px" ClientInstanceName="cDateedit" ID="Dateedit">
<ClientSideEvents DateChanged="function(s,e){CompareDateToControl(cDateedit);}"></ClientSideEvents>

<ButtonStyle Width="13px"></ButtonStyle>
</dxe:ASPxDateEdit>
 </TD></TR></TBODY></TABLE></TD></TR><TR><TD><TABLE border=1><TBODY><TR>
 <TD style="VERTICAL-ALIGN: top; WIDTH: 87px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Brkg Decimals</TD>
 <TD><dxe:ASPxSpinEdit runat="server" MaxValue="6" NumberType="Integer" Number="2" Width="50px" ID="txtbrkgdecimals"></dxe:ASPxSpinEdit>
 </TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Net Amt Decimal&nbsp;</TD><TD><dxe:ASPxSpinEdit runat="server" MaxValue="6" NumberType="Integer" Number="2" Width="50px" ID="txtnetamtdeci"></dxe:ASPxSpinEdit>
 </TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Mkt Rate Decimal&nbsp;</TD><TD><dxe:ASPxSpinEdit runat="server" NumberType="Integer" Width="100px" ID="txtmktratedeci"></dxe:ASPxSpinEdit>
 </TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Trd Avg. Type&nbsp;</TD><TD><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="100px" ID="ddltradeavgtype">
<ClientSideEvents SelectedIndexChanged="function(s, e) {OnTradeChanged(s); }"></ClientSideEvents>
<Items>
<dxe:ListEditItem Text="None" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Order Number" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Instrument" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="Similar Price" Value="4"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>
 </TD>
 <%--New Work 14/03/2022--%>
 <TD style="VERTICAL-ALIGN: top; WIDTH: 87px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Brkg. Rd-Off</TD>
 <TD><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="100px" ID="ddlbrhkroundoff"><Items>
<dxe:ListEditItem Text="Nearest" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="Truncate" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="Nearest 5 Paisa" Value="5"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower 5 Paisa" Value="6"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher 5 Paisa" Value="7"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>
 </TD>
 <TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Mkt. Rd-Off&nbsp;</TD>
 <TD><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="100px" ClientInstanceName="ddlmktroundoff" ID="ddlmktroundoff"><Items>
<dxe:ListEditItem Text="Nearest" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="Truncate" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="Nearest 5 Paisa" Value="5"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower 5 Paisa" Value="6"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher 5 Paisa" Value="7"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>
 </TD>
 <%--End of New Work 14/03/2022--%>
 </TR><TR>
 <%--New Work 14/03/2022--%>
 <%--<TD style="VERTICAL-ALIGN: top; WIDTH: 87px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Brkg. Rd-Off</TD>--%>
 <%--<TD><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="100px" ID="ddlbrhkroundoff"><Items>
<dxe:ListEditItem Text="Nearest" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="Truncate" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="Nearest 5 Paisa" Value="5"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower 5 Paisa" Value="6"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher 5 Paisa" Value="7"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>
 </TD>--%>
 <%--<TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Mkt. Rd-Off&nbsp;</TD>
 <TD><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="100px" ClientInstanceName="ddlmktroundoff" ID="ddlmktroundoff"><Items>
<dxe:ListEditItem Text="Nearest" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="Truncate" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="Nearest 5 Paisa" Value="5"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower 5 Paisa" Value="6"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher 5 Paisa" Value="7"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>
 </TD>--%>
 <%--End of New Work 14/03/2022--%>
 <TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Net Rd-Off&nbsp;</TD><TD><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="100%" ID="ddlnetamtroundoff"><Items>
<dxe:ListEditItem Text="None" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Nearest Rupee" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Higher Rupee" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="Lower Rupee" Value="4"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>
 </TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Cont. Pattern&nbsp;</TD><TD><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="100px" ID="ddlcontractpatt"><Items>
<dxe:ListEditItem Text="Single" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Sharewise" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Orderwise" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="BuySellwise" Value="6"></dxe:ListEditItem>
<dxe:ListEditItem Text="Order+Sharewise" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="None" Value="5"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>
 </TD>
 <%--New Work 14/03/2022--%>
 <TD style="VERTICAL-ALIGN: top; WIDTH: 87px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Min Daily Brkg&nbsp;</TD>
 <TD><dxe:ASPxTextBox runat="server" Width="100px" HorizontalAlign="Right" ID="txtmindailybrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD>
 <TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Max Daily Brkg&nbsp;</TD>
 <TD><dxe:ASPxTextBox runat="server" Width="100px" HorizontalAlign="Right" ID="txtmaxdailybrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD>
 <TD runat="server" ID="tdmin" style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Min Del Brkg/Shr&nbsp;</TD>
<TD runat="server" ID="tdtxtmin"><dxe:ASPxTextBox runat="server" Width="100%" HorizontalAlign="Right" ID="txtmindelbrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..9999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD>
<TD runat="server" ID="tdmax" style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Max Del Brkg/Shr&nbsp;</TD>
<TD runat="server" ID="tdtxtmax"><dxe:ASPxTextBox runat="server" Width="100px" HorizontalAlign="Right" ID="txtmaxdelbrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..9999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD>
</TR><TR>
 <%--End of New Work 14/03/2022--%>
 </TR><TR>
 <%--End of New Work 14/03/2022--%>
 <%--<TD style="VERTICAL-ALIGN: top; WIDTH: 87px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Min Daily Brkg&nbsp;</TD>
 <TD><dxe:ASPxTextBox runat="server" Width="100px" HorizontalAlign="Right" ID="txtmindailybrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD>
 <TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Max Daily Brkg&nbsp;</TD>
 <TD><dxe:ASPxTextBox runat="server" Width="100px" HorizontalAlign="Right" ID="txtmaxdailybrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD>
 <TD runat="server" ID="tdmin" style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Min Del Brkg/Shr&nbsp;</TD>
<TD runat="server" ID="tdtxtmin"><dxe:ASPxTextBox runat="server" Width="100%" HorizontalAlign="Right" ID="txtmindelbrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..9999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD>
<TD runat="server" ID="tdmax" style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Max Del Brkg/Shr&nbsp;</TD>
<TD runat="server" ID="tdtxtmax"><dxe:ASPxTextBox runat="server" Width="100px" HorizontalAlign="Right" ID="txtmaxdelbrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..9999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD>
</TR><TR>--%>
<%--End of New Work 14/03/2022--%>
<TD style="VERTICAL-ALIGN: top; WIDTH: 87px; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Min Sqr Brkg/Shr&nbsp;</TD><TD style="WIDTH: 125px"><dxe:ASPxTextBox runat="server" Width="100px" HorizontalAlign="Right" ID="txtminsqrbrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..9999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Max Sqr brkg/Shr</TD><TD><dxe:ASPxTextBox runat="server" Width="123px" HorizontalAlign="Right" ID="txtmaxsqrbrkg" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..9999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Min Brkg/Order&nbsp;</TD><TD>
 <dxe:ASPxTextBox runat="server" Width="100%" HorizontalAlign="Right" ID="txtminbrkgorder" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">&nbsp;Max Brkg/Order&nbsp;</TD><TD><dxe:ASPxTextBox runat="server" Width="100px" HorizontalAlign="Right" ID="txtmaxbrkgorder" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD></TR><TR><TD style="WIDTH: 107px" colSpan=3>Minimum&nbsp;Processing&nbsp;Charge(Per Setl.Num/Type)</TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">Perday </TD>
 <TD>
<%-- <asp:TextBox runat="server" ID="txtPerDay"></asp:TextBox>--%>
<dxe:ASPxTextBox runat="server" Width="100%" HorizontalAlign="Right" ID="txtPerDay" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD><TD style="VERTICAL-ALIGN: top; HEIGHT: 11px; BACKGROUND-COLOR: #b7ceec; TEXT-ALIGN: left">Per Share </TD><TD>
<%-- <asp:TextBox runat="server" ID="txtPerShare"></asp:TextBox>--%>
<dxe:ASPxTextBox runat="server" Width="100%" HorizontalAlign="Right" ID="txtPerShare" onkeypress="return noNumbers(event)">
<MaskSettings Mask="&lt;0..999999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol"></MaskSettings>

<ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
</dxe:ASPxTextBox>
 </TD><TD><asp:Button runat="server" OnClientClick="return aa();" Text="Save" CssClass="btnUpdate" Height="23px" Width="44px" ID="btnSave" style="CURSOR: pointer" OnClick="btnSave_Click"></asp:Button>
 <asp:Button runat="server" Text="Cancel" CssClass="btnUpdate" Height="23px" ID="btnCancel" OnClick="btnCancel_Click"></asp:Button>
 </TD></TR><TR>
 <TD style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px">
 <STRONG><SPAN style="FONT-SIZE: 13px; COLOR: #000099">Brokerage Detail</SPAN></STRONG> </TD>
 <%--New Work 14/03/2022--%>
 <TD style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px">
 <td id="ShowFilter">
    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
        Show Filter</span></a>
</td>
<td id="Td1">
    <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
        All Records</span></a>
</td>
</TD>
 <%--End of New Work 14/03/2022--%>
 <TD style="DISPLAY: none" colSpan=7><asp:HiddenField runat="server" ID="cmpid"></asp:HiddenField>
 <asp:HiddenField runat="server" ID="segid"></asp:HiddenField>
 <asp:HiddenField runat="server" ID="type"></asp:HiddenField>
 <asp:HiddenField runat="server" ID="customerid"></asp:HiddenField>
 </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
 <TABLE class="TableMain100"><TBODY><TR><TD>
 <dxwgv:ASPxGridView runat="server" ClientInstanceName="grid" KeyFieldName="BrokerageDetail_ID" AutoGenerateColumns="False" DataSourceID="BrokerageDetailDataSource" Width="100%" 
  ID="BrokerageDetailGrid" OnCustomCallback="BrokerageDetailGrid_CustomCallback"> 
  <Columns>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_ID" Caption="ID" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_MktSegment" Width="10%" Caption="MktSegment" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_BrkgType" Width="12%" Caption="Brokerage Type" VisibleIndex="1">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_BrkgFor" Width="12%" Caption="Brokerage For" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_TranType" Width="10%" Caption="Transaction Type" VisibleIndex="3">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_InstrType" Width="8%" Caption="Instrument Type" VisibleIndex="4">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_FlatRate" Width="7%" Caption="Flat Amt" VisibleIndex="5">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_Rate" Width="7%" Caption="Rate" VisibleIndex="6">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_MinAmount" Width="7%" Caption="Min Amt" VisibleIndex="7">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_SlabCode" Width="8%" Caption="Brkg Slab" VisibleIndex="8">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<%--New Work 14/03/2022--%>
<dxwgv:GridViewDataTextColumn FieldName="BrokerageDetail_Exchange" Width="8%" Caption="Exchange" VisibleIndex="9">
<EditFormSettings Visible="False"></EditFormSettings>
<EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>
<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<%--End of New Work 14/03/2022--%>
<dxwgv:GridViewDataTextColumn Width="10%" Caption="Details" VisibleIndex="10">
<EditFormSettings Visible="False"></EditFormSettings>
<DataItemTemplate>
                                                                        <a href="javascript:void(0);" onclick="CallBrokerageDetail('<%# Container.KeyValue %>')">
                                                                            More Info...</a>
                                                                    
</DataItemTemplate>

<HeaderStyle HorizontalAlign="Left"></HeaderStyle>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                                                                        <a href="javascript:void(0);" id="abcd"  onclick="OnAddButtonClick( )"><span style="color: #000099;
                                                                            text-decoration: underline">Add Detail</span> </a>
                                                                    
</HeaderTemplate>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn Caption="Delete" VisibleIndex="11">
<DeleteButton Visible="True"></DeleteButton>
</dxwgv:GridViewCommandColumn>
</Columns>

<SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" ConfirmDelete="True"></SettingsBehavior>

<%--New Work 14/03/2022--%>
<%--<SettingsPager PageSize="20" AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">--%>
<SettingsPager PageSize="50" AlwaysShowPager="True" NumericButtonCount="50" ShowSeparators="True">
<%--End of New Work 14/03/2022--%>
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>

<SettingsEditing Mode="PopupEditForm" PopupEditFormWidth="900px" PopupEditFormHorizontalAlign="Center" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormModal="True" EditFormColumnCount="3"></SettingsEditing>

<%--New Work 14/03/2022--%>
<%--<Settings ShowGroupButtons="False" ShowVerticalScrollBar="True" VerticalScrollableHeight="100" VerticalScrollBarStyle="Virtual" ShowStatusBar="Visible"></Settings>--%>
<Settings ShowGroupButtons="False" ShowVerticalScrollBar="True" VerticalScrollableHeight="280" VerticalScrollBarStyle="Virtual" ShowStatusBar="Visible"></Settings>
<%--End of New Work 14/03/2022--%>

<SettingsText PopupEditFormCaption="Add/ Modify Employee"></SettingsText>

<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>

<Templates><TitlePanel>
                                                                
</TitlePanel>
<EditForm>
                                                                
</EditForm>
</Templates>
</dxwgv:ASPxGridView>
 </TD></TR><asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" DeleteCommand="BrokerageDetail_Delete" DeleteCommandType="StoredProcedure" ID="BrokerageDetailDataSource"><DeleteParameters>
<asp:Parameter Name="BrokerageDetail_ID" Type="String"></asp:Parameter>
</DeleteParameters>
</asp:SqlDataSource>
</TBODY></TABLE></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Charges" Text="Charges"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                             if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                             else  if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            }"></ClientSideEvents>
                            <ContentStyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                            </ContentStyle>
                            <LoadingPanelStyle ImageSpacing="6px">
                            </LoadingPanelStyle>
                        </dxtc:ASPxPageControl>
           
         </td>
         </tr>
         </table>
        </div>
        <%-- BeginRegion DataSources --%>
        <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourcesegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT MCE.exch_internalId, (ME.exh_shortName+'_'+ MCE.exch_segmentId)as segment_name FROM [tbl_master_exchange]ME
         left outer join [tbl_master_companyExchange]as MCE on MCE.exch_exchId=ME.exh_cntId WHERE ( MCE.exch_compId=@CompId) ">
            <SelectParameters>
                <asp:Parameter Name="CompId" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>

        <%-- End of Region --%>
    </form>
</body>
</html>
