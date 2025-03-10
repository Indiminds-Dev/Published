<%@ page language="C#" autoeventwireup="true" inherits="Admin_DB_CustomQuery, App_Web_8xd1ocvx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>Custom Query Page</title>
    <link href="../../CentralData/CSS/GenericCss.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../CentralData/JSScript/GenericJScript.js"></script>
    <!-- Ajax List Requierd-->
    <link type="text/css" href="../../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <script type="text/javascript" src="../../CentralData/JSScript/GenericAjaxList.js"></script>
    <script type="text/javascript" src="../../CentralData/JSScript/init.js"></script>
    
    <script type="text/javascript">
     //ProtoType
    String.prototype.trim = function() {
        return this.replace(/^\s+|\s+$/g,"");
    }
    String.prototype.ltrim = function() {
        return this.replace(/^\s+/,"");
    }
    String.prototype.rtrim = function() {
        return this.replace(/\s+$/,"");
    }
    FieldName = '';
    AjaxComQuery='';
    var GenericAjaxListAspxPath = '../../Management/ajax_list.aspx';
    function Page_Load()
    {  
       var ddlxport=GetObjectID('<%=ddlExport.ClientID%>');
       ddlxport.selectedIndex=0;      
       Height('300','300');   
    }
    function Reset()
    {
       // GetObjectID('hdn_ExecutedParamValue').value=''; 
       window.location='../DB/CustomQuery.aspx';
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
    </script>

    <script type="text/javascript" language="javascript">
     SetValueGlobal='';
     SelectedExport='';        
     function fn_QueryRemove()
     {                 
        cCbpCustomQuery.PerformCallback("QueryRemove~"+cLstQuery.GetValue());
     }
     function ddlExport_OnChange(ele)
     {
        if(ele=="A")
        {
            alert("Please select Execution");
        }
        else
        {
            SelectedExport=ele;
            if(cMemoQuery.GetText().trim()!='')
               cCbpCustomQuery.PerformCallback("QueryExecute~"+SelectedExport);      
            else      
               alert("Please Enter The Query Value.");   
        }
        //var ddlExport=GetObjectID('<%=ddlExport.ClientID%>');
        //ddlExport.options[0].selected=true;     
     }        
     function fn_QueryReset()
     {
        GetObjectID('hdn_ExecutedParamValue').value='';       
        cMemoDeclareQuery.SetText('');
        cMemoQuery.SetText('');
        ctxtSaveAs.SetText('');
        ccmbSelectOption.SetText('select');
        SetValue('hdn_QueryShortName','');
        var ddlxport=GetObjectID('<%=ddlExport.ClientID%>');
        ddlxport.selectedIndex=0;      
     }     
     function CbpCustomQuery_EndCallBack()
     {        
        if(cCbpCustomQuery.cpQueryExist!=undefined)
        {        
            alert(cCbpCustomQuery.cpQueryExist);
            cPopUp_QuerySaveAs.Hide();            
        }
        if(cCbpCustomQuery.cpAfterSaveQueryList!=undefined)
        {
            if(cCbpCustomQuery.cpAfterSaveQueryList=="T")
            {
                ctxtSaveAs.SetEnabled(false);              
                if(cCbpCustomQuery.cpQueryShortName!=undefined)
                    SetValue('hdn_QueryShortName',cCbpCustomQuery.cpQueryShortName);
                cCbpCustomQuery.PerformCallback("QueryBindList~");  
            }
        }
        if(cCbpCustomQuery.cpSaveAsResult!=undefined)
        { 
            fn_QueryReset();              
            if(string_contains(cCbpCustomQuery.cpSaveAsResult,'Query Added Successfully')==true)
            {
               alert(cCbpCustomQuery.cpSaveAsResult);          
               window.location='../DB/CustomQuery.aspx';//cCbpCustomQuery.PerformCallback("QueryBindList~");  
            }
            else 
                alert(cCbpCustomQuery.cpSaveAsResult);          
        }
        
        if(cCbpCustomQuery.cpUpdateAsResult!=undefined)
        { 
            fn_QueryReset();              
            if(string_contains(cCbpCustomQuery.cpUpdateAsResult,'Query Updated Successfully')==true)
            {
                alert(cCbpCustomQuery.cpUpdateAsResult);    
                window.location='../DB/CustomQuery.aspx';//cCbpCustomQuery.PerformCallback("QueryBindList~");
            }
                 
            else 
                alert(cCbpCustomQuery.cpUpdateAsResult);          
        }        
        if(cCbpCustomQuery.cpSaveCustomQuery!=undefined)
        { 
           alert(cCbpCustomQuery.cpSaveCustomQuery);          
        }        
        if(cCbpCustomQuery.cpRemoveAsResult!=undefined)
        { 
            fn_QueryReset();              
            if(string_contains(cCbpCustomQuery.cpRemoveAsResult,'Query Removed Successfully')==true)
            {
               alert(cCbpCustomQuery.cpRemoveAsResult);          
               window.location='../DB/CustomQuery.aspx';//cCbpCustomQuery.PerformCallback("QueryBindList~");  
            }
            else 
                alert(cCbpCustomQuery.cpRemoveAsResult);          
        } 
        if(cCbpCustomQuery.cpShowExecPop!=undefined)
        {
            var ShowExecPop=cCbpCustomQuery.cpShowExecPop.split('#')[0];
            var xportTo=cCbpCustomQuery.cpShowExecPop.split('#')[1];
            if(ShowExecPop=="ST")
            {           
                fn_DynamicDiv();                
                if(cCbpCustomQuery.cpSetCustomQueryValue!=undefined)
                {                   
                    var dtSetValue=cCbpCustomQuery.cpSetCustomQueryValue;                    
                    dtSetValue=dtSetValue.replaceAll("'",""); 
                    SetValueGlobal=dtSetValue;                    
                    var dtSetValueArray=dtSetValue.split('^');
                    for(var p=0;p<dtSetValueArray.length;p++)
                    {
                       var itemPValue=dtSetValueArray[p];
                       var itemValues=itemPValue.split('=');                        
                       var setPValue=  itemValues[1];
                       if(setPValue!=undefined)
                       {                       
                          if(setPValue!="NullValue")                         
                             SetValue('itemTxtValue'+p, setPValue); 
                          else
                          {
                              if(GetObjectID('itemChk'+p).checked=true)
                                 GetObjectID('itemTxtValue'+p).style.display='none';
                          }
                       }                               
                    }            
                }                            
                cPopup_ExecQuery.Show();                            
            }
            else if(ShowExecPop=="FF")
            {
                GetObjectID('hdn_ExecutedParamValue').value="WithoutDeclare";
                if(xportTo=='CSV')
                    GetObjectID('btnCSVExport').click();
                else if (xportTo == 'Excel')
                    GetObjectID('btnExcelExport').click();
                else
                    GetObjectID('btnPDFExport').click(); 
                cPopup_ExecQuery.Hide();       
            }
            else 
                alert("Parameter Is Not Start With '@' in Declare Section!!!");   
                var ddlxport=GetObjectID('<%=ddlExport.ClientID%>');
                ddlxport.selectedIndex=0;  
                      
        }
        if(cCbpCustomQuery.cpQueryExecuteInsUp!=undefined)
        {
            cPopup_ExecQuery.Hide(); 
            var ddlxport=GetObjectID('<%=ddlExport.ClientID%>');
            ddlxport.selectedIndex=0;  
            var exportto= cCbpCustomQuery.cpQueryExecuteInsUp.split('#')[1];
            if(exportto=='CSV')
                GetObjectID('btnCSVExport').click();
            else if (exportto == 'Excel')
                GetObjectID('btnExcelExport').click();
            else 
                GetObjectID('btnPDFExport').click();     
                          
        } 
        if(cCbpCustomQuery.cpAddValues!=undefined)
        {
            var param=cCbpCustomQuery.cpAddValues.split('~');
            var WhichCall=param[0];
            
            if(WhichCall=="T") 
            {
                alert("Successfully Added");
                SetValue(param[1],'');
                SetValue(param[2],'');
                grid.PerformCallback("BindValues~");
            }
            if(WhichCall=="F") alert("Failed To Add!!!");
            if(WhichCall=="E") alert("Combination Already Exists!!!");
            if(WhichCall=="SU") alert("Successfully Updated.");
            if(WhichCall=="FU") alert("Failed To Update!!!");
        }
        if(cCbpCustomQuery.cpAjaxQuery!=undefined)
        {
            var param=cCbpCustomQuery.cpAjaxQuery.split('@');
            if(param[0]=="FindValues")
            {
                AjaxComQuery=param[1];
                var AjaxList_TextBox=document.getElementById('Popup_Find_txtFindAjaxList'); 
                AjaxList_TextBox.attachEvent('onkeyup',AjaxFindValue);
            }
        }
     }
     function AjaxFindValue(e)
     {
        var AjaxList_TextBox=document.getElementById('Popup_Find_txtFindAjaxList');  
        AjaxComQuery=AjaxComQuery.replace("\'","'");
        ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main',GenericAjaxListAspxPath);
     } 
     function CallAjax(obj1,obj2,obj3,Query)
     {
        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
     }
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
     
     function fn_btnSaveAs()
     {     
         var txt=ccmbSelectOption.GetText();        
         if(txt=='select')
         {
            alert('please Select Proper Option');
         }
         else
         {     
             var cmbId=ccmbSelectOption.GetValue();
//           alert(cmbId);                  
            if(cmbId=='3')
            {           
                if(ctxtSaveAs.GetValue()!=null)
                {
                    var ans = confirm ('Record will be Deleted!Do you want to proceed?');
                    if(ans==true)
                    {
                        cCbpCustomQuery.PerformCallback("QueryRemove~"+cLstQuery.GetValue());
                    } 
                }
                else
                    alert("Please Enter The SaveAs Value.")   
            }
            if(cmbId=='2')
            {               
                if(ctxtSaveAs.GetValue()==null)
                {
                    alert("Please Enter The SaveAs Value.");   
                }
                else if(cMemoQuery.GetValue()==null)
                {
                    alert("Please Enter The Query Value.");   
                }
                else if(ctxtSaveAs.GetValue()!=null)
                {
                    var ans = confirm ('Record will be Updated!Do you want to proceed?');
                    if(ans==true)
                    {                
                        cCbpCustomQuery.PerformCallback("QueryUpdateAs~"+ctxtSaveAs.GetValue());
                    }
                }
                else
                    alert("Please Enter The SaveAs Value.")   
            }
            if(cmbId=='1')
            {              
                if(ctxtSaveAs.GetValue()==null)
                {
                    alert("Please Enter The SaveAs Value.");   
                }
                else if(cMemoQuery.GetValue()==null)
                {
                    alert("Please Enter The Query Value.");   
                }
                else if(ctxtSaveAs.GetValue()!=null)
                { 
                    var ans = confirm ('Record will be Saved!Do you want to proceed?');
                    if(ans==true)
                    {
                        cCbpCustomQuery.PerformCallback("QuerySaveAs~"+ctxtSaveAs.GetValue());
                    }
                }    
            }            
         }   
     }
     function fn_btnSaveAsCancel()
     {     
        cPopUp_QuerySaveAs.Hide();
     }
     function fn_QueryListIndexChange(ele)
     {
       if(ele!=undefined)
       {
           SetValue('hdnQueryListId',ele);
           cCbpCustomQuery.PerformCallback("QueryList~"+ele);       
       }            
     }
     function fn_ComboIndexChange(s,e)
     {     
        if(s.GetValue()==1)
        {
            ctxtSaveAs.SetEnabled(true);
            cbtnSaveAs.SetText('Save');
        }
        else if(s.GetValue()==2)
        {
            ctxtSaveAs.SetEnabled(false);
            cbtnSaveAs.SetText('Save');
        }
        else if(s.GetValue()==3)
        {
            ctxtSaveAs.SetEnabled(false);
            cbtnSaveAs.SetText('Remove');        
        }     
     }      
     function GetExecuteParamValue()
     {
        var paramList;
        var objParamField;
        var objValueField;
        var itemParams=cMemoDeclareQuery.GetValue();        
        var ParamsArray=itemParams.split(','); 
        for(var i=0;i<ParamsArray.length;i++)
        {
            objParamField=GetObjectID('divLabelParam'+i).innerHTML;
            if(GetObjectID('itemChk'+i).checked!=true)  //"checked"
            {
                if(GetObjectID('itemTxtValue'+i).value!='')
                {
                    objValueField=(GetObjectID('itemTxtValue'+i).value).replace("'","");
                    objValueField=objValueField.replaceAll("'","");                   
                }
                else
                {
                    alert('Query Expects Value For Parameter '+objParamField);
                    break;
                }    
            }
            else 
            {    
                objValueField='NullValue';
            }         
            if(paramList==undefined)
            {
                paramList=objParamField+"='"+objValueField+"'";
            }
            else            
            {
                paramList=paramList+'^'+objParamField+"='"+objValueField+"'";
            }           
        }        
        return paramList; 
     }
     function fn_btnExecOK()
     {        
        var paramValues=GetExecuteParamValue(); 
        paramValues=paramValues;
        var paramdbValues='';
        if(SetValueGlobal!=undefined)
             paramdbValues= SetValueGlobal;
        
        if(paramValues!=undefined)
        {
            GetObjectID('hdn_ExecutedParamValue').value=paramValues; 
            if(paramdbValues!=undefined && paramdbValues!='')
            {
                var strParamVal=paramValues.replaceAll("'","");
                if(strParamVal!=paramdbValues)
                {                   
                    GetObjectID('divSaveSetQuery').innerHTML='Want To Save'+ctxtSaveAs.GetText()+' Query\'s Changed Set Value?';
                    cPopup_SaveSetQuery.Show(); 
                }
                else
                {
                        cPopup_ExecQuery.Hide();  
                        //alert(GetObjectID('<%=ddlExport.ClientID %>').value);                    
                        //if(GetObjectID('<%=ddlExport.ClientID %>').value=="CSV")
                        if(SelectedExport=="CSV")
                            GetObjectID('btnCSVExport').click();                 
                        else if (SelectedExport=="Excel") 
                            GetObjectID('btnExcelExport').click();   
                        else  
                            GetObjectID('btnPDFExport').click();                                       
                }
            }
            else
            {
                if(ctxtSaveAs.GetText()!='')
                {
                    GetObjectID('divSaveSetQuery').innerHTML='Want To Save '+ctxtSaveAs.GetText()+' Query\'s Set Value?';
                    cPopup_SaveSetQuery.Show();                    
                }
                else                    
                {    
                    GetObjectID('divSaveSetQuery').innerHTML='Want To Save This New Query?';                    
                    cPopup_SaveSetQuery.Show(); 
                }   
            }            
        }        
     }
     function fn_btnExecCancel()
     {
        cPopup_ExecQuery.Hide();
     }
     function fn_btnSave_QueryValue()
     {
      //alert(GetObjectID('<%=ddlExport.ClientID %>').value);          
      //  var exportTo=GetObjectID('<%=ddlExport.ClientID%>').value;
      alert(SelectedExport);
        if(GetObjectID('divSaveSetQuery').innerHTML=='Want To Save This New Query?')
        {
            cPopup_SaveSetQuery.Hide();
            cPopup_ExecQuery.Hide();
            cCbpCustomQuery.PerformCallback("ParameterList~New~"+SelectedExport);
        }
        else
        {
            cPopup_SaveSetQuery.Hide();
            cPopup_ExecQuery.Hide();
            cCbpCustomQuery.PerformCallback("ParameterList~Saved~"+SelectedExport);
        }        
     }
     function fn_btnCancel_QueryValue()
     {
        cPopup_SaveSetQuery.Hide();
        cPopup_ExecQuery.Hide();
        // alert(GetObjectID('<%=ddlExport.ClientID %>').value);          
        //if(GetObjectID('<%=ddlExport.ClientID %>').value=="CSV")
        if(SelectedExport=="CSV")
            GetObjectID('btnCSVExport').click();
        else if (SelectedExport == "Excel")
            GetObjectID('btnExcelExport').click();
        else if (SelectedExport == "PDF")
            GetObjectID('btnPDFExport').click();
                                
     }  
     function fn_btnFindDone()
     {
         var selectedObj=GetValue('hdn_FindTextBox');
         var findValue=document.getElementById("Popup_Find_txtFindAjaxList").value;
         SetValue(selectedObj,findValue);
         document.getElementById("Popup_Find_txtFindAjaxList").value="";
         cPopup_Find.Hide();
     } 
     function keyVal(obj)
     {
       document.getElementById("Popup_Find_txtFindAjaxList").value=obj;
     }
        
    </script>

    <script type="text/javascript" language="javascript">      
     function GetDynamicTextBox(value,itemname)
     {       
        var itemDiv=document.createElement('DIV');
        itemDiv.id='itemDiv'+value; 
        
        var p=itemname.trim().split(' ');      
        var divLblParam=document.createElement('DIV');
        divLblParam.id='divLabelParam'+value;
        divLblParam.className="left exec_ParamItem";
        divLblParam.innerHTML= p[0];          
        
        var divLblDatatype=document.createElement('DIV');
        divLblDatatype.id='divLabelDatatype'+value;
        divLblDatatype.className="left exec_DataItem";
        divLblDatatype.innerHTML= p[1];          
        
        var divItemChk=document.createElement('DIV');
        divItemChk.className='left exec_NullItem';
        divItemChk.id="divItemCheck";
        divItemChk.setAttribute('padding-left','40px');
        
        var itemCheckBox=document.createElement('input');
        itemCheckBox.setAttribute('type','Checkbox');
        itemCheckBox.id='itemChk'+value;                       
        divItemChk.appendChild(itemCheckBox);

        var divItemTxt=document.createElement('DIV');
        divItemTxt.className='left exec_ValueItem';
        divItemTxt.id="divItemText";
        
        var itemTextBoxValue=document.createElement('input');
        itemTextBoxValue.className='left';
        itemTextBoxValue.setAttribute('type','text');
        itemTextBoxValue.style.width="150px";
        itemTextBoxValue.id='itemTxtValue'+value; 
        divItemTxt.appendChild(itemTextBoxValue);
        
        var divItembtn=document.createElement('DIV');
        divItembtn.className='left exec_btnItem';
        divItembtn.id="divItembtn";
        
        var itembtnBoxValue=document.createElement('input');
        itembtnBoxValue.className='left';
        itembtnBoxValue.setAttribute('type','button');
        itembtnBoxValue.style.width="30px";
        itembtnBoxValue.id='itembtnValue'+value; 
        itembtnBoxValue.value='...';
        divItembtn.appendChild(itembtnBoxValue);
        
        itemDiv.appendChild(divLblParam);     
        itemDiv.appendChild(divLblDatatype);
        itemDiv.appendChild(divItemChk);             
        itemDiv.appendChild(divItemTxt);
        itemDiv.appendChild(divItembtn);
            
        itemCheckBox.onclick = function(event) 
                               {
                                    if (itemCheckBox.checked)
                                        itemTextBoxValue.style.display='none';  
                                    else
                                        itemTextBoxValue.style.display='block';
                                };
        itembtnBoxValue.onclick = function(event) 
                               {
                                    SetValue('hdn_FindTextBox',itemTextBoxValue.id);
                                    cCbpCustomQuery.PerformCallback("BindAjaxParam~"+p[0]);
                                    window.setTimeout(function () {
                                        document.getElementById('Popup_Find_txtFindAjaxList').value='';
                                        document.getElementById('Popup_Find_txtFindAjaxList').focus();
                                    }, 0);
                                    cPopup_Find.Show(event);
                                };                        
        
        return itemDiv;                   
     }
     function fn_DynamicDiv()
     {         
         GetObjectID("TextBoxContainer").innerHTML='';
         var param=cMemoDeclareQuery.GetValue();       
         var param_array=param.split(',');
         var divItemBody=document.createElement('DIV');
         divItemBody.id='ItemBody'; 
         for(var i=0;i < param_array.length;i++)
         {
             var item=param_array[i];
             divItemBody.appendChild(GetDynamicTextBox(i,item));
         }         
         GetObjectID("TextBoxContainer").appendChild(divItemBody);
         Height('350','350'); 
     }
     
     // param value script
     function fn_btnAddParamValue()
     {
        CreateControl_ParamValue();
        grid.PerformCallback("BindValues~");
        cPopup_AddParamValue.Show();
        Height('350','350'); 
     }
     function CreateControl_ParamValue()
     {         
         GetObjectID("DynamicControlParamValue").innerHTML='';
         var param=cMemoDeclareQuery.GetValue();       
         var param_array=param.split(',');
         var divParamBody=document.createElement('DIV');
         divParamBody.id='ParamBody'; 
         for(var i=0;i < param_array.length;i++)
         {
             var item=param_array[i];
             divParamBody.appendChild(GetDynamicControl_ParamValue(i,item));
         }         
         GetObjectID("DynamicControlParamValue").appendChild(divParamBody);
         Height('350','350'); 
     }
     function GetDynamicControl_ParamValue(value,itemname)
     {       
        var paramDiv=document.createElement('DIV');
        paramDiv.id='paramDiv'+value; 
        
        var p=itemname.trim().split(' ');      
        var divLblParam=document.createElement('DIV');
        divLblParam.id='divParamValue'+value;
        divLblParam.className="left exec_ParamItem";
        divLblParam.innerHTML= p[0];          
        
        var divItemTxt=document.createElement('DIV');
        divItemTxt.className='left exec_ValueItem';
        divItemTxt.id="divParam";
        
        var paramTextBoxText=document.createElement('input');
        paramTextBoxText.className='left';
        paramTextBoxText.setAttribute('type','text');
        paramTextBoxText.style.width="150px";
        paramTextBoxText.id='paramTxt'+value; 
        divItemTxt.appendChild(paramTextBoxText);
        
        var divItemTxt1=document.createElement('DIV');
        divItemTxt1.className='left exec_ValueItem';
        divItemTxt1.id="divParam1";
        
        var paramTextBoxValue=document.createElement('input');
        paramTextBoxValue.className='left';
        paramTextBoxValue.setAttribute('type','text');
        paramTextBoxValue.style.width="150px";
        paramTextBoxValue.id='paramValue'+value; 
        divItemTxt1.appendChild(paramTextBoxValue);
        
         var divItembtn=document.createElement('DIV');
        divItembtn.className='left exec_btnItem';
        divItembtn.id="divItembtn";
        
        var parambtnBoxValue=document.createElement('input');
        parambtnBoxValue.className='left';
        parambtnBoxValue.setAttribute('type','button');
        parambtnBoxValue.style.width="30px";
        parambtnBoxValue.id='itembtnValue'+value; 
        parambtnBoxValue.value='...';
        divItembtn.appendChild(parambtnBoxValue);
        
        paramDiv.appendChild(divLblParam);     
        paramDiv.appendChild(divItemTxt);
        paramDiv.appendChild(divItemTxt1);
        paramDiv.appendChild(divItembtn);
            
        
        parambtnBoxValue.onclick = function(event) 
                               {
                                    if(paramTextBoxText.value!='' && paramTextBoxValue.value!='')
                                        cCbpCustomQuery.PerformCallback("AddValues~"+paramTextBoxText.value+"~"+paramTextBoxValue.value+"~"+p[0]+'~'+paramTextBoxText.id+'~'+paramTextBoxValue.id);
                                    else
                                        alert("Please Enter Missing Value!!!");
                                };                        
        
        return paramDiv;                   
     }
    </script>

    <style type="text/css">
    #Container1 { width: 877px; padding:5px;}
    #divQueryHistory{width:300px;}
    #divQueryMemo{width:575px;}
    .divQuery_HeaderCont{width: 100px; margin-bottom: 3px; line-height:1.5; text-align: center; color: #000; font-size:14px; border: 1px solid #aaa; background-color: #E6E6E6;}    
    .historyWidth{width:285px; line-height:1.5; text-align:center;}
    .memoHeaderWidth{width:569px;line-height:1.5;} 
    .memoContWidth{width:555px;} 
    .ListItem{border-bottom:1px solid #aaa;}
    
    .exec_HeaderCont{border:1px solid #aaa; border-bottom:none;border-right:none; float:left;padding:2px; background-color:#ccc;}
    .exec_ParamItem{border:1px solid #aaa;border-bottom:none;border-right:none; background-color:#eee; width:200px; height:26px; padding:2px;}
    .exec_DataItem{border:1px solid #aaa; border-bottom:none;border-right:none; background-color:#eee; width:120px; height:26px; padding:2px;}
    .exec_NullItem{border:1px solid #aaa; border-bottom:none;border-right:none; background-color:#eee; width:80px; height:26px; padding:2px;}
    .exec_ValueItem{border:1px solid #aaa; border-bottom:none;border-right:none; background-color:#eee; width:160px; height:26px; padding:2px;} 
    .exec_btnItem{border:1px solid #aaa; border-bottom:none;border-right:none; background-color:#eee; width:30px; height:26px; padding:2px;} 
    </style>
</head>
<body>
    <form id="frm_CustomQuery" runat="server">
        <div id="Header" class="Header">
            Custom Query</div>
        <div id="Gmain">
            <dxcp:ASPxCallbackPanel ID="CbpCustomQuery" runat="server" ClientInstanceName="cCbpCustomQuery"
                OnCallback="CbpCustomQuery_Callback" BackColor="Transparent" Width="100%">
                <PanelCollection>
                    <dxp:panelcontent runat="server">
                        <div id="Row0" class="Row">
                            <div id="Container1" class="container">
                                <div id="divQueryHistory" class="left">
                                    <div class="Lable historyWidth" style="background-color: #E6E6E6; border: 1px solid #aaa;
                                        border-bottom: none;">
                                        Query History List
                                    </div>
                                    <div class="Lable historyWidth" style="height: 153px; border: 1px solid #aaa;">
                                        <dxe:ASPxListBox ID="lstQuery" runat="server" ClientInstanceName="cLstQuery" Width="285px"
                                            ItemStyle-CssClass="ListItem" Height="150px">
                                            <ClientSideEvents SelectedIndexChanged="function (s, e) {fn_QueryListIndexChange(s.GetValue());}" />
                                        </dxe:ASPxListBox>
                                    </div>
                                </div>
                                <div id="divQueryMemo" class="left">
                                    <div class="Lable memoHeaderWidth" style="background-color: #E6E6E6; border: 1px solid #aaa;">
                                        <center>
                                            Query Window</center>
                                    </div>
                                    <div style="border: 1px solid #aaa; border-top: none; padding: 5px;">
                                        <div id="divDeclare" style="margin-bottom: 8px;">
                                            <div>
                                                
                                                    <div class="Lable divQuery_HeaderCont" style="border: 1px solid #aaa;float:left">
                                                        <asp:Label ID="lblQueryDeclare" runat="server">Declare : </asp:Label>
                                                    </div>
                                                    <div id="divAddValue" runat="server" visible="false" style="border: 1px solid #aaa;padding-left:450px;">
                                                        <dxe:ASPxButton ID="btnAddParamValue" runat="server" Width="100px" ClientInstanceName="cbtnAddParamValue" AutoPostBack="False"
                                                            Text="Add Values">
                                                            <ClientSideEvents Click="function (s, e) {fn_btnAddParamValue();}" />
                                                        </dxe:ASPxButton>
                                                    </div>
                                            </div>
                                            <div class="Lable memoContWidth" style="height: 63px; border: 1px solid #aaa;">
                                                <dxe:ASPxMemo ID="MemoDeclareQuery" runat="server" ClientInstanceName="cMemoDeclareQuery"
                                                    HorizontalAlign="left" Width="554px" Height="60px">
                                                </dxe:ASPxMemo>
                                            </div>
                                        </div>
                                        <div id="divQuery" style="margin-bottom: 5px;">
                                            <div class="Lable divQuery_HeaderCont" style="border: 1px solid #aaa;">
                                                <asp:Label ID="lblQuery" runat="server">Query : </asp:Label>
                                            </div>
                                            <div class="Lable memoContWidth" style="height: 153px; border: 1px solid #aaa;">
                                                <dxe:ASPxMemo ID="MemoQuery" runat="server" ClientInstanceName="cMemoQuery" HorizontalAlign="left"
                                                    Width="554px" Height="150px">
                                                </dxe:ASPxMemo>
                                            </div>
                                        </div>
                                        <div style="margin: 5px 0px 10px 0px;">
                                            <div class="left" style="margin-right: 10px;">
                                                <dxe:ASPxComboBox ID="cmbSelectOption" ClientInstanceName="ccmbSelectOption" runat="server"
                                                    Width="80px" Height="25px" ValueType="System.String" AutoPostBack="false" EnableSynchronization="False">
                                                    <Items>
                                                        <dxe:ListEditItem Text="select" />
                                                        <dxe:ListEditItem Text="SaveAs" Value="1" />
                                                        <dxe:ListEditItem Text="Save" Value="2" />
                                                        <dxe:ListEditItem Text="Remove" Value="3" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function (s, e) {fn_ComboIndexChange(s,e);}" />
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="savearea">
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="txtSaveAs" ClientInstanceName="ctxtSaveAs" ClientEnabled="false"
                                                        runat="server" Height="25px">
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxButton ID="btnSaveAs" runat="server" ClientInstanceName="cbtnSaveAs" AutoPostBack="False"
                                                        Text="Save">
                                                        <ClientSideEvents Click="function (s, e) {fn_btnSaveAs();}" />
                                                    </dxe:ASPxButton>
                                                </div>
                                            </div>
                                            <div class="left" style="margin-left: 10px;">
                                                <asp:DropDownList ID="ddlExport" runat="server" Onchange="ddlExport_OnChange(this.value)">
                                                    <asp:ListItem Value="A" Selected="True">Select Execution</asp:ListItem>
                                                    <asp:ListItem Value="CSV">To CSV</asp:ListItem>
                                                    <asp:ListItem Value="Excel">To Excel</asp:ListItem>
                                                     <asp:ListItem Value="PDF">To PDF</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="right">
                                                <dxe:ASPxButton ID="btnReset" AutoPostBack="false" runat="server" Text="Reset">
                                                    <ClientSideEvents Click="function (s, e) {fn_QueryReset();}" />
                                                </dxe:ASPxButton>
                                                <dxe:ASPxLabel ID="lblMessage" runat="server">
                                                </dxe:ASPxLabel>
                                            </div>
                                        </div>
                                        <br />
                                        <div style="margin: 5px 0px 10px 0px; border: 1px;">
                                        </div>
                                        <br class="clear" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dxp:panelcontent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function (s, e) {CbpCustomQuery_EndCallBack();}" />
            </dxcp:ASPxCallbackPanel>
        </div>
        <br class="clear" />
        <dxpc:ASPxPopupControl ID="Popup_SaveSetQuery" runat="server" ClientInstanceName="cPopup_SaveSetQuery"
            Width="300px" HeaderText="Save The Query Value" PopupHorizontalAlign="Center"
            Height="100px" PopupVerticalAlign="Middle" CloseAction="CloseButton" Modal="True">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                    <div id="divSaveSetquery">
                    </div>
                    <br />
                    <br />
                    <div class="left">
                        <dxe:ASPxButton ID="btnSave_QueryValue" runat="server" AutoPostBack="False" Text="Save">
                            <ClientSideEvents Click="function (s, e) {fn_btnSave_QueryValue();}" />
                        </dxe:ASPxButton>
                    </div>
                    <div style="margin-left: 50px;">
                        <dxe:ASPxButton ID="btnCancel_QueryValue" runat="server" AutoPostBack="False" Text="Cancel">
                            <ClientSideEvents Click="function (s, e) {fn_btnCancel_QueryValue();}" />
                        </dxe:ASPxButton>
                    </div>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        <br class="clear" />
        <dxpc:ASPxPopupControl ID="Popup_ExecQuery" runat="server" ClientInstanceName="cPopup_ExecQuery"
            Width="740px" HeaderText="Enter Text To Execute the Query" PopupHorizontalAlign="Center"
            Height="350px" PopupVerticalAlign="Middle" CloseAction="CloseButton" Modal="True">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <div id="divExecQuery" style="padding: 5px; width: 680px; height: 330px; overflow-x: hidden;
                        overflow-y: scroll;">
                        <div id="divExecHeader" style="border-right: 1px solid #aaa; width: 680px;">
                            <div class="exec_HeaderCont" style="width: 200px;">
                                Parameter</div>
                            <div class="exec_HeaderCont" style="width: 120px;">
                                DataType</div>
                            <div class="exec_HeaderCont" style="width: 80px;">
                                Pass Null Value</div>
                            <div class="exec_HeaderCont" style="width: 160px;">
                                Value</div>
                                 <div class="exec_HeaderCont" style="width: 50px;">
                                Find</div>
                        </div>
                        <div id="divExecBody" style="width: 680px;">
                            <div id="TextBoxContainer" style="width: 680px; border-bottom: 1px solid #aaa; border-right: 1px solid #aaa;">
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="right">
                        <div class="left" style="margin-right: 20px;">
                            <dxe:ASPxButton ID="btnExecOK" runat="server" AutoPostBack="False" Text="OK" Width="80px">
                                <ClientSideEvents Click="function (s, e) {fn_btnExecOK();}" />
                            </dxe:ASPxButton>
                        </div>
                        <div style="margin-right: 70px;">
                            <dxe:ASPxButton ID="btnExecCancel" runat="server" AutoPostBack="False" Text="Cancel"
                                Width="80px">
                                <ClientSideEvents Click="function (s, e) {fn_btnExecCancel();}" />
                            </dxe:ASPxButton>
                        </div>
                    </div>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        <dxpc:ASPxPopupControl ID="Popup_Find" runat="server" ClientInstanceName="cPopup_Find"
            Width="320px"  HeaderText="Find Selected Value" PopupHorizontalAlign="WindowCenter"
                PopupVerticalAlign="WindowCenter" Height="100px"  CloseAction="CloseButton" Modal="True" >
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                    <div id="div1">
                        <div id="div2" style="border-right: 1px solid #aaa;;">
                            <div class="exec_HeaderCont" style="width: 250px;">
                                Find Parameter</div>
                        </div>
                        <div id="div3">
                            <div id="Div4">
                                <asp:TextBox ID="txtFindAjaxList" runat="server" Width="250px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="right">
                        <div class="left" style="margin-right: 20px;">
                            <dxe:ASPxButton ID="btnDone" runat="server" AutoPostBack="False" Text="OK" Width="80px">
                                <ClientSideEvents Click="function (s, e) {fn_btnFindDone();}" />
                            </dxe:ASPxButton>
                        </div>
                        <div style="margin-right: 70px;">
                            <dxe:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="Cancel"
                                Width="80px">
                                <ClientSideEvents Click="function (s, e) {cPopup_Find.Hide();}" />
                            </dxe:ASPxButton>
                        </div>
                    </div>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        <dxpc:ASPxPopupControl ID="Popup_AddParamValue" runat="server" ClientInstanceName="cPopup_AddParamValue"
            Width="660px" HeaderText="Find Selected Value" PopupHorizontalAlign="Center"
            Height="350px" PopupVerticalAlign="Middle" CloseAction="CloseButton" Modal="True">
            <contentcollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl4" runat="server">
                     <div id="div5" style="padding: 5px; width: 650px; overflow-x: hidden; overflow-y: scroll;">
                        <div id="div6" style="border-right: 1px solid #aaa; width: 650px;">
                            <div class="exec_HeaderCont" style="width: 200px;">
                                Parameter</div>
                            <div class="exec_HeaderCont" style="width: 160px;">
                                Text</div>
                            <div class="exec_HeaderCont" style="width: 160px;">
                                Value</div>
                                 <div class="exec_HeaderCont" style="width: 30px;">
                                Add</div>
                        </div>
                        <div id="divDyanmicControl" style="width: 650px;">
                            <div id="DynamicControlParamValue" style="width: 650px; border-bottom: 1px solid #aaa; border-right: 1px solid #aaa;">
                            </div>
                        </div> 
                        </div>
                        <div>
                        <dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False"
                            KeyFieldName="CustomQueryDetail_Id" Width="650px" OnRowDeleting="grid_RowDeleting" OnCustomCallback="grid_CustomCallback"
                            ClientInstanceName="grid">
                            <Templates>
                                <EditForm>
                                </EditForm>
                            </Templates>
                            <Settings ShowGroupPanel="False"/>
                            <Settings ShowVerticalScrollBar="true" VerticalScrollableHeight="150" />
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Srl No" VisibleIndex="1" Width="10px">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                    <DataItemTemplate>
                                        <%# Container.ItemIndex+1%>
                                    </DataItemTemplate>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CustomQueryDetail_Parameter" Caption="Parameter" VisibleIndex="2" Width="50px">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CustomQueryDetail_Text" Caption="Text" VisibleIndex="3"  Width="80px">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CustomQueryDetail_Value" Caption="Value" VisibleIndex="4"  Width="80px"
                                    Visible="true">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="10" Width="25px">
                                    <EditButton Visible="false">
                                    </EditButton>
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                            <Styles>
                                <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                            </Styles>
                            <SettingsText ConfirmDelete="Are you sure to Delete this Record!" />
                        </dxwgv:ASPxGridView>
                        </div>
                </dxpc:PopupControlContentControl>
            </contentcollection>
            <headerstyle backcolor="LightGray" forecolor="Black" />
        </dxpc:ASPxPopupControl>
        <div style="display: none">
            <%--<asp:Button ID="hdn_btnExecute" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="hdn_btnExecute_Click" />--%>
            <asp:Button ID="btnExcelExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                    OnClick="btnExcelExport_Click" />
            <asp:Button ID="btnCSVExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnCSVExport_Click" />
                
                <asp:Button ID="btnPDFExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnPDFExport_Click" />
                
            <asp:HiddenField ID="hdn_ExecutedParamValue" runat="server" />
            <asp:HiddenField ID="hdnQueryListId" runat="server" />
            <asp:HiddenField ID="hdn_QueryShortName" runat="server" />
            <asp:HiddenField ID="hdn_FindTextBox" runat="server" />
            <asp:HiddenField ID="hdn_AddValues" runat="server" />
            <asp:HiddenField ID="hdn_AjaxValue" runat="server" />
        </div>
    </form>
</body>
</html>


