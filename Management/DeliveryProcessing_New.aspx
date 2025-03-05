<%@ page language="C#" autoeventwireup="true" inherits="management_DeliveryProcessing_New, App_Web_yq8u0p-o" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Delivery Processing</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
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
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	

    #dhtmltooltip{
    position: absolute;
    left: -300px;
    width: 150px;
    border: 1px solid black;
    padding: 2px;
    background-color: lightyellow;
    visibility: hidden;
    z-index: 100;
    /*Remove below line to remove shadow. Below line should always appear last within this CSS*/
    filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135);
    }

    #dhtmlpointer{
    position:absolute;
    left: -300px;
    z-index: 101;
    visibility: hidden;
    }




	</style>
 <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
                 Hide('tab_grid');
                 Show('tab2');
                 Hide('showFilter');
                 Hide('td_filter');
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
            
      function FunCallAjaxList(objID,objEvent)
        {
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
               
            if(document.getElementById('cmbsearchOption').value=="Branch")
            {
               strQuery_Table = "tbl_master_branch";
               strQuery_FieldName = "top 10 branch_description+'-'+branch_code,branch_id";
               strQuery_WhereClause = " (branch_description Like (\'%RequestLetter%') or branch_code like (\'%RequestLetter%')) and branch_id in (<%=Session["userbranchHierarchy"]%>)";
            }
            else if(document.getElementById('cmbsearchOption').value=="Group")
            {
               strQuery_Table = "tbl_master_groupmaster";
               strQuery_FieldName = "top 10 gpm_description+'-'+gpm_code ,gpm_id";
               strQuery_WhereClause = " (gpm_description Like (\'%RequestLetter%') or gpm_code like (\'%RequestLetter%')) and gpm_type='"+document.getElementById('ddlgrouptype').value+"'";
            }
            else if(document.getElementById('cmbsearchOption').value=="ScripsExchange")
            {
            
               strQuery_Table = "Master_Equity";
               strQuery_FieldName = "distinct top 10 isnull(Equity_TickerSymbol,'')+'['+isnull(rtrim(Equity_Series),Equity_Tickercode)+']' as TickerSymbol,Equity_SeriesID";
               strQuery_WhereClause = " (Equity_TickerSymbol like  (\'%RequestLetter%') or Equity_Series like (\'%RequestLetter%') or Equity_Tickercode like (\'%RequestLetter%')) and Equity_ExchSegmentID='<%=Session["ExchangeSegmentID"]%>'";
               //alert (strQuery_WhereClause);
            }
            else
            {
               strQuery_Table = "tbl_master_contact,tbl_master_contactexchange,tbl_master_branch";
               strQuery_FieldName = "distinct top 10  isnull(rtrim(cnt_firstName),'')+' '+isnull(rtrim(cnt_middlename),'')+' '+isnull(rtrim(cnt_lastName),'')+' ['+isnull(rtrim(crg_tcode),'')+'] ['+isnull(rtrim( BRANCH_DESCRIPTION),'')+']' ,cnt_internalID";
               strQuery_WhereClause = "  branch_id=cnt_branchid and crg_cntid=cnt_internalid  and cnt_internalid like 'CL%' and (crg_tcode Like (\'%RequestLetter%') or CNT_FIRSTNAME like (\'%RequestLetter%')) and cnt_branchid in (<%=Session["userbranchHierarchy"]%>)";
            }
            CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
            ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
            
        }

       function replaceChars(entry) 
       {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        } 
    
    
        
        function fnClients(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Clients';
                  Show('showFilter');
             }
            height();
        }
        function fnScrips(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='ScripsExchange';
                  Show('showFilter');
             }
            height();
        }
      function fnBranch(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Branch';
                  Show('showFilter');
             }
          height();
      }
     function fnGroup(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('showFilter');
             }
             height();
      }
       function btnAddsubscriptionlist_click()
            {
            
                var cmb=document.getElementById('cmbsearchOption');
                        var userid = document.getElementById('txtSelectionID');
                        if(userid.value != '')
                        {
                            var ids = document.getElementById('txtSelectionID_hidden');
                            var listBox = document.getElementById('lstSlection');
                            var tLength = listBox.length;
                           
                            
                            var no = new Option();
                            no.value = ids.value;
                            no.text = userid.value;
                            listBox[tLength]=no;
                            var recipient = document.getElementById('txtSelectionID');
                            recipient.value='';
                        }
                        else
                            alert('Please search name and then Add!')
                        var s=document.getElementById('txtSelectionID');
                        s.focus();
                        s.select();
                   
            }
        
      function clientselectionfinal()
	        {
	            var listBoxSubs = document.getElementById('lstSlection');
	          
                var cmb=document.getElementById('cmbsearchOption');
                var listIDs='';
                var i;
                if(listBoxSubs.length > 0)
                {  
                           
                    for(i=0;i<listBoxSubs.length;i++)
                    {
                        if(listIDs == '')
                            listIDs = listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                        else
                            listIDs += ',' + listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                    }
                    var sendData = cmb.value + '~' + listIDs;
                    CallServer(sendData,"");
                   
                }
	            var i;
                for(i=listBoxSubs.options.length-1;i>=0;i--)
                {
                    listBoxSubs.remove(i);
                }
            
                Hide('showFilter');
                document.getElementById('btnshow').disabled=false;
	        }
	     
	        
	   function btnRemovefromsubscriptionlist_click()
            {
                
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
                
                var arrTbox = new Array();
                var arrLookup = new Array();
                var i;
                var j = 0;
                for (i = 0; i < listBox.options.length; i++) 
                {
                    if (listBox.options[i].selected && listBox.options[i].value != "") 
                    {
                        
                    }
                    else 
                    {
                        arrLookup[listBox.options[i].text] = listBox.options[i].value;
                        arrTbox[j] = listBox.options[i].text;
                        j++;
                    }
                }
                listBox.length = 0;
                for (i = 0; i < j; i++) 
                {
                    var no = new Option();
                    no.value = arrLookup[arrTbox[i]];
                    no.text = arrTbox[i];
                    listBox[i]=no;
                }
            }
    
   
   function  fnddlGroup(obj)
   {
        if(obj=="0")
        {
            Hide('td_group');
            Show('td_branch');
        }
        else
        {
            Show('td_group');
            Hide('td_branch');
            var btn = document.getElementById('btnhide');
            btn.click();
        }
         height();
   }
   function fngrouptype(obj)
   {
       if(obj=="0")
       {
       Hide('td_allselect');
        alert('Please Select Group Type !');
       }
       else
       {
       Show('td_allselect');
       }
       height();
   }

    function ChangeRowColor(rowID,rowNumber) 
        { 
            var gridview = document.getElementById('grdHoldBackRelease'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==28)
                 rowCount=25;
            else    
               rowCount=rCount-2;
            if(rowNumber>25 && rCount<28)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac';            
          
          
         
        }         
   function fnRecord(obj)
   {
        if(obj=='5')
        {
            Hide('tab_grid');
            Show('td_filter');
            Show('displayAll');
            Hide('tab2');
        }
        else if(obj=='3')
        {
            Show('tab_grid');
            Show('td_filter');
            Hide('displayAll');
            Hide('tab2');
        }
        else
        {
            Hide('tab_grid');
            Hide('td_filter');
            Hide('displayAll');
            Show('tab2');
            if(obj!='2')
             alert(obj);
        }
        Hide('showFilter');
        height();
   }
  
    function onmousovertooltip(Profile_Name,TotalDlvValue,ReleaseValue,System1baln,System1UnClearbaln,effectivetradingbaln,System2baln,System2UnClearbaln,effectivemargindepbaln,System3baln,System3UnClearbaln,effectivefdrbaln,MrgnCalValueWithOutHair,MrgnCalValue,effectivemarginbaln,PendingPurchaseWithOutHair,PendingPurchase,effectivpurchasebaln,PendingSalesWithOutHair,PendingSales,effectivsalesbaln,totbaln,totunclear,toteffective,AppMarginCalProfile,AppMarginCal,effectivappmarginbaln,NetWorth,PettyRate,PettyAmt)
    {
    
         var stringhtml=null;
         stringhtml='<table width=\"100%\" border=" + Convert.ToChar(34) + 1 + Convert.ToChar(34) + " cellpadding=" + 0 + " cellspacing=" + 0 + "><tr><td ><b>Profile Name:&nbsp;</b></td><td style=\"color:Green;\" colspan=3> &nbsp;'+Profile_Name+'</td></tr>';
         stringhtml+='<tr><td style=\"color:Red;\" colspan=4 > Deliver if Net Debit is less than: <b style=\"color:Black;\">'+PettyRate+'</b><b style=\"color:Black;\">%</b> Of Deliverable Value OR rs: &nbsp;<b style=\"color:Black;\">'+PettyAmt+'</b> which ever is Minimum</td></tr>';
         stringhtml+='<tr><td colspan=2 > Total Holding Value: &nbsp;&nbsp; <b>'+TotalDlvValue+'</b></td><td colspan=2>&nbsp; Value Of Deliverable: &nbsp;&nbsp;&nbsp;<b>'+ReleaseValue+'</b></td></tr>';
         stringhtml+='<tr style=\"background-color:lavender ;text-align:center\"><td align=\"center\">Account Head</td><td align=\"center\">Balance/Value</td><td align=\"center\">UnCleared/Haircut/Markup</td><td align=\"center\">Effective Balance</td></tr>';
         stringhtml+='<tr><td >Trading A/c [+DP Debit]:</td><td align=\"right\">'+System1baln+'</td><td align=\"right\">'+System1UnClearbaln+'</td><td align=\"right\">'+effectivetradingbaln+'</td></tr>';
         stringhtml+='<tr><td>Margin Deposit A/c :</td><td align=\"right\">'+System2baln+'</td><td align=\"right\">'+System2UnClearbaln+'</td><td align=\"right\">'+effectivemargindepbaln+'</td></tr>';
         stringhtml+='<tr><td>FDR A/c Balance :</td><td align=\"right\">'+System3baln+'</td><td align=\"right\">'+System3UnClearbaln+'</td><td align=\"right\">'+effectivefdrbaln+'</td></tr>';
         stringhtml+='<tr><td>Margin/Hldbk Stocks :</td><td align=\"right\">'+MrgnCalValueWithOutHair+'</td><td align=\"right\">'+MrgnCalValue+'</td><td align=\"right\">'+effectivemarginbaln+'</td></tr>';
         stringhtml+='<tr><td>Pending Purchase :</td><td align=\"right\">'+PendingPurchaseWithOutHair+'</td><td align=\"right\">'+PendingPurchase+'</td><td align=\"right\">'+effectivpurchasebaln+'</td></tr>';
         stringhtml+='<tr><td>Pending Sales :</td><td align=\"right\">'+PendingSalesWithOutHair+'</td><td align=\"right\">'+PendingSales+'</td><td align=\"right\">'+effectivsalesbaln+'</td></tr>';
         stringhtml+='<tr><td>Total :</td><td align=\"right\">'+totbaln+'</td><td align=\"right\">'+totunclear+'</td><td align=\"right\">'+toteffective+'</td></tr>';
         stringhtml+='<tr><td>(Less) Applicable Margin :</td><td align=\"right\">'+AppMarginCal+'</td><td align=\"right\">'+AppMarginCalProfile+'</td><td align=\"right\">'+effectivappmarginbaln+'</td></tr>';
         stringhtml+='<tr><td colspan=3><u><b>Client Networth :</b></u></td><td align=\"right\">'+NetWorth+'</td></tr>';
         stringhtml+='</table>';
         ddrivetip(stringhtml,500);
        
    }
    function fn_callajax(objID,objCreteria,objListFun,objEvent,ObjType)
    {
        
         objCreteria=ObjType+'~'+objCreteria;
         ajax_showOptions(objID,objListFun,objEvent,objCreteria);
    }
   function isNumberKey(e)      
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
      function fn_Releaseqty(textid,qty,txtvalue,releaseqty)
      {
        if(parseInt(txtvalue)>parseInt(qty))
        {
           alert('You Can Deliver Maximum '+qty+' Share');
           textid.value=releaseqty;
           textid.focus();
           textid.select();
        }
        
      }
       
  
     FieldName='lstSlection';
     </script>
    
  <script type="text/javascript">

