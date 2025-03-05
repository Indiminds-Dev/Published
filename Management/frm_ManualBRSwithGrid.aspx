<%@ page language="C#" autoeventwireup="true" inherits="management_frm_ManualBRSwithGrid, App_Web_g1t3n0jz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery.meio.mask.js"></script>

    <style type="text/css">
	
	.grid_scrollNSEFO
     {
		    overflow-y: scroll;  
            overflow-x: no; 
            width:1000px;
            height:300px;
            scrollbar-base-color: #C0C0C0;
        
     }
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
	
	</style>

    <script type="text/javascript">
  (function($){
    // call setMask function on the document.ready event
      $(function(){
        $('input:text').setMask();
      }
    );
  })(jQuery);
    </script>

    <script language="javascript" type="text/javascript">
function Page_Laod()
{
    if(document.getElementById("ChkConsiderAllDate").checked==true)
    {
        tdConsiderAllDate.style.display='inline';
        tdConsiderAllDatelbl.style.display='inline';
        tdDateFrom.style.display='none';
        tdDateFromlbl.style.display='none';
        tdDateTo.style.display='none';
        tdDateTolbl.style.display='none';
    }
    else
    {
        tdConsiderAllDate.style.display='none';
        tdConsiderAllDatelbl.style.display='none';
        tdDateFrom.style.display='inline';
        tdDateFromlbl.style.display='inline';
        tdDateTo.style.display='inline';
        tdDateTolbl.style.display='inline';
    }
}
function height()
{
    
    if(document.body.scrollHeight>=300)
        window.frameElement.height = document.body.scrollHeight;
    else
        window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
}

 function ShowBankName(obj1,obj2,obj3)
 {
    ajax_showOptions(obj1,obj2,obj3,'Current');
 }
 FieldName='lblFieldName';


function setvalue(obj1)
{
    var controlid=obj1.id.split('_');
    var getintno=controlid[1].split('l')
    var trantest=document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+'lblTransactionDate');
    var kk=trantest.innerText;
    var kksplit=kk.split('/');
    var years=kksplit[2].split(' ');
    if(kksplit[0]==1)
    {
        kksplit[0]='Jan';
        
    }
    else if(kksplit[0]==2)
    {
        kksplit[0]='Feb';
        
    }
   else if(kksplit[0]==3)
    {
        kksplit[0]='Mar';
        
    }
   else if(kksplit[0]==4)
    {
        kksplit[0]='Apr';
        
    }
    else if(kksplit[0]==5)
    {
        kksplit[0]='May';
        
    }
   else if(kksplit[0]==6)
    {
        kksplit[0]='Jun';
        
    }
    else if(kksplit[0]==7)
    {
        kksplit[0]='Jul';
        
    }
    else if(kksplit[0]==8)
    {
        kksplit[0]='Aug';
        
    }
    else if(kksplit[0]==9)
    {
        kksplit[0]='Sep';
        
    }
    else if(kksplit[0]==10)
    {
        kksplit[0]='Oct';
        
    }
    else if(kksplit[0]==11)
    {
        kksplit[0]='Nov';
        
    }
     else if(kksplit[0]==12)
    {
        kksplit[0]='Dec';
        
    }
       
    var newDatewFormat=kksplit[1]+' '+kksplit[0]+' '+years[0];
//    alert(newDatewFormat);
    var FromDate=Date.parse(newDatewFormat);
   
    var objValueDate=document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]);
