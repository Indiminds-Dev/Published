<%@ page language="C#" autoeventwireup="true" inherits="Reports_new_frmReport_cdslTransction, App_Web_rjq8jf2h" enableeventvalidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CDSL Transaction Report</title>

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
    <%--Common JavaScript--%>
    <script type="text/javascript" language="javascript">
    SessionSelBrnchGrp='';
    function SignOff()
    {
      window.parent.SignOff()
    }
    function PageLoad()
    {   
        Hide('divShowMainFilter'); 
        Hide('showFilter');          
        Hide('tdtxtIsin');       
        Hide('tdtxtSettlement');
        Hide('divGroupByGroup');               
        if(document.getElementById('txtISIN_hidden').value=="")
             ShowISINFilterForm('A');         
        else
             ShowISINFilterForm('S');
        if(document.getElementById('txtSettlement_hidden').value=="")
             ShowSettlementFilterForm('A');
        else       
             ShowSettlementFilterForm('S');        
        if(document.getElementById('HiddenField_Client').value == "") 
             OnClientFilter('A'); 
        else 
             OnClientFilter('S');       
        if(document.getElementById('HiddenField_Branch').value == "") 
             OnBranchFilter('A'); 
        else 
             OnBranchFilter('S');      
        if(crbGroupBy.GetSelectedItem().value=="C")
        {  
            Hide('divGroupByBranch');
            Show('divGroupByClient');       
        }
        else if(crbGroupBy.GetSelectedItem().value=="B")
        {
            Hide('divSelectedGroup');            
            Hide('divGroupByClient');            
            Show('divGroupByBranch'); 
            Show('divSelectedBranch');              
        }
        else
        {
            Hide('divSelectedBranch');            
            Hide('divGroupByClient');
            Hide('divGroupByBranch');            
            Show('divGroupByGroup');
            Show('divSelectedGroup');
        }       
    }
    function Reset()
    {       
        Hide('divPageFilter'); 
        Show('divShowMainFilter');
        Show('divGenerate');
        if(crbGroupBy.GetSelectedItem().value=="B")
        {
            Hide('divSelectedGroup');
            Show('divSelectedBranch');
        }
        else if(crbGroupBy.GetSelectedItem().value=="G")
        {
            Hide('divSelectedBranch');
            Show('divSelectedGroup');
        }
    }    
    function ShowMainFilter()
    {        
        Hide('showFilter');
        Hide('divShowMainFilter');
        Hide('divSelectedBranch');
        Hide('divSelectedGroup');
        Hide('divClientDetl');
        document.getElementById('<%=txtISIN_hidden.ClientID%>').value='';
        document.getElementById('<%=txtSettlement_hidden.ClientID%>').value='';
        document.getElementById('<%=HiddenField_Client.ClientID%>').value='';
        document.getElementById('<%=HiddenField_Branch.ClientID%>').value='';
        document.getElementById('<%=HiddenField_Group.ClientID%>').value='';
        dtfrom.SetDate(new Date());
        dtto.SetDate(new Date());
        crbISIN.SetSelectedIndex(0); 
        ShowISINFilterForm('A');         
        crbSettlement.SetSelectedIndex(0);
        ShowSettlementFilterForm('A'); 
        crbGroupBy.SetValue('C'); 
        crbUser.SetValue('A');            
        Show('divPageFilter');
        Hide('divGroupByBranch');
        Hide('divGroupByGroup');
        Show('divGroupByClient');
        var ddlGen=document.getElementById('<%=ddlGenerate.ClientID%>');
        if(ddlGen.value !="A")
        {
            SetDDLSelectedIndex(ddlGen,"A");
        }          
        Show('<%=ddlGenerate.ClientID%>');           
        Show('td_show');                      
        Show('divGenerate');   
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
       if(document.body.scrollHeight>=350)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }    
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
     function SetDDLSelectedIndex(dropdownlist,sVal)
     {        
        for(i=0;i<dropdownlist.length;i++)
        {
            if(dropdownlist.options[i].value == sVal)
            {
                dropdownlist.selectedIndex = i;
            }
        }
     }
     function ChangeDateFormat_CalToDB(obj)
    {
        var SelectedDate = new Date(obj);            
        var monthnumber = SelectedDate.getMonth() + 1;
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();            
        var changedDateValue=year+'-'+monthnumber+'-'+monthday;
        return changedDateValue;
    }
    </script>

    <%--Page Wise JavaScript--%>
    <script type="text/javascript" language="javascript"> 
       function OnClientTypeChanged(s,e)
        {
            document.getElementById('txtSettlement_hidden').value="";
            document.getElementById('txtSettlement').value="";        
            var item=s.GetSelectedItem();       
            if (item.text=='Clearing Member' || item.text=='All')
            {               
                Hide('tdtxtSettlement');
                Show('divSettlementNo');
                ShowSettlementFilterForm('A');
            }
            else
            {         
                Hide('divSettlementNo');
            }
            crbSettlement.SetSelectedIndex(0);
        }        
    </script>

    <%--JavaSxcript for Client-Branch-Group Wise Show Hide Condition--%>
    <script type="text/javascript" language="javascript">
          FieldName="none";
          AjaxComQuery='';
          ddlSelectedType=''; //branch,Group
          ddlSelectedText=''; // branch Name,Group Name  
          ddlSelectedValue=''; //branch ID,Group ID
          function replaceChars(entry)
          {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder
            while (temp.indexOf(out)>-1) 
            {
                pos= temp.indexOf(out);
                temp = "" + (temp.substring(0, pos) + add + 
                temp.substring((pos + out.length), temp.length));
             }
             return temp;
          }
          function keyVal(obj)
          {
             var Data = obj.split('@');            
             if(ddlSelectedType !='')
                        ddlSelectedType='';                        
             if(ddlSelectedText !='') 
                        ddlSelectedText='';        
             if(ddlSelectedValue !='') 
                        ddlSelectedValue='';
              if(Data[0]!='') 
                        ddlSelectedType=Data[0];
              if(Data[1]!='') 
                        ddlSelectedText=Data[1];
              if(Data[2]!='') 
                        ddlSelectedValue=Data[2];          
          }
          function fillComboOnSelection()
          {
             if(ddlSelectedType == 'BRANCH') 
             {
                var ddlSBrnch=document.getElementById('<%=ddlSelectedBranch.ClientID%>');
                var myoption = document.createElement("option");
                myoption.text = ddlSelectedText;
                myoption.value = ddlSelectedValue;
                ddlSBrnch.options.add(myoption);                       
             } 
             if(ddlSelectedType == 'GROUP') 
             {
                var ddlSGrp=document.getElementById('<%=ddlSelectedGroup.ClientID%>');
                var myoption = document.createElement("option");
                myoption.text = ddlSelectedText;
                myoption.value = ddlSelectedValue;
                ddlSGrp.options.add(myoption);                       
             }   
          }
          function removeFromComboOnSelection(delCmbCat,delIndex)
          {
            if(delCmbCat=='Branch')
            {
                var ddlSBrnch=document.getElementById('<%=ddlSelectedBranch.ClientID%>');               
                var delItem = ddlSBrnch.options[delIndex]; 
                ddlSBrnch.removeChild(delItem);
                if(ddlSBrnch.options.length == 0)
                Hide('divSelectedBranch');
            }
            if(delCmbCat=='Group')
            {
                var ddlSGroup=document.getElementById('<%=ddlSelectedGroup.ClientID%>');               
                var delItem = ddlSGroup.options[delIndex]; 
                ddlSGroup.removeChild(delItem);
                if(ddlSGroup.options.length == 0)
                Hide('divSelectedGroup');
            }
          }  
        function btnAddIDTolist_click()
        {        
            var cmb=document.getElementById('<%=cmbsearch.ClientID%>');        
            var selectedName = document.getElementById('<%=txtSelection.ClientID%>');
            if(selectedName.value != '')
            {
                if(cmb.Value=="Clients" && ddlSelectedType=='CLIENTS')
                    document.getElementById('HiddenField_Client').value=ddlSelectedValue;
                if(cmb.Value=="Branch" && ddlSelectedType=='BRANCH')
                    document.getElementById('HiddenField_Branch').value=ddlSelectedValue;
                if(cmb.Value=="Group" && ddlSelectedType=='GROUP')
                    document.getElementById('HiddenField_Group').value=ddlSelectedValue;    
                var listBox = document.getElementById('<%=SelectionList.ClientID%>');
                var tLength = listBox.length;
                var no = new Option();
                no.value = ddlSelectedValue;
                no.text = selectedName.value;               
                listBox[tLength]=no;                       
                fillComboOnSelection();//============For Add option in Selected Branch /Group DropDownList======          
                var recipient = document.getElementById('<%=txtSelection.ClientID%>');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('<%=txtSelection.ClientID%>');
            s.focus();
            s.select();
        }
        function clientselection()
        {
            var listBoxSubs = document.getElementById('<%=SelectionList.ClientID%>');         
            var cmb=document.getElementById('<%=cmbsearch.ClientID%>');          
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
                CallServer1(sendData,"");
                var j;
                for(j=listBoxSubs.options.length-1;j>=0;j--)
                {
                    listBoxSubs.remove(j);
                }            
                Hide('showFilter');           
            }                 
            else if((document.getElementById('showFilter').style.display=="inline") && (listBoxSubs.length == 0))
            {                
                 alert("Please Select Atleast One "+cmb.value+" Item!!!");
                 if(cmb.value=="Clients")
                 {
                    crbGroupBy.SetValue('C');
                    Hide('divGroupByBranch');
                    Hide('divGroupByGroup');
                    Show('divGroupByClient');
                    crbUser.SetValue('S');                    
                 }
                 else if(cmb.value=="Branch")
                 {
                     crbGroupBy.SetValue('B');
                     Hide('divGroupByClient');
                     Hide('divGroupByGroup');
                     Show('divGroupByBranch');                  
                     crbBranch.SetValue('S');
                 }
                 else if(cmb.value=="Group")
                 {
                    crbGroupBy.SetValue('G');
                    Hide('divGroupByClient');
                    Hide('divGroupByBranch');
                    Show('divGroupByGroup');
                    crbGroup.SetValue('S');                    
                 }
                 Hide('divGenerate');
                 Show('showFilter');     
                 document.getElementById('<%=txtSelection.ClientID%>').focus();
            }
            Show('divGenerate');
        }
        function btnRemoveFromlist_click()
        {            
            var listBox = document.getElementById('<%=SelectionList.ClientID%>');
            var tLength = listBox.length;            
            var arrTbox = new Array();
            var arrLookup = new Array();
            var i;
            var j = 0;
            for (i = 0; i < listBox.options.length; i++) 
            {
                if (listBox.options[i].selected && listBox.options[i].value != "") 
                {
                    //For remove option from Selected Branch /Group DropDownList 
                    var removeCmbType=document.getElementById('<%=cmbsearch.ClientID%>').value;
                    removeFromComboOnSelection(removeCmbType,i); 
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
        // For ISIN
        function ShowISINFilterForm(obj)
        {   
            if(document.getElementById('showFilter').style.display=="inline")
            {                
               clientselection();
               crbISIN.SetSelectedIndex(0);
               Hide('tdtxtIsin');   	
            }
            else
            {
                if(obj=='A')
                {
                    Hide('tdtxtIsin');
                    document.getElementById('<%=txtISIN.ClientID%>').value="";            
                    document.getElementById('<%=txtISIN_hidden.ClientID%>').value="";
                }
                if(obj=='S')
                {
                    var settlement=document.getElementById('<%=txtSettlement.ClientID%>');
                    var settlement_hiden=document.getElementById('txtSettlement_hidden');
                    if(crbSettlement.GetValue()=='S' && settlement_hiden.value=="" )
                    {
                        crbISIN.SetValue('A'); 
                        Hide('tdtxtISIN');                      
                        alert('Please Select a Settlement Item.'); 
                        settlement.focus();                     
                    }
                    else
                    {
                        var fromDate=ChangeDateFormat_CalToDB(dtfrom.GetDate());
                        var toDate=ChangeDateFormat_CalToDB(dtto.GetDate());
                        var clientTypeValue=cCmbClientType.GetValue();
                        var clientHiddenValue=document.getElementById('<%=HiddenField_Client.ClientID%>').value;
                        var isinHiddenValue=document.getElementById('<%=txtISIN_hidden.ClientID%>').value;
                        
                        Show('tdtxtIsin'); 
                        CallServer1("CallAjax-ISIN@"+fromDate+"@"+toDate+"@"+clientTypeValue+"@"+clientHiddenValue+"@"+isinHiddenValue,"");                           
                        document.getElementById('txtISIN').focus();
                    }
                }
            }
        }
        //For Settlement
        function ShowSettlementFilterForm(obj)
        {        
             if(document.getElementById('showFilter').style.display=="inline")
            {                
               clientselection();
               crbSettlement.SetSelectedIndex(0);
               Hide('tdtxtSettlement');   	
            }
            else
            {  
               if(obj=='A')
                {
                    Hide('tdtxtSettlement'); 
                    document.getElementById('txtSettlement').value="";       
                    document.getElementById('txtSettlement_hidden').value="";                                               
                }
                if(obj=='S')
                { 
                     var isin=document.getElementById('<%=txtISIN.ClientID%>');      
                     var isin_hiden=document.getElementById('txtISIN_hidden');
                     if(crbISIN.GetValue()=='S' && isin_hiden.value=="" )
                     {
                        crbSettlement.SetValue('A');
                        Hide('tdtxtSettlement');
                        alert('Please Select an ISIN Item.');                            
                        isin.focus();                    
                     }
                     else
                     {
                        var fromDate=ChangeDateFormat_CalToDB(dtfrom.GetDate());
                        var toDate=ChangeDateFormat_CalToDB(dtto.GetDate());
                        var clientTypeValue=cCmbClientType.GetValue();
                        var clientHiddenValue=document.getElementById('<%=HiddenField_Client.ClientID%>').value;
                        var isinHiddenValue=document.getElementById('<%=txtISIN_hidden.ClientID%>').value;
                                              
                        Show('tdtxtSettlement');
                        CallServer1("CallAjax-Settlement@"+fromDate+"@"+toDate+"@"+clientTypeValue+"@"+clientHiddenValue+"@"+isinHiddenValue,"");                 
                        document.getElementById('txtSettlement').focus();
                     }
                }
            }    
        }       
        //============For Group By============
        function OnGroupBySearchFilter(obj)
        {
            var defaultGenerate=document.getElementById("<%=ddlGenerate.ClientID%>");
            defaultGenerate.options[0].selected=true;
            if(obj=="C")
            {                
                Hide('divGroupByBranch');
                Hide('divGroupByGroup');
                Hide('divSelectedBranch'); 
                var ddlSelBrnch=document.getElementById('<%=ddlSelectedBranch.ClientID%>').options.length;      
                if(ddlSelBrnch!="undefined")
                {
                    if(ddlSelBrnch!="0")
                        Hide('divSelectedBranch');
                }
                var ddlSelGrp=document.getElementById('<%=ddlSelectedGroup.ClientID%>').options.length;      
                if(ddlSelGrp!="undefined")
                {
                    if(ddlSelGrp!="0")
                        Hide('divSelectedGroup');
                }
                Show('divGroupByClient');
                crbUser.SetValue('A');                     
                if(document.getElementById('showFilter').style.display=='inline')
                {                        
                     clientselection();                    
                }
                else
                {               
                     OnClientFilter('A');                     
                }                         
            }
            if(obj=="B")
            {                
                Hide('divGroupByClient');               
                Hide('divGroupByGroup');
                var ddlSelGrp=document.getElementById('<%=ddlSelectedGroup.ClientID%>').options.length;      
                if(ddlSelGrp!="undefined")
                {
                    if(ddlSelGrp!="0")
                        Hide('divSelectedGroup');
                }
                Show('divGroupByBranch');                                
                crbBranch.SetValue('A'); 
                if(document.getElementById('showFilter').style.display=='inline')
                {    
                     clientselection();                    
                }
                else
                {
                    OnBranchFilter('A');       
                }
            }
            if(obj=="G")
            {
                Hide('divGroupByClient');
                Hide('divGroupByBranch');
                var ddlSelBrnch=document.getElementById('<%=ddlSelectedBranch.ClientID%>').options.length;      
                if(ddlSelBrnch!="undefined")
                {
                    if(ddlSelBrnch!=0)
                        Hide('divSelectedBranch');
                }
                if(document.getElementById('showFilter').style.display=='inline')
                {    
                     clientselection();                    
                }
                else
                {                   
                    Show('divGroupByGroup');
                    crbGroup.SetValue('A');                                
                    Hide('divGroupOpt');   
                    var btnHideGroupType = document.getElementById('<%=btnGroupTypehide.ClientID%>');
                    Hide('showFilter');
                    btnHideGroupType.click(); 
                }                                                                 
            } 
        }         
        //=====for client
        function OnClientFilter(obj)
        {
            var ddlGen=document.getElementById("<%=ddlGenerate.ClientID%>");
            if(SessionSelBrnchGrp == undefined)
                defaultGenerate.options[0].selected=true;            
            Hide('divGroupByBranch');        
            Show('divGroupByClient');                        
            if(obj=='A')
            {
                document.getElementById('HiddenField_Client').value = '';
                var OptId=document.getElementById('<%=SelectionList.ClientID%>').options.length;
                if(OptId!="undefined" || OptId!=0)
                        OptId=0;                
                Hide('showFilter');
                var divGenrt=document.getElementById('divGenerate').style.display;
                if(divGenrt=="undefined" || divGenrt=="none")
                    Show('divGenerate');                
                Hide('divSelectedGroup');                   
            }
            else if(obj=='S')
            { 
                document.getElementById('<%=cmbsearch.ClientID%>').value='Clients';                
                document.getElementById('<%=txtSelection.ClientID%>').value="";
                              
                 var isinCont=document.getElementById('tdtxtIsin'); 
                 var settlementCont=document.getElementById('tdtxtSettlement');
                 var isin_hiden=document.getElementById('txtISIN_hidden');
                 var settlement_hiden=document.getElementById('txtSettlement_hidden'); 
                 if((isinCont.style.display=='inline') || (settlementCont.style.display=='inline'))
                 {                   
                    if((crbISIN.GetValue()=='S') && (isin_hiden.value==""))
                    {
                        crbUser.SetValue('A');
                        alert('Please Select an ISIN Item.');
                        //isin.focus();                    
                    }
                    else if((crbSettlement.GetValue()=='S') && (settlement_hiden.value==""))
                    {
                        crbUser.SetValue('A');
                        alert('Please Select a Settlement Item.'); 
                        //settlement.focus();                     
                    }
                    else
                    {
                        Show('showFilter');
                        Hide('divGenerate'); 
                        CallServer1("CallAjax-Client","");
                         //document.getElementById('<%=txtSelection.ClientID%>').focus();                          
                    }                          
                }
                else if(document.getElementById('showFilter').style.display=='inline')
                { 
                     clientselection();
                }
                else
                {
                    Show('showFilter');
                    Hide('divGenerate'); 
                    CallServer1("CallAjax-Client",""); 
                     //document.getElementById('<%=txtSelection.ClientID%>').focus();                      
                }                
            }
         }
        //=============For Branch        
       function OnBranchFilter(obj)
       {   
            var defaultGenerate=document.getElementById("<%=ddlGenerate.ClientID%>");
            defaultGenerate.options[0].selected=true;
            var ddlSelBrnch=document.getElementById('<%=ddlSelectedBranch.ClientID%>')
            //ddlSelBrnch.options.length=0;                      
            Hide('divGroupByClient');
            Show('divGroupByBranch');                        
            if(obj=='A')
            {
                document.getElementById('HiddenField_Branch').value = '';
                var OptId=document.getElementById('<%=SelectionList.ClientID%>').options.length;
                if(OptId!="undefined" || OptId!=0)
                        OptId=0;                
                Hide('showFilter');
                var divGenrt=document.getElementById('divGenerate').style.display;
                if(divGenrt=="undefined" || divGenrt=="none")
                       Show('divGenerate');                
                Hide('divSelectedGroup'); 
                Hide('divSelectedBranch');                                                                    
            }
             else if(obj=='S')
            {   
                 var isinCont=document.getElementById('tdtxtIsin'); 
                 var settlementCont=document.getElementById('tdtxtSettlement');
                 var isin_hiden=document.getElementById('txtISIN_hidden');
                 var settlement_hiden=document.getElementById('txtSettlement_hidden'); 
                 if((isinCont.style.display=='inline') || (settlementCont.style.display=='inline'))
                 {    
                    if((crbISIN.GetValue()=='S') && (isin_hiden.value==""))
                    {
                         crbBranch.SetValue('A');
                        alert('Please Select an ISIN Item.');                                          
                    }
                    else if((crbSettlement.GetValue()=='S') && (settlement_hiden.value==""))
                    {
                        crbBranch.SetValue('A');
                        alert('Please Select a Settlement Item.');                                    
                    }
                    else
                    {
                        crbBranch.SetValue('S');
                        document.getElementById('<%=cmbsearch.ClientID%>').value='Branch';
                        document.getElementById('<%=txtSelection.ClientID%>').value="";
                        Show('showFilter');
                        Hide('divGenerate');
                        CallServer1("CallAjax-Branch","");                       
                    }                           
                }
                else if(document.getElementById('showFilter').style.display=='inline')
                { 
                     clientselection();
                }
                else
                {
                    document.getElementById('<%=cmbsearch.ClientID%>').value='Branch';
                    document.getElementById('<%=txtSelection.ClientID%>').value="";
                    Show('showFilter');
                    Hide('divGenerate');
                    CallServer1("CallAjax-Branch","");
                    //document.getElementById('<%=txtSelection.ClientID%>').focus(); 
                }               
            }
        }
        //============For Group Type      
        function OnGroupTypeFilter(obj)
        {        
           if(obj=="0")
           {
               Hide('divGroupOpt');
               alert('Please Select A Group Type!!!');               
           }
           else
           {
                if(document.getElementById('showFilter').style.display=='inline')
                {                     
                     clientselection();
                }
                else
                {
                    Show('divGroupOpt');        
                    crbGroup.SetValue('A');
                    OnGroupFilter('A'); 
                }
           }
        }        
        //============For group Opt
        function OnGroupFilter(obj)
        { 
            var defaultGenerate=document.getElementById("<%=ddlGenerate.ClientID%>");
            defaultGenerate.options[0].selected=true;
            var ddlSelGrp=document.getElementById('<%=ddlSelectedGroup.ClientID%>')
            ddlSelGrp.options.length=0;
            if(obj=='A')
            {
                document.getElementById('HiddenField_Group').value = '';
                Hide('showFilter');
                var divGenrt=document.getElementById('divGenerate').style.display;
                if(divGenrt=="undefined" || divGenrt=="none")
                     Show('divGenerate');                
                Hide('divSelectedGroup');        
            }
            else if(obj=='S')
            {
                 var isinCont=document.getElementById('tdtxtIsin'); 
                 var settlementCont=document.getElementById('tdtxtSettlement');
                 var isin_hiden=document.getElementById('txtISIN_hidden');
                 var settlement_hiden=document.getElementById('txtSettlement_hidden'); 
                 if((isinCont.style.display=='inline') || (settlementCont.style.display=='inline'))
                 {     
                    if((crbISIN.GetValue()=='S') && (isin_hiden.value==""))
                    {
                        crbGroup.SetValue('A');
                        // alert('Group');
                        alert('Please Select an ISIN Item.');
                      //isin.focus();              
                    }
                    else if((crbSettlement.GetValue()=='S') && (settlement_hiden.value==""))
                    {
                        crbGroup.SetValue('A');
                        alert('Please Select a Settlement Item.'); 
                        //settlement.focus();                     
                    }
                    else
                    {
                        document.getElementById('<%=cmbsearch.ClientID%>').value='Group';
                        document.getElementById('<%=txtSelection.ClientID%>').value="";
                        document.getElementById('<%=SelectionList.ClientID%>').options.length=0;
                        Hide('divGenerate');            
                        Show('showFilter');  
                        CallServer1("CallAjax-Group","");
                        //document.getElementById('<%=txtSelection.ClientID%>').focus(); 
                    }                                             
                }                
                else if(document.getElementById('showFilter').style.display=='inline')
                {                     
                     clientselection();
                }
                else
                {
                    document.getElementById('<%=cmbsearch.ClientID%>').value='Group';
                    document.getElementById('<%=txtSelection.ClientID%>').value="";
                    document.getElementById('<%=SelectionList.ClientID%>').options.length=0;
                    Hide('divGenerate');            
                    Show('showFilter');  
                    CallServer1("CallAjax-Group","");
                    //document.getElementById('<%=txtSelection.ClientID%>').focus(); 
                }               
            }
        }   
        function ErrorOngroupType()
        {
            alert("Please Select A Group Type");
        }    
    </script>

    <%--JavaSxcript for Call Generic Ajax with Call Server--%>
    <script type="text/javascript">
      function ReceiveSvrData(rValue)
        {
            var Data=rValue.split('~');
            var btnHideGroupType=document.getElementById('btnGroupTypehide');
            if(Data[1]!="undefined")
            {
                if(Data[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = Data[1];
                }
                if(Data[0]=='Branch')
                {
                    document.getElementById('HiddenField_Branch').value = Data[1];
                }
                if(Data[0]=='Group')
                { 
                    document.getElementById('HiddenField_Group').value = Data[1];
                    //alert('HiddenField_Group-'+document.getElementById('HiddenField_Group').value+'='+Data[1]);
                }
            } 
            if(Data[0]=='AjaxQuery')
            {                
                AjaxComQuery = Data[1];
                if(string_contains(AjaxComQuery,'ISINName')==true)
                {
                    var AjaxList_ISINTextBox=document.getElementById('<%=txtISIN.ClientID%>');                          
                    AjaxList_ISINTextBox.value='';
                    AjaxList_ISINTextBox.attachEvent('onkeyup',CallGenericAjaxJS);
                }
                else  if(string_contains(AjaxComQuery,'SettlementName')==true)
                {
                    var AjaxList_SettlementTextBox=document.getElementById('<%=txtSettlement.ClientID%>');                          
                    AjaxList_SettlementTextBox.value='';
                    AjaxList_SettlementTextBox.attachEvent('onkeyup',CallGenericAjaxJS);
                }
                else 
                {
                    var AjaxList_TextBox=document.getElementById('<%=txtSelection.ClientID%>');                          
                    AjaxList_TextBox.value='';
                    AjaxList_TextBox.attachEvent('onkeyup',CallGenericAjaxJS);
                }    
             }                
        }        
        function string_contains(containerString, matchBySubString)
        {
            if(containerString.indexOf(matchBySubString) == -1)
            {
                return false;
            }
            else
            {
                return true;
            }
        } 
        //=================For ajax to fill text boxes after page Load and with ICallbackEventHandler Interface==================
        function CallGenericAjaxJS(e)
        {
            if(string_contains(AjaxComQuery,'ISINName')==true)
            {                
                var AjaxList_ISINTextBox=document.getElementById('<%=txtISIN.ClientID%>');                          
                AjaxList_ISINTextBox.focus();                
                AjaxComQuery=AjaxComQuery.replace("\'","'");
               
                ajax_showOptions(AjaxList_ISINTextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');
            }
            else  if(string_contains(AjaxComQuery,'SettlementName')==true)
            {
                var AjaxList_SettlementTextBox=document.getElementById('<%=txtSettlement.ClientID%>');                          
                AjaxList_SettlementTextBox.focus();                
                AjaxComQuery=AjaxComQuery.replace("\'","'");
                ajax_showOptions(AjaxList_SettlementTextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');
            }
            else
            {
                var AjaxList_TextBox=document.getElementById('<%=txtSelection.ClientID%>');
                AjaxList_TextBox.focus();
                AjaxComQuery=AjaxComQuery.replace("\'","'");
                ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');
            }
        }
        //=================For ajax to fill text boxes on page Load==================
        function CallAjax(obj1,obj2,obj3,Query)
        {
            var CombinedQuery=new String(Query);
            ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
        }
      function IsValidateSearch()
      {
            var sFromDate= dtfrom.GetDate();     
            var sToDate=dtto.GetValue();                      
            if(sFromDate==null)
            {
                alert("Please Select From Date");
                dtfrom.Focus();
                return false;                       
            }
            if(sToDate==null)
            {
                alert("Please Select To Date");
                dtto.Focus();
                return false;                       
            }
            return true;
      }
      function ddlGenerate_OnChange()
       {       
          if(IsValidateSearch())
          {                
                var ddlGenert=document.getElementById("<%=ddlGenerate.ClientID%>");  
                var ddlGenertValue = document.getElementById("<%=ddlGenerate.ClientID%>").value;
                document.getElementById("hdnGenerateValue").value= ddlGenertValue;                
                if(ddlGenertValue!="Generate") 
                {
                   document.getElementById('btnShowGenerate').click();
                   if((ddlGenertValue=="E")||(ddlGenertValue=="P"))
                   {
                        Hide('showFilter');                                      
                        Hide('divShowMainFilter'); 
                        Show('divPageFilter');                       
                        Hide('divSelectedBranch');
                        Hide('divSelectedGroup');
                        Hide('divClientDetl');
                   }
                   else if(ddlGenertValue=="M")
                   {
                        document.getElementById('txtISIN_hidden').value=="";
                        document.getElementById('txtSettlement_hidden').value=="";
                        document.getElementById('HiddenField_Client').value == "" ; 
                        Hide('showFilter');            
                        Show('divPageFilter'); 
                        Hide('divShowMainFilter');
                        Hide('divSelectedBranch');
                        Hide('divSelectedGroup');
                        Hide('divClientDetl');
                   }
                   else
                   {
                  
                        Hide('showFilter');            
                        Hide('divPageFilter'); 
                        Show('divShowMainFilter');                          
                        Show('divGenerate');                    
                        Hide('divSelectedBranch');
                        Hide('divSelectedGroup');
                        Show('td_show');                      
                   }                     
                }    
          }
       }
      function MailsendT()
      {
        alert("Mail Sent Successfully");
      }
      function MailsendF()
      {
         alert("Error on sending!Try again..");
      }          
    </script>

</head>
<body style="margin: 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager runat="server" ID="ScriptManager1">
        </asp:ScriptManager>
        <div>
            <div class="TableMain100">
                <div class="EHEADER" style="text-align: center;">
                    <div id="divShowMainFilter" class="right" style="width: 10%; display:none;">
                        <input id="Button1" type="button" value="Show Main Filter" class="btnUpdate" onclick="javascript:ShowMainFilter();"
                            style="width: 100px; height: 19px" />
                    </div>                    
                    <strong><span style="color: #000099">CDSL Transaction Report</span></strong>
                </div>
            </div>
            <div class="pageContent">
                <div id="divPageFilter">
                    <div class="right" style="width: 472px; margin-right: 10px;">
                        <div id="showFilter" class="left frmContent" style="display: none;">
                            <div style="width: 100%">
                                <div class="frmleftContent">
                                    <asp:TextBox ID="txtSelection" runat="server" Font-Size="12px" Height="20px" Width="270px"
                                        TabIndex="0"></asp:TextBox>
                                </div>
                                <div class="frmleftContent" style="padding-top: 3px">
                                    <asp:DropDownList ID="cmbsearch" runat="server" Font-Size="13px" Width="110px" Enabled="false">
                                        <asp:ListItem>Clients</asp:ListItem>
                                        <asp:ListItem>Branch</asp:ListItem>
                                        <asp:ListItem>Group</asp:ListItem>
                                    </asp:DropDownList></div>
                                <div class="frmleftContent">
                                    <a id="A3" href="javascript:void(0);" tabindex="0" onclick="btnAddIDTolist_click()">
                                        <span style="color: #009900; text-decoration: underline; font-size: 10pt; line-height: 2;">
                                            Add to List</span></a>
                                </div>
                            </div>
                            <span class="clear" style="background-color: #B7CEEC;"></span>
                            <div class="frmleftContent" style="height: 105px; margin-top: 5px">
                                <asp:ListBox ID="SelectionList" runat="server" Font-Size="12px" Height="100px" Width="450px"
                                    TabIndex="0"></asp:ListBox>
                            </div>
                            <span class="clear" style="background-color: #B7CEEC;"></span>
                            <div class="frmleftContent" style="text-align: center">
                                <a id="AA2" href="javascript:void(0);" tabindex="0" onclick="clientselection()"><span
                                    style="color: #000099; text-decoration: underline; font-size: 10pt; line-height: 2;">
                                    Done</span></a>&nbsp;&nbsp; <a id="AA1" href="javascript:void(0);" tabindex="0" onclick="btnRemoveFromlist_click()">
                                        <span style="color: #cc3300; text-decoration: underline; font-size: 10pt; line-height: 2;">
                                            Remove</span></a>
                            </div>
                        </div>
                    </div>
                    <div id="dvMainFilter" class="frmContent" style="width: 500px;">
                        <div style="height: 5px">
                        </div>
                        <div id="forDate">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                            </div>
                            <div class="left">
                                <div class="frmleftContent">
                                    <dxe:ASPxDateEdit ID="dtfrom" runat="server" ClientInstanceName="dtfrom" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="125px"
                                        Height="25px" Font-Size="11px" AllowNull="False" TabIndex="0">
                                        <DropDownButton Text="From">
                                        </DropDownButton>
                                        <ClientSideEvents DateChanged="function(s,e){DateCompare(dtfrom,dtto);}"></ClientSideEvents>
                                    </dxe:ASPxDateEdit>
                                </div>
                                <div class="frmleftContent">
                                    <dxe:ASPxDateEdit ID="dtto" runat="server" ClientInstanceName="dtto" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="125px"
                                        Height="25px" Font-Size="11px" AllowNull="False" TabIndex="0">
                                        <DropDownButton Text="To">
                                        </DropDownButton>
                                        <ClientSideEvents DateChanged="function(s,e){DateCompare(dtfrom,dtto);}"></ClientSideEvents>
                                    </dxe:ASPxDateEdit>
                                </div>
                            </div>
                        </div>
                        <span class="clear"></span>
                        <div id="divClntType">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="lblClntType" runat="server" Text="Client Type : "></asp:Label>
                            </div>
                            <div class="frmleftContent">
                                <dxe:ASPxComboBox ID="CmbClientType" Width="160px" runat="server" Font-Size="13px"
                                    ValueType="System.String" ClientInstanceName="cCmbClientType" Font-Bold="False"
                                    SelectedIndex="0" TabIndex="0">
                                    <Items>
                                        <dxe:ListEditItem Text="All" Value="All"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Clearing Member" Value="Clearing Member"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Corporate" Value="Corporate"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Corporate POA" Value="Corporate POA"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Individual" Value="Individual"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Individual POA" Value="Individual POA"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="NRI" Value="NRI"></dxe:ListEditItem>
                                    </Items>
                                    <ClientSideEvents SelectedIndexChanged="OnClientTypeChanged" />
                                    <Paddings PaddingBottom="0px"></Paddings>
                                </dxe:ASPxComboBox>
                            </div>
                        </div>
                        <span class="clear"></span>
                        <div id="divISIN">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="Label1" runat="server" Text="ISIN : "></asp:Label>
                            </div>
                            <div class="frmleftContent">
                                <dxe:ASPxRadioButtonList ID="rbISIN" runat="server" ClientInstanceName="crbISIN"
                                    SelectedIndex="0" ItemSpacing="10px" RepeatDirection="Horizontal" TextWrap="False"
                                    Font-Size="10px" TabIndex="0">
                                    <Items>
                                        <dxe:ListEditItem Text="All" Value="A" />
                                        <dxe:ListEditItem Text="Specific" Value="S" />
                                    </Items>
                                    <ClientSideEvents ValueChanged="function(s, e) {ShowISINFilterForm(s.GetValue());}" />
                                    <Border BorderWidth="0px" />
                                </dxe:ASPxRadioButtonList>
                            </div>
                            <div id="tdtxtIsin" class="frmleftContent">
                                <asp:TextBox ID="txtISIN" runat="server" Width="190px" Font-Size="11px" TabIndex="0"
                                    Height="20px"></asp:TextBox>
                            </div>
                        </div>
                        <span class="clear"></span>
                        <div id="divSettlementNo">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="Label2" runat="server" Text="Settlement No. : "></asp:Label>
                            </div>
                            <div class="frmleftContent">
                                <dxe:ASPxRadioButtonList ID="rbSettlement" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                    RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px" ClientInstanceName="crbSettlement"
                                    TabIndex="0">
                                    <Items>
                                        <dxe:ListEditItem Text="All" Value="A" />
                                        <dxe:ListEditItem Text="Specific" Value="S" />
                                    </Items>
                                    <ClientSideEvents ValueChanged="function(s, e) {ShowSettlementFilterForm(s.GetValue());}" />
                                    <Border BorderWidth="0px" />
                                </dxe:ASPxRadioButtonList>
                            </div>
                            <div id="tdtxtSettlement" class="frmleftContent">
                                <asp:TextBox ID="txtSettlement" runat="server" Width="190px" Font-Size="11px" Height="20px"
                                    TabIndex="0"></asp:TextBox>
                            </div>
                        </div>
                        <span class="clear"></span>
                        <div id="divGroupBy">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="lblGroupBy" runat="server" Text="Group By : "></asp:Label>
                            </div>
                            <div class="left">
                                <div class="left">
                                    <div class="frmleftContent" style="padding-top: 3px">
                                        <dxe:ASPxRadioButtonList ID="rbGroupBy" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                            RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px" TabIndex="0" ClientInstanceName="crbGroupBy">
                                            <Items>
                                                <dxe:ListEditItem Text="Client" Value="C" />
                                                <dxe:ListEditItem Text="Branch" Value="B" />
                                                <dxe:ListEditItem Text="Group" Value="G" />
                                            </Items>
                                            <ClientSideEvents ValueChanged="function(s, e) {OnGroupBySearchFilter(s.GetValue());}" />
                                            <Border BorderWidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <span class="clear"></span>
                        <div class="left">
                            <div class="left" style="width: 120px;">
                                &nbsp;
                            </div>
                            <div class="left">
                                <div id="divGroupByClient" class="left">
                                    <div class="frmleftContent" style="padding-top: 3px">
                                        <dxe:ASPxRadioButtonList ID="rbUser" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                            RepeatDirection="Horizontal" TextWrap="False" Font-Size="12px" TabIndex="0" ClientInstanceName="crbUser">
                                            <Items>
                                                <dxe:ListEditItem Text="All C" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />
                                            </Items>
                                            <ClientSideEvents ValueChanged="function(s, e) {OnClientFilter(s.GetValue());}" />
                                            <Border BorderWidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                                <span class="clear"></span>
                                <div id="divGroupByBranch" class="left">
                                    <div class="frmleftContent" style="padding-top: 3px">
                                        <dxe:ASPxRadioButtonList ID="rbBranch" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                            RepeatDirection="Horizontal" TextWrap="False" Font-Size="12px" TabIndex="0" ClientInstanceName="crbBranch">
                                            <Items>
                                                <dxe:ListEditItem Text="All B" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />
                                            </Items>
                                            <ClientSideEvents ValueChanged="function(s, e) {OnBranchFilter(s.GetValue());}" />
                                            <Border BorderWidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                                <span class="clear"></span>
                                <div id="divGroupByGroup" class="left">
                                    <div class="left">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="frmleftContent" style="line-height: 1px">
                                                    <asp:DropDownList ID="ddlGroupType" runat="server" Width="200px" Font-Size="13px"
                                                        TabIndex="0" onchange="OnGroupTypeFilter(this.value)" AutoPostBack="true" OnSelectedIndexChanged="ddlGroupType_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnGroupTypehide" EventName="Click"></asp:AsyncPostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div id="divGroupOpt" class="frmleftContent">
                                        <dxe:ASPxRadioButtonList ID="rbGroup" runat="server" SelectedIndex="1" ItemSpacing="10px"
                                            TabIndex="0" RepeatDirection="Horizontal" TextWrap="False" Font-Size="12px" ClientInstanceName="crbGroup">
                                            <Items>
                                                <dxe:ListEditItem Text="All G" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />
                                            </Items>
                                            <ClientSideEvents ValueChanged="function(s, e) {OnGroupFilter(s.GetValue());}" />
                                            <Border BorderWidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                                <div style="height: 8px">
                                    &nbsp;
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="divGenerate" class="left frmContent" style="width: 500px; margin-top: 7px;">
                    <div id="td_show" class="frmleftContent" style="padding-top: 5px;">
                        <asp:DropDownList ID="ddlGenerate" runat="server" onchange="ddlGenerate_OnChange()"
                            Width="120px" Font-Size="12" TabIndex="0">
                            <asp:ListItem Value="A" Selected="True" >Generate</asp:ListItem>
                            <asp:ListItem Value="S">Screen</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                            <asp:ListItem Value="M">Sent EMail</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div id="divSelectedBranch" class="left" style="line-height: 2;">
                        <div class="frmleftContent" style="width: 110px; line-height: 20px">
                            <asp:Label ID="Label3" runat="server" Text="For A Branch : "></asp:Label>
                        </div>
                        <div class="frmleftContent">
                            <asp:DropDownList ID="ddlSelectedBranch" runat="server" Width="200px" Font-Size="12px"
                                OnSelectedIndexChanged="ddlSelectedBranch_SelectedIndexChanged" AutoPostBack="true"
                                TabIndex="0">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div id="divSelectedGroup" class="left" style="line-height: 2;">
                        <div class="frmleftContent" style="width: 110px; line-height: 20px">
                            <asp:Label ID="Label4" runat="server" Text="For A Group : "></asp:Label>
                        </div>
                        <div class="frmleftContent">
                            <asp:DropDownList ID="ddlSelectedGroup" runat="server" Width="200px" Font-Size="12px"
                                OnSelectedIndexChanged="ddlSelectedGroup_SelectedIndexChanged" AutoPostBack="true"
                                TabIndex="0">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div id="divClientDetl" style="margin-top: 5px; padding: 0px; width: 99%">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                           <span style="color: red; padding-top: 20px; text-align: center;" id="norecord" class="Ecoheadtxt"
                                runat="server">
                                <center>
                                    <strong>No Transaction Found</strong></center>
                            </span>        
                            <table id="tblpage" cellspacing="0" cellpadding="0" runat="server">
                                <tbody>
                                    <tr>
                                        <td>
                                            &nbsp;
                                            <asp:LinkButton ID="ASPxFirst" runat="server" Font-Bold="True" ForeColor="Blue" OnClick="btnFirst"
                                                OnClientClick="javascript:selecttion();">First</asp:LinkButton>
                                        </td>
                                        <td>
                                            &nbsp;
                                            <asp:LinkButton ID="ASPxPrevious" runat="server" Font-Bold="True" ForeColor="Blue"
                                                OnClick="btnPrevious" OnClientClick="javascript:selecttion();">Previous</asp:LinkButton>
                                        </td>
                                        <td>
                                            &nbsp;
                                            <asp:LinkButton ID="ASPxNext" runat="server" Font-Bold="True" ForeColor="Blue" OnClick="btnNext"
                                                OnClientClick="javascript:selecttion();">Next</asp:LinkButton>
                                        </td>
                                        <td>
                                            &nbsp;
                                            <asp:LinkButton ID="ASPxLast" runat="server" Font-Bold="True" ForeColor="Blue" OnClick="btnLast"
                                                OnClientClick="javascript:selecttion();">Last</asp:LinkButton>
                                        </td>
                                        <td align="center" width="600">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                            <asp:Label ID="listRecord" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="background-color: white" id="list" bordercolor="blue" cellspacing="0"
                                cellpadding="0" width="100%" border="1" runat="server">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table cellspacing="0" cellpadding="0" width="100%">
                                                <tbody>
                                                    <tr style="font-size: 12px; font-family: Calibri">
                                                        <td>
                                                            Client Id :
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblClientId" runat="server" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td>
                                                            Category:
                                                        </td>
                                                        <td colspan="3">
                                                            <asp:Label ID="category" runat="server" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td>
                                                            Status:
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="status" runat="server" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Name of Holders:
                                                        </td>
                                                        <td colspan="7">
                                                            <asp:Label ID="holders" runat="server" Font-Bold="True"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr id="transRow" runat="server">
                                                        <td style="font-size: 12px; font-family: Calibri">
                                                        </td>
                                                        <td align="right" colspan="7">
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="lblTransction" runat="server" Text="0"></asp:Label>
                                                            of
                                                            <asp:Label ID="lblTotalTransction" runat="server" Text="0"></asp:Label>
                                                            Transactions&nbsp;
                                                            <asp:LinkButton ID="btnTransPrevious" runat="server" Font-Bold="True" ForeColor="Blue"
                                                                OnClick="btnTransPrevious_Click">Previous</asp:LinkButton>&nbsp;
                                                            <asp:LinkButton ID="btnTransnNext" runat="server" Font-Bold="True" ForeColor="Blue"
                                                                OnClick="btnTransnNext_Click">Next</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="9">
                                            <div id="display" runat="server" style="width: 100%">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblTransction1" runat="server" Text="0"></asp:Label>
                                            of
                                            <asp:Label ID="lblTotalTransction1" runat="server" Text="0"></asp:Label>
                                            Transactions&nbsp;
                                            <asp:LinkButton ID="btnTransPrevious1" OnClick="btnTransPrevious_Click" runat="server"
                                                Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:selecttion();">Previous</asp:LinkButton>&nbsp;
                                            <asp:LinkButton ID="btnTransnNext1" OnClick="btnTransnNext_Click" runat="server"
                                                Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:selecttion();">Next</asp:LinkButton>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ASPxFirst" EventName="Click"></asp:AsyncPostBackTrigger>
                            <asp:AsyncPostBackTrigger ControlID="ASPxLast" EventName="Click"></asp:AsyncPostBackTrigger>
                            <asp:AsyncPostBackTrigger ControlID="ASPxNext" EventName="Click"></asp:AsyncPostBackTrigger>
                            <asp:AsyncPostBackTrigger ControlID="ASPxPrevious" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <div style="display: none">
                    <asp:TextBox ID="txtSettlement_hidden" runat="server" Width="14px"></asp:TextBox>
                    <asp:TextBox ID="txtISIN_hidden" runat="server" Width="14px"></asp:TextBox>
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:Button ID="btnGroupTypehide" runat="server" Text="Button" OnClick="btnGroupTypehide_Click" />
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="hdnGenerateValue" runat="server" />
                    <asp:Button ID="btnShowGenerate" runat="server" BackColor="#DDECFE" BorderStyle="None"
                        OnClick="btnShowGenerate_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
