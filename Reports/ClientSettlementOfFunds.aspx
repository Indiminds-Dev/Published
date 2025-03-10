<%@ page language="C#" autoeventwireup="true" inherits="Reports_ClientSettlementOfFunds, App_Web_h4pnmg8n" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Settlement Of Client Funds</title>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />
    <style type="text/css">    
    form {
		display:inline;		
	}	
    </style>

    <script type="text/javascript" language="javascript">
    function SignOff()
    {
      window.parent.SignOff()
    }
    function Page_Load()///Call Into Page Load
    {         
         Hide('showFilter');
         Hide('tr_filter'); 
        // document.getElementById('btnExport').disabled=true;
         Reset();      
         height();         
    }
    function Hide(obj)
    {
      document.getElementById(obj).style.display='none';
    }
    function Show(obj)
    {
       document.getElementById(obj).style.display='inline';
    }
    function height()
    {        
       if(document.body.scrollHeight>=300)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    FieldName="none";
    function ChangeDateFormat_CalToDB(obj)
    {
        var SelectedDate = new Date(obj);            
        var monthnumber = SelectedDate.getMonth() + 1;
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();            
        var changedDateValue=year+'-'+monthnumber+'-'+monthday;
        return changedDateValue;
    }
    function ChangeDateFormat_SetCalenderValue(obj)
    {       
        var SelectedDate = new Date(obj);
        var monthnumber = SelectedDate.getMonth();
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();            
        var changeDateValue=new Date(year, monthnumber, monthday);
        return changeDateValue;            
     } 
    function DateCompare(DateobjFrm,DateobjTo)
    {
        var Msg="To Date Can Not Be Less Than From Date!!!";
        DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
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
       function  fnddlGroup(obj)
       {  
            var clist=document.getElementById('lstSlection').options.length;
            var sType=document.getElementById('cmbsearchOption').value;                  
            if(obj=="0")
            {
                document.getElementById('rdbranchclientAll').checked=true;
                fn_Branch('a'); 
                Hide('td_group');
                Show('td_branch');
                Hide('td_allselect');
            }           
            if(obj=="1")                
            {  
                Show('td_group');
                Hide('td_branch');
                Hide('showFilter');
                var btn = document.getElementById('btnhide');
                btn.click();            
             }            
             if(obj=="2")
             { 
                document.getElementById('rdbranchclientSelected').checked=true;
                fn_Clients('b');
                Hide('td_group');
                Show('td_branch');
                Hide('td_allselect');               
              }     
            height();
       }
       function fn_Branch(obj)
       {     
            if(obj=="a")
                Hide('showFilter');
             else
             {
              var cmbBranchOpt=document.getElementById('cmbsearchOption');
                  if(document.getElementById('ddlGroup').value=="0")
                   {
                    cmbBranchOpt.value='Branch';
                   }                   
                  Show('showFilter');
             }                      
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
               document.getElementById('rdddlgrouptypeAll').checked=true;
               Show('td_allselect');
           }      
           height();
       }
       function fn_Group(obj)
       {      
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('showFilter');
             }                        
       }  
        function fn_Clients(obj)
        {        
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmbClient=document.getElementById('cmbsearchOption');
                  if(document.getElementById('ddlGroup').value=="2")
                   {
                      cmbClient.value='Clients';
                   }
                  Show('showFilter');
             }             
        }
     function ReceiveServerData(rValue)
        {       
           var j=rValue.split('~');
           var btn = document.getElementById('btnhide');
           if(j[0]=='Branch')
            {             
                document.getElementById('HiddenField_Branch').value = j[1];                
            }
            if(j[0]=='Group')
            {
                document.getElementById('HiddenField_Group').value = j[1];
                btn.click();
            }  
            if(j[0]=='Clients')
            {
                document.getElementById('HiddenField_Client').value = j[1];
            }               
        }
        function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal; 
          if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0")//////////////Group By  selected are branch
                {               
                    if(document.getElementById('rdbranchAll').checked==true)
                       {
                           cmbVal='ClientsBranch'+'~'+'ALL';
                       }
                   else
                       {
                           cmbVal='ClientsBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value;
                       }                   
                }
               else if(document.getElementById('ddlGroup').value=="1")//////////////Group By selected are Group
                {
                   if(document.getElementById('rdddlgrouptypeAll').checked==true)
                       {
                           cmbVal='ClientsGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                       }
                   else
                       {
                           cmbVal='ClientsGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value;
                       }
                }
               else if(document.getElementById('ddlGroup').value=="2")///////client wise
                {
                       cmbVal='ClientsBranch'+'~'+'ALL';
                }
            }
            else
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
            }          
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);
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
                alert('Please search name and then Add!');
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
            document.getElementById('btnExport').disabled=false;
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
      function NORECORD(obj)
      {      
          Hide('showFilter');
          var grpBy=document.getElementById('ddlGroup').value;         
            if(obj=='1')
            {
                 if(grpBy=='0' && document.getElementById('HiddenField_Branch').value=='')
                 {
                    alert('You Have To Select Atleast One Branch !!');
                    Reset();  
                 }
                 if(grpBy=='1' && document.getElementById('HiddenField_Group').value=='')
                 {
                    alert('You Have To Select Atleast One Group !!');
                    Reset();  
                 }
                 if(grpBy=='2' && document.getElementById('HiddenField_Client').value=='')
                 {
                    alert('You Have To Select Atleast One Client !!');  
                    Reset();               
                 }
             }  
            if(obj=='2')
            {
                alert('No Record Found !! ');
                Reset();
            }
          height();
      }
      function Reset()
      {  
           Hide('showFilter');          
           document.getElementById('HiddenField_Branch').value=='';
           document.getElementById('HiddenField_Group').value=='';
           document.getElementById('HiddenField_Client').value=='';   
           dtfrom.SetDate(new Date());
           dtto.SetDate(new Date());                        
           document.getElementById('<%=ddlGroup.ClientID%>').selectedIndex=0;
           document.getElementById('rdbranchclientAll').checked=true;
           document.getElementById('<%=cmbsearchOption.ClientID%>').selectedIndex=0;
           document.getElementById('<%=ddlgrouptype.ClientID%>').selectedIndex=0;  
           document.getElementById('<%=ddlgrouptype.ClientID%>').style.display='none';
           document.getElementById('td_group').style.display='none';   
           document.getElementById('td_branch').style.display='inline';                                    
           height();
      }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <div class="TableMain100">
                <div class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Settlement of Client Funds</span></strong>
                </div>
            </div>
            <div class="pageContent">
                <div id="showFilter" class="right" style="width: 472px; background-color: #B7CEEC;
                    border: solid 2px  #ccc; display: none;">
                    <div style="width: 100%">
                        <div class="frmleftContent">
                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Height="20px" Width="260px"
                                onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)" TabIndex="0"></asp:TextBox>
                        </div>
                        <div class="frmleftContent" style="padding-top: 3px">
                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="13px" Width="110px"
                                Enabled="false">
                                <asp:ListItem>Branch</asp:ListItem>
                                <asp:ListItem>Group</asp:ListItem>
                                <asp:ListItem>Clients</asp:ListItem>
                            </asp:DropDownList></div>
                        <div class="frmleftContent">
                            <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()" tabindex="0"><span
                                style="color: #009900; text-decoration: underline; font-size: 10pt;">Add to List</span></a>
                        </div>
                    </div>
                    <span class="clear" style="background-color: #B7CEEC;"></span>
                    <div class="frmleftContent" style="height: 105px; margin-top: 5px">
                        <asp:ListBox ID="lstSlection" runat="server" Font-Size="12px" Height="100px" Width="460px"
                            TabIndex="0"></asp:ListBox>
                    </div>
                    <span class="clear" style="background-color: #B7CEEC;"></span>
                    <div class="frmleftContent" style="text-align: center">
                        <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()" tabindex="0"><span style="color: #000099;
                            text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp; <a id="A1"
                                href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()" tabindex="0"><span
                                    style="color: #cc3300; text-decoration: underline; font-size: 10pt;">Remove</span></a>
                    </div>
                </div>
                <div id="dvMainFilter" class="frmContent" style="width: 498px">
                    <div id="forDate">
                        <div class="frmleftContent" style="width: 80px; line-height: 20px">
                            <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                        </div>
                        <div class="left">
                            <div class="frmleftContent">
                                <dxe:ASPxDateEdit ID="dtfrom" runat="server" ClientInstanceName="dtfrom" DateOnError="Today"
                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="125px"
                                    Height="25px" Font-Size="11px" TabIndex="0">
                                    <DropDownButton Text="From">
                                    </DropDownButton>
                                    <ClientSideEvents DateChanged="function(s,e){DateCompare(dtfrom,dtto);}"></ClientSideEvents>
                                </dxe:ASPxDateEdit>
                            </div>
                            <div class="frmleftContent">
                                <dxe:ASPxDateEdit ID="dtto" runat="server" ClientInstanceName="dtto" DateOnError="Today"
                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="125px"
                                    Height="25px" Font-Size="11px" TabIndex="0">
                                    <DropDownButton Text="To">
                                    </DropDownButton>
                                    <ClientSideEvents DateChanged="function(s,e){DateCompare(dtfrom,dtto);}"></ClientSideEvents>
                                </dxe:ASPxDateEdit>
                            </div>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div id="tr_grpselection">
                        <div class="frmleftContent" style="width: 80px; line-height: 20px">
                            <asp:Label ID="lblGroupBy" runat="server" Text="Group By : "></asp:Label>
                        </div>
                        <div class="left">
                            <div class="frmleftContent" style="padding-top: 3px">
                                <asp:DropDownList ID="ddlGroup" runat="server" Width="125px" Font-Size="13px" onchange="fnddlGroup(this.value)"
                                    TabIndex="0">
                                    <asp:ListItem Value="0">Branch</asp:ListItem>
                                    <asp:ListItem Value="1">Group</asp:ListItem>
                                    <asp:ListItem Value="2">Clients</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div id="td_branch" class="frmleftContent" style="width: 125px; padding-top: 3px; font-size:12px;">
                                <asp:RadioButton ID="rdbranchclientAll" runat="server" Checked="True" GroupName="a"
                                    onclick="fn_Branch('a')" TabIndex="0" />
                                All
                                <asp:RadioButton ID="rdbranchclientSelected" runat="server" GroupName="a" onclick="fn_Branch('b')"
                                    TabIndex="0" />Selected
                            </div>
                            <div id="td_group" class="left" style="display: none;">
                                <div class="left">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="frmleftContent">
                                                <asp:DropDownList ID="ddlgrouptype" runat="server" Width="125px" Font-Size="13px"
                                                    onchange="fngrouptype(this.value)" TabIndex="0">
                                                </asp:DropDownList>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                                <div id="td_allselect" class="frmleftContent" style="display: none; width: 125px; font-size:12px">
                                    <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b"
                                        onclick="fn_Group('a')" TabIndex="0" />
                                    All
                                    <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="fn_Group('b')"
                                        TabIndex="0" />Selected
                                </div>
                            </div>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div id="td_show" class="right" style="padding: 5px">
                        <asp:Button ID="btnExport" runat="server" CssClass="frmbtn" Text="Export" Width="80px"
                            OnClick="btnExport_Click" TabIndex="0" />
                    </div>
                </div>
                <br class="clear" />
                <div style="display: none">
                    <asp:HiddenField ID="hdnDPSessionValue" runat="server" />
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