/***********************************************
* Cool DHTML tooltip script II- © Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

var offsetfromcursorX=12 //12 Customize x offset of tooltip
var offsetfromcursorY=10 //10 Customize y offset of tooltip

var offsetdivfrompointerX=10 //Customize x offset of tooltip DIV relative to pointer image
var offsetdivfrompointerY=14 //Customize y offset of tooltip DIV relative to pointer image. Tip: Set it to (height_of_pointer_image-1).

document.write('<div id="dhtmltooltip"></div>') //write out tooltip DIV
document.write('<img id="dhtmlpointer" src="../images/arrow2.gif">') //write out pointer image

var ie=document.all
var ns6=document.getElementById && !document.all
var enabletip=false
if (ie||ns6)
var tipobj=document.all? document.all["dhtmltooltip"] : document.getElementById? document.getElementById("dhtmltooltip") : ""

var pointerobj=document.all? document.all["dhtmlpointer"] : document.getElementById? document.getElementById("dhtmlpointer") : ""

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function ddrivetip(thetext, thewidth, thecolor){
if (ns6||ie){
if (typeof thewidth!="undefined") tipobj.style.width=thewidth+"px"
if (typeof thecolor!="undefined" && thecolor!="") tipobj.style.backgroundColor=thecolor
tipobj.innerHTML=thetext
enabletip=true
return false
}
}

function positiontip(e){
if (enabletip){
var nondefaultpos=false
var curX=(ns6)?e.pageX : event.clientX+ietruebody().scrollLeft;
var curY=(ns6)?e.pageY : event.clientY+ietruebody().scrollTop;
//Find out how close the mouse is to the corner of the window
var winwidth=ie&&!window.opera? ietruebody().clientWidth : window.innerWidth-20
var winheight=ie&&!window.opera? ietruebody().clientHeight : window.innerHeight-20

var rightedge=ie&&!window.opera? winwidth-event.clientX-offsetfromcursorX : winwidth-e.clientX-offsetfromcursorX
var bottomedge=ie&&!window.opera? winheight-event.clientY-offsetfromcursorY : winheight-e.clientY-offsetfromcursorY

var leftedge=(offsetfromcursorX<0)? offsetfromcursorX*(-1) : -1000

//if the horizontal distance isn't enough to accomodate the width of the context menu
if (rightedge<tipobj.offsetWidth){
//move the horizontal position of the menu to the left by it's width
tipobj.style.left=curX-tipobj.offsetWidth+"px"
nondefaultpos=true
}
else if (curX<leftedge)
tipobj.style.left="5px"
else{
//position the horizontal position of the menu where the mouse is positioned
tipobj.style.left=curX+offsetfromcursorX-offsetdivfrompointerX+"px"
pointerobj.style.left=curX+offsetfromcursorX+"px"
}

//same concept with the vertical position
if (bottomedge<tipobj.offsetHeight){
tipobj.style.top=curY-tipobj.offsetHeight-offsetfromcursorY+"px"
nondefaultpos=true
}
else{
tipobj.style.top=curY+offsetfromcursorY+offsetdivfrompointerY+"px"
pointerobj.style.top=curY+offsetfromcursorY+"px"
}
tipobj.style.visibility="visible"
if (!nondefaultpos)
pointerobj.style.visibility="visible"
else
pointerobj.style.visibility="hidden"
}
}

function hideddrivetip(){
//if (ns6||ie){
enabletip=false
tipobj.style.visibility="hidden"
pointerobj.style.visibility="hidden"
tipobj.style.left="-1000px"
tipobj.style.backgroundColor=''
tipobj.style.width=''
//}
}

document.onmousemove=positiontip

</script>
 
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
               
                var j=rValue.split('~');
                if(j[0]=='Branch')
                    document.getElementById('HiddenField_Branch').value = j[1];
                if(j[0]=='Group')
                    document.getElementById('HiddenField_Group').value = j[1];
                if(j[0]=='Clients')
                    document.getElementById('HiddenField_Client').value = j[1];
                if(j[0]=='ScripsExchange')
                    document.getElementById('HiddenField_Scrip').value = j[1];
              
        }
        </script>
   <script type="text/javascript">
 function SelectAllCheckboxes(chk) 
  {
    $('#<%=grdHoldBackRelease.ClientID %>').find("input:checkbox").each(function() 
    {
        if (this != chk) {
            this.checked = chk.checked;
        }
    });
  }
</script> 
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">

    <form id="form1" runat="server" autocomplete="off">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
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
    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Margin/Holdback Release</span></strong></td>

              <td class="EHEADER" width="15%" id="td_filter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="fnRecord('2');"><span style="color: Blue; text-decoration: underline;
                        font-size: 8pt; font-weight: bold">Filter</span></a>
                
                </td>
            </tr>
        </table>
    
       <table id="tab2" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td>
                    <table>
                        
                         <tr>
                            <td class="gridcellleft">
                                <table  border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Release From :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlReleaseAc" Font-Size="10px" runat="server" 
                                                Width="250px">
                                            </asp:DropDownList>
                                        </td>
                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table  border="10" cellpadding="1" cellspacing="1">
                                    <tr valign="top">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Transfer Date :</td>
                                        <td id="td_dtto" class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="DtTransferDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="DtTransferDate">
                                                <dropdownbutton text="For">
                                    </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Group By</td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroup" runat="server" Width="80px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                <asp:ListItem Value="0">Branch</asp:ListItem>
                                                <asp:ListItem Value="1">Group</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td colspan="2" id="td_branch">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="a" onclick="fnBranch('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="a" onclick="fnBranch('b')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="td_group" style="display: none;" colspan="2">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="ddlgrouptype" runat="server" Font-Size="10px" onchange="fngrouptype(this.value)">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td id="td_allselect" style="display: none;">
                                                        <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b"
                                                            onclick="Group('a')" />
                                                        All
                                                        <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="fnGroup('b')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Clients :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="c" onclick="fnClients('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="radPOAClient" runat="server" GroupName="c" onclick="fnClients('a')" />POA
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="fnClients('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                            Scrip :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripAll" runat="server" Checked="True" GroupName="e" onclick="fnScrips('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripSelected" runat="server" GroupName="e" onclick="fnScrips('b')" />Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                    Width="101px" OnClick="btnshow_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table id="showFilter">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                            id="TdFilter">
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunCallAjaxList(this,event)"></asp:TextBox>
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Branch</asp:ListItem>
                                                <asp:ListItem>Group</asp:ListItem>
                                                <asp:ListItem>ScripsExchange</asp:ListItem>
                                            </asp:DropDownList>
                                            <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                    style="color: #009900; font-size: 8pt;"> </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="90px" Width="290px">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                            text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                            <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:Button ID="btnhide" runat="server" Text="btnhide" OnClick="btnhide_Click" />
                   
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_Scrip" runat="server" />
                     <asp:HiddenField ID="HiddenField_RowId" runat="server" />
                </td>
                <td>
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
      <div id="displayAll" style="display: none;" width="100%">
            <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                <ContentTemplate>
                    <table width="50%" border="1">
                       
                        <tr>
                            <td>
                                <div id="Div_Activity" runat="server">
                                </div>
                            </td>
                        </tr>
                        <br />
                       
                        <tr>
                            <td>
                                <div id="Div_bill" runat="server">
                                </div>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <table id="tab_grid">
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                        <ContentTemplate>
                            <div id="divdisplay" runat="server">
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
       <tr style="height:30px;"><td></td></tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/green.bmp" />
                            </td>
                            <td class="gridcellleft">
                                POA Client
                            </td>
                            <td>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/blue.bmp" />
                            </td>
                            <td class="gridcellleft">
                                Own DP Client
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
             <tr style="height:30px;"><td></td></tr> 
            <tr >
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnProcessing1" runat="server" Text="Generate Transfers" CssClass="btnUpdate"
                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnProcessing1_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnProcessing1" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                        
                            <asp:GridView ID="grdHoldBackRelease" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px"
                                ForeColor="#0000C0" OnRowDataBound="grdHoldBackRelease_RowDataBound" OnRowCreated="grdHoldBackRelease_RowCreated">
                                 <HeaderStyle CssClass="GVFixedHeader" />
                                <FooterStyle CssClass="GVFixedFooter" />

                                <Columns>
                                    <asp:TemplateField HeaderText="Client Name">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                               <a onMouseover="onmousovertooltip('<%# DataBinder.Eval(Container.DataItem, "Profile_Name")%>','<%# DataBinder.Eval(Container.DataItem, "TotalDlvValue")%>','<%# DataBinder.Eval(Container.DataItem, "ReleaseValue")%>','<%# DataBinder.Eval(Container.DataItem, "System1baln")%>','<%# DataBinder.Eval(Container.DataItem, "System1UnClearbaln")%>','<%# DataBinder.Eval(Container.DataItem, "effectivetradingbaln")%>','<%# DataBinder.Eval(Container.DataItem, "System2baln")%>','<%# DataBinder.Eval(Container.DataItem, "System2UnClearbaln")%>','<%# DataBinder.Eval(Container.DataItem, "effectivemargindepbaln")%>','<%# DataBinder.Eval(Container.DataItem, "System3baln")%>','<%# DataBinder.Eval(Container.DataItem, "System3UnClearbaln")%>','<%# DataBinder.Eval(Container.DataItem, "effectivefdrbaln")%>','<%# DataBinder.Eval(Container.DataItem, "MrgnCalValueWithOutHair")%>','<%# DataBinder.Eval(Container.DataItem, "MrgnCalValue")%>','<%# DataBinder.Eval(Container.DataItem, "effectivemarginbaln")%>','<%# DataBinder.Eval(Container.DataItem, "PendingPurchaseWithOutHair")%>','<%# DataBinder.Eval(Container.DataItem, "PendingPurchase")%>','<%# DataBinder.Eval(Container.DataItem, "effectivpurchasebaln")%>','<%# DataBinder.Eval(Container.DataItem, "PendingSalesWithOutHair")%>','<%# DataBinder.Eval(Container.DataItem, "PendingSales")%>','<%# DataBinder.Eval(Container.DataItem, "effectivsalesbaln")%>','<%# DataBinder.Eval(Container.DataItem, "totbaln")%>','<%# DataBinder.Eval(Container.DataItem, "totunclear")%>','<%# DataBinder.Eval(Container.DataItem, "toteffective")%>','<%# DataBinder.Eval(Container.DataItem, "AppMarginCalProfile")%>','<%# DataBinder.Eval(Container.DataItem, "AppMarginCal")%>','<%# DataBinder.Eval(Container.DataItem, "effectivappmarginbaln")%>','<%# DataBinder.Eval(Container.DataItem, "NetWorth")%>','<%# DataBinder.Eval(Container.DataItem, "PettyRate")%>','<%# DataBinder.Eval(Container.DataItem, "PettyAmt")%>')"; onMouseout="hideddrivetip()"> 
                                               <asp:Label ID="lblclientname" runat="server" ForeColor='<%# (System.Convert.ToInt32(DataBinder.Eval(Container.DataItem, "clienttype"))==0 ? System.Drawing.Color.Blue : System.Convert.ToInt32(DataBinder.Eval(Container.DataItem, "clienttype"))==1 ? System.Drawing.Color.Green : System.Drawing.Color.Black) %>'
                                                    Text='<%# Eval("clientname")%>' CssClass="gridstyleheight1"></asp:Label></a>
                                                <asp:Label ID="lblclientid" Visible="false" runat="server" Text='<%# Eval("clientid")%>' ></asp:Label>    
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UCC">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblclientucc" runat="server" Text='<%# Eval("clientucc")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblgrpcode" runat="server" Text='<%# Eval("grpcode")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Scrip">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblscripname" runat="server" Text='<%# Eval("scripname")%>' CssClass="gridstyleheight1"></asp:Label>
                                             <asp:Label ID="lblproductid" runat="server" Text='<%# Eval("productid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ISIN">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblisinno" runat="server" Text='<%# Eval("isinno")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="To Deliver">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Deliverable">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtReleaseQty" Font-Size="10px" Width="60px" runat="server" Onkeypress="return isNumberKey(event)" Text='<%# Eval("ReleaseQty") %>' style="text-align:right;" ></asp:TextBox>
                                             <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Qty")%>' Visible="false"></asp:Label>
                                              <asp:Label ID="lblReleaseQty" runat="server" Text='<%# Eval("ReleaseQty")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Account Name">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtClientAc" ToolTip="Click To Change A/C" runat="server"  Width="250px" Font-Size="10px" Text='<%# Eval("acname") %>' ></asp:TextBox>
                                            <asp:Label ID="lblacname" Visible="false" runat="server" Text='<%# Eval("acname")%>'></asp:Label>

                                            <asp:Label ID="lbownacid" Visible="false" runat="server" Text='<%# Eval("acid")%>'></asp:Label>
                                            
                                            <asp:Label ID="lblclientacid" Visible="false" runat="server" Text='<%# Eval("clientacid")%>'></asp:Label>
                                            <table>
                                                <tr style="display: none;">
                                                    <td>
                                                        <asp:TextBox ID="txtClientAc_hidden" runat="server" Width="5px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                               
                                    <asp:TemplateField>
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelected" runat="server" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="chkAll" runat="server"  onclick="javascript:SelectAllCheckboxes(this);"/>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                  
                                </Columns>
                                <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                           <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="True" Wrap="False"></HeaderStyle>
                            </asp:GridView>
                          
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click" />
                          
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnProcessing2" runat="server" Text="Generate Transfers" CssClass="btnUpdate"
                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnProcessing2_Click" />
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