//    var ValDate=Date.parse(objValueDate.value);
//    alert(objValueDate.value);

    var Testalidity=objValueDate.value.split('-');
   
    if( Testalidity[1]==1)
    {
         Testalidity[1]='Jan';
        
    }
    else if( Testalidity[1]==2)
    {
        Testalidity[1]='Feb';
        
    }
   else if( Testalidity[1]==3)
    {
         Testalidity[1]='Mar';
        
    }
   else if( Testalidity[1]==4)
    {
         Testalidity[1]='Apr';
        
    }
    else if( Testalidity[1]==5)
    {
         Testalidity[1]='May';
        
    }
   else if( Testalidity[1]==6)
    {
         Testalidity[1]='Jun';
        
    }
    else if( Testalidity[1]==7)
    {
         Testalidity[1]='Jul';
        
    }
    else if( Testalidity[1]==8)
    {
         Testalidity[1]='Aug';
        
    }
    else if( Testalidity[1]==9)
    {
         Testalidity[1]='Sep';
        
    }
    else if( Testalidity[1]==10)
    {
         Testalidity[1]='Oct';
        
    }
    else if( Testalidity[1]==11)
    {
         Testalidity[1]='Nov';
        
    }
     else if( Testalidity[1]==12)
    {
         Testalidity[1]='Dec';
        
    }
   var ValDate=Date.parse(Testalidity[0]+' '+Testalidity[1]+' '+Testalidity[2]);
     if(parseInt(Testalidity[0])>31)
    {
         alert('Invalid Date Format');
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).focus();
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).select();
    }
    else if(parseInt(Testalidity[1])>12)
    {
         alert('Invalid Date Format');
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).focus();
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).select();
    }
    if(ValDate<FromDate)
    {
       
//         alert(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]);
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).focus();
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).select();
         alert('Value Date can not be less than Transaction Date');
         
    }
    else
    {
        
        var a=parseInt(getintno[1])+1;//For next Value Date
        if(getintno[1]==8 )
        {
            a="9";
        }
        if(getintno[1]==9)
        {
            a="10";
        }
        if(a<10)
        {
         
            a='0'+a;
        }
//         alert(controlid[0]+'_'+getintno[0]+'l'+a+'_'+controlid[2]);
//         alert(document.getElementById(controlid[0]+'_'+getintno[0]+'l'+a+'_'+controlid[2]).value);
//        if(document.getElementById(controlid[0]+'_'+getintno[0]+'l'+a+'_'+controlid[2]).value =="")
//        { 
//            alert('forward previous date to next');
//             document.getElementById(controlid[0]+'_'+getintno[0]+'l'+a+'_'+controlid[2]).value=document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).value;
//        }
    
    }
    
}

function setvalueValuedate(obj1)
{
    var controlid=obj1.id.split('_');
    var getintno=controlid[1].split('l')
    var trantest=document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+'lblTransactionDate');
    var kk=trantest.innerText;
    var kksplit=kk.split('/');
    var years=kksplit[2].split(' ');
    if(kksplit[0]==1)
    {
        kksplit[0]='Jan';
        
    }
    else if(kksplit[0]==2)
    {
        kksplit[0]='Feb';
        
    }
   else if(kksplit[0]==3)
    {
        kksplit[0]='Mar';
        
    }
   else if(kksplit[0]==4)
    {
        kksplit[0]='Apr';
        
    }
    else if(kksplit[0]==5)
    {
        kksplit[0]='May';
        
    }
   else if(kksplit[0]==6)
    {
        kksplit[0]='Jun';
        
    }
    else if(kksplit[0]==7)
    {
        kksplit[0]='Jul';
        
    }
    else if(kksplit[0]==8)
    {
        kksplit[0]='Aug';
        
    }
    else if(kksplit[0]==9)
    {
        kksplit[0]='Sep';
        
    }
    else if(kksplit[0]==10)
    {
        kksplit[0]='Oct';
        
    }
    else if(kksplit[0]==11)
    {
        kksplit[0]='Nov';
        
    }
     else if(kksplit[0]==12)
    {
        kksplit[0]='Dec';
        
    }
       
    var newDatewFormat=kksplit[1]+' '+kksplit[0]+' '+years[0];
//    alert(newDatewFormat);
    var FromDate=Date.parse(newDatewFormat);
   
    var objValueDate=document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]);
//    var ValDate=Date.parse(objValueDate.value);
//    alert(objValueDate.value);

    var Testalidity=objValueDate.value.split('-');
   
    if( Testalidity[1]==1)
    {
         Testalidity[1]='Jan';
        
    }
    else if( Testalidity[1]==2)
    {
        Testalidity[1]='Feb';
        
    }
   else if( Testalidity[1]==3)
    {
         Testalidity[1]='Mar';
        
    }
   else if( Testalidity[1]==4)
    {
         Testalidity[1]='Apr';
        
    }
    else if( Testalidity[1]==5)
    {
         Testalidity[1]='May';
        
    }
   else if( Testalidity[1]==6)
    {
         Testalidity[1]='Jun';
        
    }
    else if( Testalidity[1]==7)
    {
         Testalidity[1]='Jul';
        
    }
    else if( Testalidity[1]==8)
    {
         Testalidity[1]='Aug';
        
    }
    else if( Testalidity[1]==9)
    {
         Testalidity[1]='Sep';
        
    }
    else if( Testalidity[1]==10)
    {
         Testalidity[1]='Oct';
        
    }
    else if( Testalidity[1]==11)
    {
         Testalidity[1]='Nov';
        
    }
     else if( Testalidity[1]==12)
    {
         Testalidity[1]='Dec';
        
    }
   var ValDate=Date.parse(Testalidity[0]+' '+Testalidity[1]+' '+Testalidity[2]);
    if(parseInt(Testalidity[0])>31)
    {
         alert('Invalid Date Format');
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).focus();
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).select();
    }
    else if(parseInt(Testalidity[1])>12)
    {
         alert('Invalid Date Format');
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).focus();
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).select();
    }
    if(ValDate<FromDate)
    {
       
//         alert(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]);
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).focus();
         document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).select();
         alert('Value Date can not be less than Transaction Date');
         
    }
    else
    {
        if(document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+'txtStatementDate').value !="")
        {
            if(document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+'txtValueDate').value =="")
            { 
                 var StDate=document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+controlid[2]).value;
                 var SettlementDate=StDate.split('-');
                 var sdate=SettlementDate[1]+"/"+SettlementDate[0]+"/"+SettlementDate[2];
                 myDate=new Date(sdate);
                    myDate.setDate(myDate.getDate()+2)
                    var date2 =myDate.getDate()+'-'+ parseInt(myDate.getMonth()+1)+'-'+myDate.getFullYear();
                 document.getElementById(controlid[0]+'_'+getintno[0]+'l'+getintno[1]+'_'+'txtValueDate').value=date2
            }
        }
    }
  
}
function DateChangeBehaviourFrom()
{
    var datediff=cFromDate.GetDate()-cDateTo.GetDate()
    if(datediff < -1296000000)
    {
       var d = new Date(cFromDate.GetDate());
       d.setDate(d.getDate()+15);
       cDateTo.SetDate(d);
    }
    if(datediff>0)
    {
        alert('From Date Can not Be More than To Date');
        cFromDate.SetDate(cDateTo.GetDate());
    }
}
function DateChangeBehaviourTo()
{
    var datediff=cFromDate.GetDate()-cDateTo.GetDate()
    if(datediff < -1296000000)
    {
        var d = new Date(cFromDate.GetDate());
        d.setDate(d.getDate()+15);
        cDateTo.SetDate(d);
    }
    if(datediff>0)
    {
        alert('To Date Can not be less than From Date');
        cDateTo.SetDate(cFromDate.GetDate());
    }
}
 function SearchVisible(obj)
 {
    
     if(obj=='N')
     {
        document.getElementById("trsearch").style.display='none';
     }
     else
     {
        document.getElementById("trsearch").style.display='inline';
     }
 }
    </script>

    <script type="text/javascript"> 
        $(document).ready(function() { 

            $(".water").each(function() { 
                if ($(this).val() == this.title) { 
                    $(this).addClass("opaque"); 
                } 
            }); 

            $(".water").focus(function() { 
                if ($(this).val() == this.title) { 
                    $(this).val(""); 
                    $(this).removeClass("opaque"); 
                }                 
            }); 

            $(".water").blur(function() { 
                if ($.trim($(this).val()) == "") { 
                    $(this).val(this.title); 
                    $(this).addClass("opaque"); 
                } 
                else { 
                    $(this).removeClass("opaque"); 
                } 
            }); 
        });  
        
        function ChkConsiderAllDate_OnClick(Checked)
        {
            if(!Checked)
            { 
               tdDateFrom.style.display='inline';
               tdDateFromlbl.style.display='inline';
               tdDateTo.style.display='inline';
               tdDateTo.style.display='inline';
            }
            else
            {
                tdDateFrom.style.display='none';
                tdDateFromlbl.style.display='none';
                tdDateTo.style.display='none';
                tdDateTolbl.style.display='none';
            }
        }
        function SetDateRange(WhichCall)
        {
            if(WhichCall=="UNCLEAR")
            {
                document.getElementById("ChkConsiderAllDate").checked=true;
                tdConsiderAllDate.style.display='inline';
                tdConsiderAllDatelbl.style.display='inline';
                tdDateFrom.style.display='none';
                tdDateFromlbl.style.display='none';
                tdDateTo.style.display='none';
                tdDateTolbl.style.display='none';
            }
            if(WhichCall=="CLEAR" || WhichCall=="ALL")
            {
               document.getElementById("ChkConsiderAllDate").checked=false;
               tdConsiderAllDate.style.display='none';
               tdConsiderAllDatelbl.style.display='none';
               tdDateFrom.style.display='inline';
               tdDateFromlbl.style.display='inline';
               tdDateTo.style.display='inline';
               tdDateTo.style.display='inline';
            }
        } 
        function CallBankAccount(obj1,obj2,obj3)
        {
           var CurrentSegment=document.getElementById('hdn_CurrentSegment').value;
           var strPutSegment = " and (MainAccount_ExchangeSegment=" + CurrentSegment + " or MainAccount_ExchangeSegment=0)";
           var strQuery_Table = "(Select MainAccount_AccountCode+\'-\'+MainAccount_Name+\' [ \'+MainAccount_BankAcNumber+\' ]\' as IntegrateMainAccount,MainAccount_AccountCode as MainAccount_AccountCode,MainAccount_Name,MainAccount_BankAcNumber from Master_MainAccount where (MainAccount_BankCashType=\'Bank\' or MainAccount_BankCashType=\'Cash\') and (MainAccount_BankCompany=\'" + '<%=Session["LastCompany"] %>' + "\' Or IsNull(MainAccount_BankCompany,'')='')" + strPutSegment + ") as t1";
           var strQuery_FieldName = " Top 10 * ";
           var strQuery_WhereClause = "MainAccount_AccountCode like (\'%RequestLetter%\') or MainAccount_Name like (\'%RequestLetter%\') or MainAccount_BankAcNumber like (\'%RequestLetter%\')";
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
        }
        function replaceChars(entry) {
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
        function ShowUpdateCancelButton()
        {
            td_CancelUpdate.style.display="inline";
            height();
        }    

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100" style="width: 98%" border="1">
            <tr class="EHEADER">
                <td colspan="4" align="center" style="font-weight: bold; color: Blue">
                    MANUAL BRS
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; background-color: #b7ceec; text-align: center; width: 5%;">
                    <asp:Label ID="Label1" CssClass="mylabel1" runat="server" Text="Bank"/>
                </td>
                <td style="width: 25%" valign="top">
                    <asp:TextBox ID="txtBankName" runat="server" Font-Size="12px" Width="95%" Height="16px" onkeyup ="CallBankAccount(this,'GenericAjaxList',event)"></asp:TextBox>
                    <asp:HiddenField ID="txtBankName_hidden" runat="server"></asp:HiddenField>
                    <asp:Label ID="lblFieldName" runat="server" Text="Label" Visible="false"></asp:Label>
                </td>
                <td>
                    <table style="border: solid 1px white" border="1">
                        <tr>
                            <td>
                                <asp:RadioButton ID="RdUnCleared" runat="server" Text="" Checked="true" GroupName="R" onclick="SetDateRange('UNCLEAR');" /></td>
                            <td class="mylabel1" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                Uncleared</td>
                            <td>
                                <asp:RadioButton ID="RdCleared" runat="server" Text="" GroupName="R" onclick="SetDateRange('CLEAR');"/>
                            </td>
                            <td class="mylabel1" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                Cleared
                            </td>
                            <td>
                                <asp:RadioButton ID="RdAll" runat="server" Text="" GroupName="R" onclick="SetDateRange('ALL');"/>
                            </td>
                            <td class="mylabel1" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                All
                            </td>
                            <td class="mylabel1" id="tdConsiderAllDate">
                                <asp:CheckBox ID="ChkConsiderAllDate" runat="server" Checked="true" onclick="ChkConsiderAllDate_OnClick(this.checked)" /></td>
                            <td class="mylabel1" id="tdConsiderAllDatelbl" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                            All Dates
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="border-right: white 1px solid; border-top: white 1px solid; border-left: white 1px solid;
                        border-bottom: white 1px solid" border="1">
                        <tr >
                            <td class="rt" id="tdDateFromlbl" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                <asp:Label ID="lblFromdate" CssClass="mylabel1" runat="server" Text="From:" Width="28px"></asp:Label>
                            </td>
                            <td id="tdDateFrom">
                                <dxe:ASPxDateEdit ID="FromDate" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                     ClientInstanceName="cFromDate" UseMaskBehavior="True" Width="100px">
                                    <ButtonStyle Width="13px"></ButtonStyle>
                                    <ClientSideEvents DateChanged="function(s, e){ DateChangeBehaviourFrom();}" />
                                </dxe:ASPxDateEdit>
                            </td>
                            <td class="rt" id="tdDateTolbl" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                <asp:Label ID="lblToDate" CssClass="mylabel1" runat="server" Text="To:"></asp:Label>
                            </td>
                            <td id="tdDateTo">
                                <dxe:ASPxDateEdit ID="DateTo" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                     ClientInstanceName="cDateTo" UseMaskBehavior="True" Width="100px">
                                    <ButtonStyle Width="13px"></ButtonStyle>
                                    <ClientSideEvents ValueChanged="function(s, e){ DateChangeBehaviourTo(cDateTo);}" />
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                <asp:Button ID="btnShow" runat="server" CssClass="btnUpdate" OnClick="btnShow_Click1"
                                    Text="Show" Height="22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <table>
                        <tr id="trhypertext" runat="server" visible="false">
                            <td style="height: 16px">
                                <asp:LinkButton ID="lnAllRecords" runat="server" Font-Underline="True" ForeColor="#8080FF"
                                    NavigateUrl="javascript:void(0)" CssClass="myhypertext" OnClick="lnAllRecords_Click">All Records</asp:LinkButton>
                            </td>
                            <td style="height: 16px">
                                <asp:HyperLink ID="hpFilterRecords" runat="server" Font-Underline="True" ForeColor="#8080FF"
                                    NavigateUrl="javascript:void(0)" CssClass="myhypertext" onclick="SearchVisible('Y')">Show Filter</asp:HyperLink>
                            </td>
                            <%--<td>
                                <b>Bank Balance :</b>
                            </td>
                            <td>
                                <asp:Literal ID="litBankBalance" runat="server"></asp:Literal>
                            </td>
                            <td>
                                <b>Clear Balance :</b>
                            </td>
                            <td>
                                <asp:Literal ID="litClearBalance" runat="server"></asp:Literal>
                            </td>--%>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trsearch" visible="false">
                <td colspan="4">
                    <table border="1">
                        <tr>
                            <td valign="middle">
                                <dxe:ASPxDateEdit ID="AspTranDate" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                    UseMaskBehavior="True" Width="90px" NullText="Tran Date">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td valign="middle">
                                <asp:TextBox ID="txtVoucherNo" runat="server" Width="74px" CssClass="water" Text="Voucher No"
                                    ToolTip="Voucher No"></asp:TextBox>
                            </td>
                            <td valign="middle">
                                <dxe:ASPxDateEdit ID="AspInsDate" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                    UseMaskBehavior="True" Width="90px" NullText="Ins Date">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                <asp:TextBox ID="txtInsNo" runat="server" CssClass="water" Text="Ins No" ToolTip="Ins No"
                                    Width="60px"></asp:TextBox>
                            </td>
                            <td valign="middle">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtAccName" runat="server" Width="275px" CssClass="water" Text="Main Account"
                                                ToolTip="Main Account"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="txtSubName" runat="server" Width="80px" CssClass="water" Text="SubAccount"
                                                ToolTip="SubAccount"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="middle">
                                <asp:TextBox ID="txtPayAmt" runat="server" Width="60px" CssClass="water" Text="Pmt Amount"
                                    ToolTip="Pmt Amount"></asp:TextBox>
                            </td>
                            <td valign="middle">
                                <asp:TextBox ID="txtReptAmt" runat="server" Width="60px" CssClass="water" Text="Rcpt Amount"
                                    ToolTip="Rcpt Amount"></asp:TextBox>
                            </td>
                            <td valign="middle">
                                <dxe:ASPxDateEdit ID="AspValueDate" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                    UseMaskBehavior="True" Width="84px" NullText="Value Date">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td valign="middle">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" Height="23px" Width="53px"
                                    CssClass="btnUpdate" OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server" id="MainContent" visible="false">
                <td colspan="4">
                    <div class="grid_scrollNSEFO" style="width: 95%">
                        <asp:GridView ID="grdDetails" AutoGenerateColumns="false" runat="server" OnDataBound="grdDetails_DataBound" Width="97%">
                            <Columns>
                                <asp:TemplateField HeaderText="Trans Date">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblTranDate" runat="server" Text='<%# Eval("cashbank_transactionDate") %>'
                                                         /></td>
                                            </tr>
                                            <tr style="display: none">
                                                <td>
                                                    <asp:Label ID="lblTransactionDate" runat="server" Text='<%# Eval("cashbank_transactionDate_test") %>' />
                                                    <asp:Label ID="lblMainAcc" runat="server" Text='<%# Eval("cashbankdetail_mainaccountid") %>' />
                                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("cashbankdetail_id") %>' />
                                                    <asp:Label ID="lblSegID" runat="server" Text='<%# Eval("Cashbank_ExchangeSegmentID") %>' />
                                                    <asp:Label ID="lblSubCode" runat="server" Text='<%# Eval("subaccount_code") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="EHEADER"/>
                                    <ItemStyle Width="8%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Voucher No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVoucherNo" runat="server" Text='<%# Eval("cashbank_vouchernumber") %>'
                                            />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="EHEADER" />
                                    <ItemStyle Width="8%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ins Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInsDate" runat="server" Text='<%# Eval("cashbankdetail_instrumentdate") %>'
                                            />
                                            
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="EHEADER" />
                                    <ItemStyle Width="8%" />
                                    
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ins No">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInsNo" runat="server" Text='<%# Eval("cashbankdetail_instrumentnumber") %>'
                                            />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="8%" />
                                    <HeaderStyle CssClass="EHEADER" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Account Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAccName" runat="server" Text='<%# Eval("AccountCode") %>'  />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="EHEADER" />
                                    <ItemStyle Width="30%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sub AccName" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubAcc" runat="server" Text='<%# Eval("subaccount_name") %>'  />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="EHEADER" />
                                    <ItemStyle Width="0%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pymt Amt">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPmtAmt" runat="server" Text='<%# Eval("cashbankdetail_paymentamount") %>' 
                                            CssClass="rt" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="8%" />
                                    <HeaderStyle CssClass="EHEADER" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rcpt Amt">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRcptAmt" runat="server" Text='<%# Eval("cashbankdetail_receiptamount") %>'
                                            CssClass="rt" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="8%" />
                                    <HeaderStyle CssClass="EHEADER" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Statement Date (DD-MM-YYYY)">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtStatementDate" Visible="true" runat="server" alt="date" Text='<%# Eval("cashbankdetail_bankstatementdate") %>'
                                            onblur="setvalueValuedate(this)" Width="90%"  />
                                        <%--<input id="Text1" type="text" alt="date" />--%>
                                    </ItemTemplate>
                                    <ItemStyle Width="10%" />
                                     <HeaderStyle CssClass="EHEADER" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Value Date (DD-MM-YYYY)">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtValueDate" Visible="true" runat="server" alt="date" Text='<%# Eval("cashbankdetail_bankvaluedate") %>'
                                            onblur="setvalue(this)" Width="90%" />
                                        <%--<input id="Text1" type="text" alt="date" />--%>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="EHEADER" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </td>
            </tr>
            <tr>
               
                <td id="td_CancelUpdate" style="display:none;text-align:center" colspan="4" >
                    &nbsp;<table border="1">
                        <tr>
                            <td style="width: 3px">
                            </td>
                            <td style="width: 100px">
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btnUpdate" OnClick="btnUpdate_Click" Width="100px" /></td>
                            <td style="width: 100px">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClick="btnCancel_Click" Width="100px" /></td>
                        </tr>
                    </table>
                </td>
               
            </tr>
        </table>
        <asp:HiddenField ID="hdn_CurrentSegment" runat="server" />
    </form>
</body>
</html>
