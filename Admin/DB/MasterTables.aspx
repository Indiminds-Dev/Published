<%@ page language="C#" autoeventwireup="true" inherits="MasterTables, App_Web_vd3qbkit" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>CDSL Masters</title>
    <!--External Style-->
    <link type="text/css" href="../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <!--External Javascript-->

    <script type="text/javascript" src="../../CentralData/JSScript/GenericJScript.js"></script>

    <!--Internal Javascript-->

    <script language="javascript" type="text/javascript">
    //Global Variabe
    ActiveObject=null;
    ActiveInput=null;
    //function ShowHideFilter(param)
    //{
    //    GetObjectID('divimportexcel').style.display='none';
    //    GetObjectID('divbtnexcel').style.display='inline';
    //    GetObjectID('divnext').style.display='none';
    //    cPopUp_ScripAlert.Show();  
    //}
    function btnexcel_Click()
    {
         var headertext=GetObjectID('<%=B_Header.ClientID %>').innerHTML;
         GetObjectID('hdnhedeartext').value=headertext;
         GetObjectID('divimportexcel').style.display='none';
         GetObjectID('divbtnexcel').style.display='inline';
         GetObjectID('divnext').style.display='inline';
         // cCbpContainer.PerformCallback("bulkimport~"+headertext);             
         GetObjectID('BtnForExportEvent').click();
    }
    function btnimportexcel_Click()
    {
        //cCbpContainer.PerformCallback("bulkimport~");
        GetObjectID('BtnForimportEvent').click(); 
    }
    function btnnext_Click()
    {
         GetObjectID('divimportexcel').style.display='inline';
         GetObjectID('divbtnexcel').style.display='none';
         GetObjectID('divnext').style.display='none';
    }
    function PageLoad()
    {
       fn_AccordTab("CDSL_Tab");
       var ActiveTab=null;
       if(GetObjectID('divCDSL').className=='expand_Tab')
            ActiveTab='CDSL';
       else 
            ActiveTab='KRA';               
       GetObjectID('hdnCommonGridBind').value= ActiveTab+'~'+ActiveObject;
       SetValue('<%=hdnEditID.ClientID%>','');         
    }
    function fn_FillCombo_FieldName(accordTab)
    {
        cCombo_FeildName.ClearItems();
        if(accordTab=="CDSL_Tab")
        {
             cCombo_FeildName.AddItem("Geographical Code", "Geographical Code");
             cCombo_FeildName.AddItem("Annual Income Code", "Annual Income Code");
             cCombo_FeildName.AddItem("Nationality Code", "Nationality Code");
             cCombo_FeildName.AddItem("Education / Degree", "Education / Degree");
             cCombo_FeildName.AddItem("BO Sub Status", "BO Sub Status");
             cCombo_FeildName.AddItem("Language Code", "Language Code");
             cCombo_FeildName.AddItem("PanExemptCategory", "PanExemptCategory");
             cCombo_FeildName.AddItem("Occupation Code", "Occupation Code");
             cCombo_FeildName.AddItem("Account Currency", "Account Currency");
             cCombo_FeildName.AddItem("Clearing House ID", "Clearing House ID");             
             cCombo_FeildName.AddItem("BO Status/Sub-Status", "BO Status/Sub-Status");             
        }
        else if(accordTab=="KRA_Tab")
        {
             cCombo_FeildName.AddItem("AddressProof", "AddressProof");
             cCombo_FeildName.AddItem("IdentityProof", "IdentityProof");
             cCombo_FeildName.AddItem("PanExemptCategory", "PanExemptCategory");
             cCombo_FeildName.AddItem("IndividualStatus", "IndividualStatus");
             cCombo_FeildName.AddItem("NRIStatusProof", "NRIStatusProof");
             cCombo_FeildName.AddItem("NonIndividualStatus", "NonIndividualStatus");
             cCombo_FeildName.AddItem("Occupation", "Occupation");
             cCombo_FeildName.AddItem("PoliticalConnection", "PoliticalConnection");
             cCombo_FeildName.AddItem("MaritalStatus", "MaritalStatus");
             cCombo_FeildName.AddItem("State", "State");
             cCombo_FeildName.AddItem("Country", "Country"); 
             cCombo_FeildName.AddItem("Intermediary Role", "Intermediary Role"); 
             cCombo_FeildName.AddItem("Intermediary Type", "Intermediary Type");  
             cCombo_FeildName.AddItem("Nationality Code", "Nationality Code");
             cCombo_FeildName.AddItem("Annual Income Code", "Annual Income Code");             
        }
    }
    function fn_AccordTab(obj)
    {
        fn_FillCombo_FieldName(obj); 
        if(obj=="CDSL_Tab")
        {
            HideShow('divCDSL_Cont','S');
            HideShow('divKRA_Cont','H');
            HideShow('Row00','H');
            GetObjectID('divCDSL').className ='expand_Tab';       
            GetObjectID('divKRA').className ='collapse_Tab';
            document.getElementById('divCDSL').style.marginBottom='0px';
            document.getElementById('divKRA').style.marginTop='7px';
            document.getElementById('divKRA').style.marginBottom='7px';
            fn_divTab("Geographical");       
        }
        else if(obj=="KRA_Tab")
        {
            HideShow('divCDSL_Cont','H');
            HideShow('divKRA_Cont','S');
            GetObjectID('divCDSL').className ='collapse_Tab';       
            GetObjectID('divKRA').className ='expand_Tab';
            document.getElementById('divCDSL').style.marginBottom='7px';
            document.getElementById('divKRA').style.marginBottom='0px';
            document.getElementById('divPanel').style.height='380px';
            fn_divTab("AddressProof");  
        }       
        Height('420','420');        
    }    
    function fn_divTab(obj)
    {
        if(obj=="Geographical")//==============Start CDSL===========================
        {
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(0);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('divGeographical').className ='active_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';                               
            GetObjectID('divLanguage').className ='inActive_Tab';                              
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';
            SetinnerHTML('spnTable','Geographical');
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="Geographical";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="Geographical_Description";
            GetObjectID('hdntablename').value='Master_Geographical';
        }
        else if(obj=="AnnualIncome")
        {
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(1);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','S');
            HideShow('Row3','S');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            SetinnerHTML('lblDynamic1','From');
            SetinnerHTML('lblDynamic2','To');
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='active_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';                               
            GetObjectID('divLanguage').className ='inActive_Tab';                                
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';     
            SetinnerHTML('spnTable','AnnualIncome'); 
            SetValue('<%=txtDescription.ClientID%>','');
            GetObjectID('<%=txtDynamic1.ClientID%>').detachEvent('onkeypress',letternumber); 
            GetObjectID('<%=txtDynamic1.ClientID%>').attachEvent('onkeypress',onlyNumbers);    
            GetObjectID('<%=txtDynamic2.ClientID%>').detachEvent('onkeypress',letternumber); 
            GetObjectID('<%=txtDynamic2.ClientID%>').attachEvent('onkeypress',onlyNumbers);  
            SetValue('<%=txtDynamic1.ClientID%>',''); 
            SetValue('<%=txtDynamic2.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="AnnualIncome";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="AnnualIncome_Description, AnnualIncome_From , AnnualIncome_To";              
            GetObjectID('hdntablename').value='Master_AnnualIncome';
        }    
        else if(obj=="Nationality")
        { 
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(2);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='active_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';                               
            GetObjectID('divLanguage').className ='inActive_Tab';                              
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';     
            SetinnerHTML('spnTable','Nationality');    
            SetValue('<%=txtDescription.ClientID%>','');
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="Nationality"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="Nationality_Description";              
            GetObjectID('hdntablename').value='Master_Nationality';
        }   
        else if(obj=="Education")
        {
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(3);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='active_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';                               
            GetObjectID('divLanguage').className ='inActive_Tab';                               
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';     
            SetinnerHTML('spnTable','Education');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="Education"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="edu_education";      
            GetObjectID('hdntablename').value='tbl_master_education';
        }
        else if(obj=="LegalStatus")
        {
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(4);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='active_Tab';                               
            GetObjectID('divLanguage').className ='inActive_Tab';                              
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';     
            SetinnerHTML('spnTable','LegalStatus');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="LegalStatus";   
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="lgl_legalStatus";    
            GetObjectID('hdntablename').value='tbl_master_legalStatus';
        }
        else if(obj=="Language")
        {
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(5);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';                               
            GetObjectID('divLanguage').className ='active_Tab';                       
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';     
            SetinnerHTML('spnTable','Language');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="Language"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="Language_Name";      
            GetObjectID('hdntablename').value='Master_Language';
        }
        else if(obj=="PanExemption")
        {
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(6);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';                               
            GetObjectID('divLanguage').className ='inActive_Tab';  
            GetObjectID('divPanExemption').className ='active_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';     
            SetinnerHTML('spnTable','PanExemption');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="PanExemption"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="PanExemptCategory_Description";      
            GetObjectID('hdntablename').value='Master_PanExemptCategory';
        }
        else if(obj=="CdslOccupation")
        {
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(7);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';                               
            GetObjectID('divLanguage').className ='inActive_Tab';                       
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='active_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';     
            SetinnerHTML('spnTable','Occupation');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="CdslOccupation"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="pro_professionName";      
            GetObjectID('hdntablename').value='tbl_master_profession';
        }
        else if(obj=="Currency")
        {
            HideShow('divViewCommonLink','S');
            cCombo_FeildName.SetSelectedIndex(8);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','S');
            HideShow('Row3','S');
            HideShow('Row4','S');
            HideShow('Row5','S');
            HideShow('Row6','S');
            HideShow('Row7','S');
            HideShow('Row8','S');
            HideShow('Row9','S');
            SetinnerHTML('lblDynamic1','Symbol');
            SetinnerHTML('lblDynamic2','Alpha Code');           
            SetinnerHTML('lblDynamic3','International Code');           
            SetinnerHTML('lblDynamic4','Decimal Character');           
            SetinnerHTML('lblDynamic5','Decimal Place');           
            SetinnerHTML('lblDynamic6','Decimal Portion Name');           
            SetinnerHTML('lblDynamic7','Decimal Portion Symbol');           
            SetinnerHTML('lblDynamic8','Amount Display Basis');           
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';                               
            GetObjectID('divLanguage').className ='inActive_Tab';                       
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='active_Tab';                      
            GetObjectID('divCDSLStaticData').className ='inActive_Tab';     
            SetinnerHTML('spnTable','Currency');    
            SetValue('<%=txtDescription.ClientID%>','');
            SetValue('<%=txtDynamic1.ClientID%>',''); 
            SetValue('<%=txtDynamic2.ClientID%>',''); 
            SetValue('<%=txtDynamic3.ClientID%>',''); 
            SetValue('<%=txtDynamic4.ClientID%>',''); 
            SetValue('<%=txtDynamic5.ClientID%>',''); 
            SetValue('<%=txtDynamic6.ClientID%>',''); 
            SetValue('<%=txtDynamic7.ClientID%>',''); 
            SetValue('<%=txtDynamic8.ClientID%>',''); 
            GetObjectID('<%=txtDynamic1.ClientID%>').detachEvent('onkeypress',onlyNumbers); 
            GetObjectID('<%=txtDynamic2.ClientID%>').detachEvent('onkeypress',onlyNumbers); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="Currency"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="Currency_Name,Currency_Symbol,Currency_AlphaCode,Currency_InternationalCode,Currency_DecimalCharacter,Currency_DecimalPlaces,Currency_DecimalPortionName,Currency_DecimalPortionSymbol,Currency_AmountDisplayBasis";      
            GetObjectID('hdntablename').value='Master_Currency';
        }
        else if(obj=="CDSLStaticData")
        {
            HideShow('divViewCommonLink','H');
            cCombo_FeildName.SetSelectedIndex(0);
            cCombo_FeildName.SetEnabled(true);
            HideShow('Row2','S');
            HideShow('Row3','S');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            SetinnerHTML('lblDynamic1','Type Code');
            SetinnerHTML('lblDynamic2','Sub Type Code');           
            GetObjectID('divGeographical').className ='inActive_Tab';    
            GetObjectID('divAnnualIncome').className ='inActive_Tab';    
            GetObjectID('divNationality').className ='inActive_Tab';    
            GetObjectID('divEducation').className ='inActive_Tab';    
            GetObjectID('divLegalStatus').className ='inActive_Tab';  
            GetObjectID('divLanguage').className ='inActive_Tab';                              
            GetObjectID('divPanExemption').className ='inActive_Tab';                      
            GetObjectID('divCdslOccupation').className ='inActive_Tab';                      
            GetObjectID('divCurrency').className ='inActive_Tab';                      
            GetObjectID('divCDSLStaticData').className ='active_Tab';                       
            SetinnerHTML('spnTable','CDSLStaticDataCode');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            SetValue('<%=txtDynamic1.ClientID%>',''); 
            SetValue('<%=txtDynamic2.ClientID%>',''); 
            GetObjectID('<%=txtDynamic1.ClientID%>').detachEvent('onkeypress',onlyNumbers); 
            GetObjectID('<%=txtDynamic1.ClientID%>').attachEvent('onkeypress',letternumber);    
            GetObjectID('<%=txtDynamic2.ClientID%>').detachEvent('onkeypress',onlyNumbers); 
            GetObjectID('<%=txtDynamic2.ClientID%>').attachEvent('onkeypress',letternumber);             
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="CDSLStaticData";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="CdslStaticData_Description, CdslStaticData_FieldName, CdslStaticData_TypeCode, CdslStaticData_SubTypeCode";             
            GetObjectID('hdntablename').value='Master_CdslStaticDataCode';
        }
        else if(obj=="AddressProof")//==========Start KRA ================================
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(0);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');           
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='active_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab';
            GetObjectID('div_ContactType').className ='inActive_Tab';
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                                  
            SetinnerHTML('spnTable','AddressProof');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="AddressProof"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="AddressProof_Description";            
            GetObjectID('hdntablename').value='Master_AddressProof';
        }
        else if(obj=="IdentityProof")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(1);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');       
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='active_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab'; 
            GetObjectID('div_ContactType').className ='inActive_Tab';                      
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                       
            SetinnerHTML('spnTable','IdentityProof');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="IdentityProof";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="IdentityProof_Description";
            GetObjectID('hdntablename').value='Master_IdentityProof';             
        }
        else if(obj=="PanExemptCategory")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(2);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');       
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='active_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab'; 
            GetObjectID('div_ContactType').className ='inActive_Tab';                     
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                      
            SetinnerHTML('spnTable','PanExemptCategory');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="PanExemptCategory"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="PanExemptCategory_Description"; 
            GetObjectID('hdntablename').value='Master_PanExemptCategory';           
        }
        else if(obj=="IndividualStatus")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(3);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');         
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='active_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab';  
            GetObjectID('div_ContactType').className ='inActive_Tab';                    
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                      
            SetinnerHTML('spnTable','IndividualStatus');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="IndividualStatus";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="lgl_legalStatus";  
            GetObjectID('hdntablename').value='tbl_master_legalStatus';           
        }
         else if(obj=="NRIStatusProof")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(4);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');         
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='active_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab';
            GetObjectID('div_ContactType').className ='inActive_Tab';                      
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                      
            SetinnerHTML('spnTable','NRIStatusProof');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="NRIStatusProof";  
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="NRIStatusProof_Description";           
            GetObjectID('hdntablename').value='Master_NRIStatusProof';
        }
         else if(obj=="NonIndividualStatus")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(5);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');  
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='active_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab'; 
            GetObjectID('div_ContactType').className ='inActive_Tab';                     
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                      
            SetinnerHTML('spnTable','NonIndividualStatus');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="NonIndividualStatus";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="NonIndividualStatus_Description";             
            GetObjectID('hdntablename').value='Master_NonIndividualStatus';
        }
        else if(obj=="Occupation")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(6);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');         
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='active_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab';
            GetObjectID('div_ContactType').className ='inActive_Tab';                      
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                      
            SetinnerHTML('spnTable','Occupation');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="Occupation"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="pro_professionName";            
            GetObjectID('hdntablename').value='tbl_master_profession';
        }
        else if(obj=="PoliticalConnection")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(7);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='active_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab';
            GetObjectID('div_ContactType').className ='inActive_Tab';                       
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                       
            SetinnerHTML('spnTable','PoliticalConnection');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="PoliticalConnection";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="PoliticalConnection_Description";             
            GetObjectID('hdntablename').value='Master_PoliticalConnection';
        }
        else if(obj=="MaritalStatus")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(8);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');    
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='active_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab';
            GetObjectID('div_ContactType').className ='inActive_Tab';                       
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                       
            SetinnerHTML('spnTable','MaritalStatus');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="MaritalStatus";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="mts_maritalStatus";             
            GetObjectID('hdntablename').value='tbl_master_maritalstatus';
        }
        else if(obj=="State")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(9);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='active_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab';  
            GetObjectID('div_ContactType').className ='inActive_Tab';                    
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                      
            SetinnerHTML('spnTable','State');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="State";  
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="state";           
            GetObjectID('hdntablename').value='tbl_master_state';
        }
        else if(obj=="Country")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(10);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H'); 
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='active_Tab';
            GetObjectID('div_ContactType').className ='inActive_Tab';
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                                              
            SetinnerHTML('spnTable','Country');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="Country";   
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="cou_country";          
            GetObjectID('hdntablename').value='tbl_master_country';
        }
        else if(obj=="ContactType")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(11);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','S');
            HideShow('Row3','H');
            HideShow('Row4','H');  
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            SetinnerHTML('lblDynamic1','Prefix');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab'; 
            GetObjectID('div_Country').className ='inActive_Tab';                             
            GetObjectID('div_ContactType').className ='active_Tab';
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                                              
            SetinnerHTML('spnTable','Contact Type');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            SetValue('<%=txtDynamic1.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="ContactType";             
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="cnttpy_contactType,cnt_prefix";          
            GetObjectID('hdntablename').value='tbl_master_Contacttype';
        }
        else if(obj=="KRANationality")
        { 
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(13);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','H');
            HideShow('Row3','H');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab'; 
            GetObjectID('div_Country').className ='inActive_Tab';                             
            GetObjectID('div_ContactType').className ='inActive_Tab';
            GetObjectID('div_KRANationality').className ='active_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';
            SetinnerHTML('spnTable','Nationality');    
            SetValue('<%=txtDescription.ClientID%>','');
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="KRANationality"; 
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="Nationality_Description";              
            GetObjectID('hdntablename').value='Master_Nationality';
        }   
        else if(obj=="KRAAnnualIncome")
        {
            HideShow('divViewCommonLink','S');
            HideShow('Row00','H');
            cCombo_FeildName.SetSelectedIndex(14);
            cCombo_FeildName.SetEnabled(false);
            HideShow('Row2','S');
            HideShow('Row3','S');
            HideShow('Row4','H');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            SetinnerHTML('lblDynamic1','From');
            SetinnerHTML('lblDynamic2','To');
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab'; 
            GetObjectID('div_Country').className ='inActive_Tab';                             
            GetObjectID('div_ContactType').className ='inActive_Tab';
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='active_Tab';
            GetObjectID('div_KRAStaticData').className ='inActive_Tab';                                              
            SetinnerHTML('spnTable','AnnualIncome'); 
            SetValue('<%=txtDescription.ClientID%>','');
            GetObjectID('<%=txtDynamic1.ClientID%>').detachEvent('onkeypress',letternumber); 
            GetObjectID('<%=txtDynamic1.ClientID%>').attachEvent('onkeypress',onlyNumbers);    
            GetObjectID('<%=txtDynamic2.ClientID%>').detachEvent('onkeypress',letternumber); 
            GetObjectID('<%=txtDynamic2.ClientID%>').attachEvent('onkeypress',onlyNumbers);  
            SetValue('<%=txtDynamic1.ClientID%>',''); 
            SetValue('<%=txtDynamic2.ClientID%>',''); 
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="KRAAnnualIncome";
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="AnnualIncome_Description, AnnualIncome_From, AnnualIncome_To";              
            GetObjectID('hdntablename').value='Master_AnnualIncome';
        }
        else if(obj=="KRAStaticData")
        {
            HideShow('divViewCommonLink','H');
            HideShow('Row00','S');
            cCombo_FeildName.SetEnabled(true);
            cCombo_FeildName.SetSelectedIndex(0);
            HideShow('Row2','S');
            HideShow('Row3','S');
            HideShow('Row4','S');
            HideShow('Row5','H');
            HideShow('Row6','H');
            HideShow('Row7','H');
            HideShow('Row8','H');
            HideShow('Row9','H');
            SetinnerHTML('lblDynamic1','Type Code');
            SetinnerHTML('lblDynamic2','Code');
            SetinnerHTML('lblDynamic3','Sub Code');            
            GetObjectID('div_AddressProof').className ='inActive_Tab';                              
            GetObjectID('div_IdentityProof').className ='inActive_Tab';                              
            GetObjectID('div_PanExemptCategory').className ='inActive_Tab';                              
            GetObjectID('div_IndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_NRIStatusProof').className ='inActive_Tab';                              
            GetObjectID('div_NonIndividualStatus').className ='inActive_Tab';                              
            GetObjectID('div_Occupation').className ='inActive_Tab';                              
            GetObjectID('div_PoliticalConnection').className ='inActive_Tab';                              
            GetObjectID('div_MaritalStatus').className ='inActive_Tab';                              
            GetObjectID('div_State').className ='inActive_Tab';                              
            GetObjectID('div_Country').className ='inActive_Tab';
            GetObjectID('div_ContactType').className ='inActive_Tab';
            GetObjectID('div_KRANationality').className ='inActive_Tab';
            GetObjectID('div_KRAAnnualIncome').className ='inActive_Tab';
            GetObjectID('div_KRAStaticData').className ='active_Tab';                                              
            SetinnerHTML('spnTable','KRAStaticData');    
            SetValue('<%=txtDescription.ClientID%>',''); 
            SetValue('<%=txtDynamic1.ClientID%>',''); 
            SetValue('<%=txtDynamic2.ClientID%>',''); 
            SetValue('<%=txtDynamic3.ClientID%>',''); 
            GetObjectID('<%=txtDynamic1.ClientID%>').detachEvent('onkeypress',onlyNumbers); 
            GetObjectID('<%=txtDynamic1.ClientID%>').attachEvent('onkeypress',letternumber);    
            GetObjectID('<%=txtDynamic2.ClientID%>').detachEvent('onkeypress',onlyNumbers); 
            GetObjectID('<%=txtDynamic2.ClientID%>').attachEvent('onkeypress',letternumber);  
            GetObjectID('<%=txtDescription.ClientID%>').focus();   
            ActiveObject="KRAStaticData";   
            document.getElementById('<%=B_Header.ClientID %>').innerHTML="KRAStaticData_Value,KRAStaticData_Type,KRAStaticData_TypeCode,KRAStaticData_Code,KRAStaticData_SubCode,KRAStaticData_KRAId";          
            GetObjectID('hdntablename').value='Config_KRAStaticData';            
        }
        Height('450','450');
    }
    </script>

    <script language="javascript" type="text/javascript">
    function CbpContainer_EndCallBack()
    {
         if(ActiveObject!='CDSLStaticData'||ActiveObject!='KRAStaticData')
              cCombo_FeildName.SetEnabled(false);
         else 
             cCombo_FeildName.SetEnabled(true);                       
         
         if(cCbpContainer.cpBindCommon!=undefined)
         {         
            if(cCbpContainer.cpBindCommon=="ShowCommonGvw")
            {
                grid.Refresh();
                cPopup_CommonGvw.Show();                                
            }
         }
         else
         {
             //Set Continue Button Enable Cause It May Be In False State 
             if(cCbpContainer.cpResult!=undefined)
             {
                  alert(cCbpContainer.cpResult);          
             }   
             else
             {    cBtndone.SetEnabled(false);                        
                  cBtnContinue.SetEnabled(true);
             }            
             SetValue('<%=txtDescription.ClientID %>',''); 
             SetValue('<%=txtDynamic1.ClientID %>',''); 
             SetValue('<%=txtDynamic2.ClientID %>',''); 
             SetValue('<%=txtDynamic3.ClientID %>','');      
             if(cCbpContainer.cpBindGrid!=null)
             {
                var InputValue=cCbpContainer.cpBindGrid;
                cGvExistsInfo.PerformCallback("ExistsInfo~"+InputValue+"~"+ActiveObject+"~"+cCmbKycRA.GetValue());
             }
             var accordTab;
             if(GetObjectID('divCDSL').className=='expand_Tab')
                    accordTab='CDSL_Tab';
             else 
                    accordTab='KRA_Tab';
             fn_FillCombo_FieldName(accordTab);   
             fn_divTab(ActiveObject);          
         }
    }
    function callbackend()
    {
        cPopUp_ScripAlert.Hide();
        CbpContainer_EndCallBack();
    }
    function Btndone_Click()
    {
        if(ActiveObject=="CDSLStaticData")
        {
            if(Control_Empty('<%=txtDescription.ClientID %>',"Description Can Not Be Empty"))
                if(Control_Empty('<%=txtDynamic1.ClientID %>',"Type Code Can Not Be Empty"))
                {   
                    ActiveInput=GetValue('<%=txtDescription.ClientID %>')+'~'+cCombo_FeildName.GetValue()+'~'+GetValue('<%=txtDynamic1.ClientID %>')+'~'+GetValue('<%=txtDynamic2.ClientID %>');
                    cCbpContainer.PerformCallback("Fill~"+ActiveObject+"~"+ActiveInput);            
                }
        }
        else if(ActiveObject=="KRAStaticData")
        {
            if(Control_Empty('<%=txtDescription.ClientID %>',"Description Can Not Be Empty"))
                if(Control_Empty('<%=txtDynamic2.ClientID %>',"Code Can Not Be Empty"))
                {   
                    ActiveInput=GetValue('<%=txtDescription.ClientID %>')+'~'+cCombo_FeildName.GetValue()+'~'+GetValue('<%=txtDynamic1.ClientID %>')+'~'+GetValue('<%=txtDynamic2.ClientID %>')+'~'+GetValue('<%=txtDynamic3.ClientID %>')+'~'+cCmbKycRA.GetValue();
                    cCbpContainer.PerformCallback("Fill~"+ActiveObject+"~"+ActiveInput);            
                }
        }
        else if(ActiveObject=="AnnualIncome")
        {
             if(Control_Empty('<%=txtDescription.ClientID %>',"Description Can Not Be Empty"))
                if(Control_Empty('<%=txtDynamic1.ClientID %>',"From Can Not Be Empty"))
                    if(Control_Empty('<%=txtDynamic2.ClientID %>',"To Can Not Be Empty"))
                    {
                        ActiveInput=GetValue('<%=txtDescription.ClientID %>')+'~'+GetValue('<%=txtDynamic1.ClientID %>')+'~'+GetValue('<%=txtDynamic2.ClientID %>');
                        cCbpContainer.PerformCallback("Fill~"+ActiveObject+"~"+ActiveInput);          
                    }
        }
        else if(ActiveObject=="Currency")
        {
             if(Control_Empty('<%=txtDescription.ClientID %>',"Description Can Not Be Empty"))
                if(Control_Empty('<%=txtDynamic1.ClientID %>',"Symbol Can Not Be Empty"))
                    if(Control_Empty('<%=txtDynamic2.ClientID %>',"Alpha Code Can Not Be Empty"))
                        if(Control_Empty('<%=txtDynamic4.ClientID %>',"Decimal Character Can Not Be Empty"))
                            if(Control_Empty('<%=txtDynamic5.ClientID %>',"Decimal Places Can Not Be Empty"))
                                if(Control_Empty('<%=txtDynamic6.ClientID %>',"Decimal Portion Name Can Not Be Empty"))
                                    if(Control_Empty('<%=txtDynamic7.ClientID %>',"Decimal Portion Symbol Can Not Be Empty"))
                                        if(Control_Empty('<%=txtDynamic8.ClientID %>',"Amount Display Basis Can Not Be Empty"))
                                        {
                                            ActiveInput=GetValue('<%=txtDescription.ClientID %>')+'~'+GetValue('<%=txtDynamic1.ClientID %>')+'~'+GetValue('<%=txtDynamic2.ClientID %>')+'~'+GetValue('<%=txtDynamic3.ClientID %>')+'~'+GetValue('<%=txtDynamic4.ClientID %>')+'~'+GetValue('<%=txtDynamic5.ClientID %>')+'~'+GetValue('<%=txtDynamic6.ClientID %>')+'~'+GetValue('<%=txtDynamic7.ClientID %>')+'~'+GetValue('<%=txtDynamic8.ClientID %>');
                                            cCbpContainer.PerformCallback("Fill~"+ActiveObject+"~"+ActiveInput);          
                                        }
        }
        else if(ActiveObject=="ContactType")
        {
             if(Control_Empty('<%=txtDescription.ClientID %>',"Description Can Not Be Empty"))
                if(Control_Empty('<%=txtDynamic1.ClientID %>',"Prefix Can Not Be Empty"))
                {
                    ActiveInput=GetValue('<%=txtDescription.ClientID %>')+'~'+GetValue('<%=txtDynamic1.ClientID %>');
                    cCbpContainer.PerformCallback("Fill~"+ActiveObject+"~"+ActiveInput);          
                }
        }
        else if(ActiveObject=="KRAAnnualIncome")
        {
             if(Control_Empty('<%=txtDescription.ClientID %>',"Description Can Not Be Empty"))
                if(Control_Empty('<%=txtDynamic1.ClientID %>',"From Can Not Be Empty"))
                    if(Control_Empty('<%=txtDynamic2.ClientID %>',"To Can Not Be Empty"))
                    {
                        ActiveInput=GetValue('<%=txtDescription.ClientID %>')+'~'+GetValue('<%=txtDynamic1.ClientID %>')+'~'+GetValue('<%=txtDynamic2.ClientID %>');
                        cCbpContainer.PerformCallback("Fill~"+ActiveObject+"~"+ActiveInput);          
                    }
        }
        else       
        {
            if(Control_Empty('<%=txtDescription.ClientID %>',"Description Can Not Be Empty"))
            {
                ActiveInput=GetValue('<%=txtDescription.ClientID %>');
                cCbpContainer.PerformCallback("Fill~"+ActiveObject+"~"+ActiveInput);
            }
        }        
    }
    function GvExistsInfo_EndCallBack()
    {
        var WhichCall=null;
        if(cGvExistsInfo.cpAfterContinue!=null)
        {
            WhichCall=cGvExistsInfo.cpAfterContinue.split('~')[0];
            if(WhichCall=='AfterContinue')
            {
                 alert(cGvExistsInfo.cpAfterContinue.split('~')[1]);                       
                 HideShow('divGvExistsInfo','H');                
                 cBtndone.SetEnabled(true); 
                 var accordTab=null;
                 if(GetObjectID('divCDSL').className=='expand_Tab')
                        accordTab='CDSL_Tab';
                 else 
                        accordTab='KRA_Tab';
                 fn_FillCombo_FieldName(accordTab);
                 fn_divTab(ActiveObject);               
            }            
            cGvExistsInfo.cpAfterContinue=null;            
        }
        else if(cGvExistsInfo.cpAfterDelete!=null)
        {
            WhichCall=cGvExistsInfo.cpAfterDelete.split('~')[0];
            if(WhichCall=="DeleteWithBind" || WhichCall=="DeleteExistInfo")
            {
                if(WhichCall=="DeleteWithBind")
                {   
                    cGvExistsInfo.PerformCallback("ExistsInfo~"+cGvExistsInfo.cpAfterDelete.split('~')[2]+
                                                        '~'+cGvExistsInfo.cpAfterDelete.split('~')[3]+
                                                        '~'+cGvExistsInfo.cpAfterDelete.split('~')[4]+
                                                        '~'+ActiveObject+'~'+cCmbKycRA.GetValue());
                }                                                        
                else
                {
                    HideShow('DGEI_Row1','H');
                    HideShow('lblContinue','S');
                } 
                alert(cGvExistsInfo.cpAfterDelete.split('~')[1]);                                 
            }
            cGvExistsInfo.cpAfterDelete=null;
            HideShow("divGvExistsInfo","S"); 
            SetinnerHTML('SpnMatchTable',ActiveObject);       
        }
        else
        {
            cBtndone.SetEnabled(false);
            HideShow('lblContinue','H');      
            HideShow('DGEI_Row1','S');
            HideShow('divGvExistsInfo','S');
            SetinnerHTML('SpnMatchTable',ActiveObject);
        }
        Height('450','450');       
    }
    //Param Contain Value Of WhichCall And If Any Other Parameter Like Delete~46(WhichCall~AnyValue)
    function GvExistsInfo_PerformCallBack(Param)
    {
        var WhichCall=Param.split('~')[0];        
        var AnyValue=null;
        if(WhichCall=="Continue")
        {
            cGvExistsInfo.PerformCallback(WhichCall+'~'+ActiveObject+'~'+ActiveInput);            
        }
        if (WhichCall=="Cancel")
        {
             HideShow("divGvExistsInfo","H");
             cBtndone.SetEnabled(true);
             var accordTab=null;
             if(GetObjectID('divCDSL').className=='expand_Tab')
                    accordTab='CDSL_Tab';
             else 
                    accordTab='KRA_Tab';
             fn_FillCombo_FieldName(accordTab);
             fn_divTab(ActiveObject); 
        }
        if(WhichCall=="DeleteExistInfo")
        {
            AnyValue=Param.split('~')[1];
            cGvExistsInfo.PerformCallback(WhichCall+'~'+ActiveObject+'~'+AnyValue+"~"+ActiveInput);
        }
    }
    function fn_CmbKycRA(obj)
    {
       if(ActiveObject=="ContactType")
       {
            if(obj=='2')//NDML
            {
                 cCombo_FeildName.SetSelectedIndex(11);
                 cCombo_FeildName.SetEnabled(false);    
            }
            else if(obj=='3')//DotEx
            {
                 cCombo_FeildName.SetSelectedIndex(12);
                 cCombo_FeildName.SetEnabled(false); 
            }
       }
    }
    </script>

    <!--Common GridView Popup Related-->

    <script type="text/javascript" language="javascript">
    function fn_btnCloseGvw()
    {
        cPopup_CommonGvw.Hide();
        var accordTab=null;
        if(GetObjectID('divCDSL').className=='expand_Tab')
            accordTab='CDSL_Tab';
        else 
            accordTab='KRA_Tab';
        fn_FillCombo_FieldName(accordTab)
        fn_divTab(ActiveObject);
    }
    function fn_ShowMasterGrid()
    {
        var ActiveTab=null;
        if(GetObjectID('divCDSL').className=='expand_Tab')
             ActiveTab='CDSL';
        else 
             ActiveTab='KRA';        
        GetObjectID('hdnCommonGridBind').value= ActiveTab+'~'+ActiveObject;    
        cCbpContainer.PerformCallback("ShowCommonMasterGvw~");          
    }
    function ShowHideGvwFilter(obj)
    {
        var ActiveTab=null;
        if(GetObjectID('divCDSL').className=='expand_Tab')
             ActiveTab='CDSL';
        else 
             ActiveTab='KRA';
        GetObjectID('hdnCommonGridBind').value= ActiveTab+'~'+ActiveObject;        
        grid.PerformCallback('CommonGvwFilter~'+obj);
    }
    function fn_EditCommonMaster(obj)
    {
       grid.PerformCallback('Edit~'+obj);            
    }
    function fn_DeleteCommonMaster(obj)
    {
        var ActiveTab=null;
        if(GetObjectID('divCDSL').className=='expand_Tab')
             ActiveTab='CDSL';
        else 
             ActiveTab='KRA';        
        GetObjectID('hdnCommonGridBind').value= ActiveTab+'~'+ActiveObject;    
        grid.PerformCallback('DeleteCommon~'+obj);    
    }
    function grid_EndCallBack()
    {                     
        if(grid.cpEdit!=null)
        {
          var selectedTab=GetObjectID('hdnCommonGridBind').value.split('~')[0];    
          var selectedObject=GetObjectID('hdnCommonGridBind').value.split('~')[1];    
          HideShow('dtl01','H');
          HideShow('dtl02','H');
          HideShow('dtl03','H');
          HideShow('dtl04','H');
          HideShow('dtl05','H');
          HideShow('dtl06','H');
          HideShow('dtl07','H');
          HideShow('dtl08','H');
          
          GetObjectID('<%=hdnEditID.ClientID%>').value=grid.cpEdit.split('~')[0];          
          SetValue('<%=txtCommonDescription.ClientID %>',grid.cpEdit.split('~')[5]);
          if(selectedTab=="CDSL")
          {
            ctxtCdslCode.SetValue(grid.cpEdit.split('~')[1]);
            HideShow('dtl2','S');
            HideShow('dtl3','H');
            HideShow('dtl4','H');
            HideShow('dtl5','H');
          }
          if(selectedTab=="KRA")
          {
             ctxtCvlCode.SetValue(grid.cpEdit.split('~')[2]);
             ctxtNdmlCode.SetValue(grid.cpEdit.split('~')[3]);
             ctxtDotexCode.SetValue(grid.cpEdit.split('~')[4]);
             HideShow('dtl2','H');
             HideShow('dtl3','S');
             HideShow('dtl4','S');
             HideShow('dtl5','S');
          }
          if((selectedObject=="AnnualIncome")||(selectedObject=="KRAAnnualIncome"))
          {
             SetinnerHTML('lblTest1','From');
             SetinnerHTML('lblTest2','To');
             SetValue('<%=txtTest1.ClientID %>',grid.cpEdit.split('~')[6]);
             SetValue('<%=txtTest2.ClientID %>',grid.cpEdit.split('~')[7]);
             HideShow('dtl01','S');
             HideShow('dtl02','S');
             HideShow('dtl03','H');
             HideShow('dtl04','H');
             HideShow('dtl05','H');
             HideShow('dtl06','H');
             HideShow('dtl07','H');
             HideShow('dtl08','H');             
          }
          if(selectedObject=="ContactType")
          {
             SetinnerHTML('lblTest1','Prefix');
             SetValue('<%=txtTest1.ClientID %>',grid.cpEdit.split('~')[6]);
             HideShow('dtl01','S');
             HideShow('dtl02','H');
             HideShow('dtl03','H');
             HideShow('dtl04','H');
             HideShow('dtl05','H');
             HideShow('dtl06','H');
             HideShow('dtl07','H');
             HideShow('dtl08','H');
          }
          if(selectedObject=="Currency")
          { 
             SetinnerHTML('lblTest1','Symbol');
             SetinnerHTML('lblTest2','AlphaCode');
             SetinnerHTML('lblTest3','InternationalCode');
             SetinnerHTML('lblTest4','DecimalChar');
             SetinnerHTML('lblTest5','DecimalPlace');
             SetinnerHTML('lblTest6','DecimalPortionName');
             SetinnerHTML('lblTest7','DecimalPortionSymbol');
             SetinnerHTML('lblTest8','AmountDisplayBasis');
             SetValue('<%=txtTest1.ClientID %>',grid.cpEdit.split('~')[6]);
             SetValue('<%=txtTest2.ClientID %>',grid.cpEdit.split('~')[7]);
             SetValue('<%=txtTest3.ClientID %>',grid.cpEdit.split('~')[8]);
             SetValue('<%=txtTest4.ClientID %>',grid.cpEdit.split('~')[9]);
             SetValue('<%=txtTest5.ClientID %>',grid.cpEdit.split('~')[10]);
             SetValue('<%=txtTest6.ClientID %>',grid.cpEdit.split('~')[11]);
             SetValue('<%=txtTest7.ClientID %>',grid.cpEdit.split('~')[12]);
             SetValue('<%=txtTest8.ClientID %>',grid.cpEdit.split('~')[13]);
             HideShow('dtl01','S');
             HideShow('dtl02','S');
             HideShow('dtl03','S');
             HideShow('dtl04','S');
             HideShow('dtl05','S');
             HideShow('dtl06','S');
             HideShow('dtl07','S');
             HideShow('dtl08','S');          
          }                    
          cPopup_Detail.Show();
        }
        if(grid.cpUpdate!=null) 
        {
           if(grid.cpUpdate=='Success')
           {
             alert('Update Successfully');
             cPopup_Detail.Hide();
           }
           else
              alert("Error on Updation\n'Please Try again!!'")
        }
        if(grid.cpDelete!=null) 
        {
         if(grid.cpDelete=='Success')
             alert('Deleted Successfully');
          else
              alert("Error on deletion\n'Please Try again!!'")
        }        
        if(grid.cpExists!=null)
        {
           if(grid.cpExists=="Exists")
           {
              alert('Record already Exists');
              cPopup_Detail.Hide();
           }
           else
              alert("Error on operatio\n'Please Try again!!'")      
        }
    }
    </script>

    <!--Detail Popup Related-->

    <script type="text/javascript" language="javascript">
    function fn_BtnDetailCancel()
    {
        cPopup_Detail.Hide();        
    }
    function fn_BtnDetailSave()
    {        
        if(GetObjectID('<%=hdnEditID.ClientID%>').value!='')
        {
            var ActiveTab=null;
            if(GetObjectID('divCDSL').className=='expand_Tab')
                 ActiveTab='CDSL';
            else 
                 ActiveTab='KRA';               
            SetValue('hdnCommonGridBind', ActiveTab+'~'+ActiveObject);    
            if((ActiveObject=="AnnualIncome")||(ActiveObject=="KRAAnnualIncome"))
            {
                 if(Control_Empty('<%=txtCommonDescription.ClientID %>',"Description Can Not Be Empty"))
                    if(Control_Empty('<%=txtTest1.ClientID %>',"From Can Not Be Empty"))
                        if(Control_Empty('<%=txtTest2.ClientID %>',"To Can Not Be Empty"))
                        {
                            ActiveInput=GetValue('<%=txtCommonDescription.ClientID %>')+'~'+GetValue('<%=txtTest1.ClientID %>')+'~'+GetValue('<%=txtTest2.ClientID %>');
                            grid.PerformCallback('UpdateCommon~'+ActiveObject+"~"+ActiveInput);
                        }
            }
            else if(ActiveObject=="Currency")
            {                 
                 if(Control_Empty('<%=txtCommonDescription.ClientID %>',"Description Can Not Be Empty"))
                    if(Control_Empty('<%=txtTest1.ClientID %>',"Symbol Can Not Be Empty"))
                        if(Control_Empty('<%=txtTest2.ClientID %>',"Alpha Code Can Not Be Empty"))
                            if(Control_Empty('<%=txtTest4.ClientID %>',"Decimal Character Can Not Be Empty"))
                                if(Control_Empty('<%=txtTest5.ClientID %>',"Decimal Places Can Not Be Empty"))
                                    if(Control_Empty('<%=txtTest6.ClientID %>',"Decimal Portion Name Can Not Be Empty"))
                                        if(Control_Empty('<%=txtTest7.ClientID %>',"Decimal Portion Symbol Can Not Be Empty"))
                                            if(Control_Empty('<%=txtTest8.ClientID %>',"Amount Display Basis Can Not Be Empty"))
                                            {
                                                ActiveInput=GetValue('<%=txtCommonDescription.ClientID %>')+'~'+GetValue('<%=txtTest1.ClientID %>')+'~'+GetValue('<%=txtTest2.ClientID %>')+'~'+GetValue('<%=txtTest3.ClientID %>')+'~'+GetValue('<%=txtTest4.ClientID %>')+'~'+GetValue('<%=txtTest5.ClientID %>')+'~'+GetValue('<%=txtTest6.ClientID %>')+'~'+GetValue('<%=txtTest7.ClientID %>')+'~'+GetValue('<%=txtTest8.ClientID %>');
                                                grid.PerformCallback('UpdateCommon~'+ActiveObject+"~"+ActiveInput);
                                            }
            }
            else if(ActiveObject=="ContactType")
            {
                 if(Control_Empty('<%=txtCommonDescription.ClientID %>',"Description Can Not Be Empty"))
                    if(Control_Empty('<%=txtTest1.ClientID %>',"Prefix Can Not Be Empty"))
                    {
                        ActiveInput=GetValue('<%=txtCommonDescription.ClientID %>')+'~'+GetValue('<%=txtTest1.ClientID %>');                            
                        grid.PerformCallback('UpdateCommon~'+ActiveObject+"~"+ActiveInput);
                    }
            }
            else       
            {
                if(Control_Empty('<%=txtCommonDescription.ClientID%>',"Description Can Not Be Empty"))
                {
                    ActiveInput=document.getElementById('<%=txtCommonDescription.ClientID %>').value; 
                    grid.PerformCallback('UpdateCommon~'+ActiveObject+"~"+ActiveInput);                  
                }
            }           
        }       
    }    
    </script>

    <style type="text/css">
        #pageCont{width:1150px; margin:5px;}
        #tabCont{width:200px;z-index:10;position:relative;}       
        .panelCont{width:435px; background-color:#efefef; border: 1px solid #555; padding :5px; margin-left:-1px;height: 380px;}        
        .divPanelHeader{float:left; margin-bottom: 10px; text-align: center; border: 1px solid #555; width:99.5%;background-color:#55D4FF;}
        .active_Tab{margin-left:15px;font-size:12px;font-Weight:bold; padding:0px 3px; line-height:1.5;  background-image:url('../Images/Arr_Right.gif'); background-repeat: no-repeat; background-position: right; background-color:#efefef; border: 1px solid #555; color:#000; border-top:none;border-right:none;}                 
        .inActive_Tab{margin-left:15px;border:1px solid #777; font-size:12px;font-Weight:normal; padding:0px 3px; line-height:1.5; background-image:url('../Images/bg_InActive.JPG');background-repeat: repeat-x; border-top:none; }
        .expand_Tab{font-size:14px;font-Weight:bold; padding:0px 3px; line-height:1.5; background-image:url('../Images/Arr_Expand.gif');background-repeat: no-repeat;background-position: right 5px; height:22px; border: 1px solid #555; color:maroon; cursor:pointer;  background-color:#55D4FF; }                 
        .collapse_Tab{font-size:12px;font-Weight:bold; padding:0px 3px; line-height:1.5; background-image:url('../Images/Arr_Collapse.gif');background-repeat: no-repeat;background-position: right 5px; height:22px; border: 1px solid #555; color:maroon; cursor:pointer; background-color:#DBDBDB; }                 
        .LableWidth{width:155px; } 
        .ContentWidth { width:165px; height:22px;}
        a.ed:hover {color:#000;}  
        .detail_Bg{background-color: #eee; width: 94.2%; padding:10px;}
        .codeWidth{width:52px;}
        .codeTextbox{width:50px;}
        .detail_Footer{ width:110px; margin-top:50px; margin-left:188px;} 
        #dtlScrollDiv{overflow-x: hidden; overflow-y: scroll;} 
        a.tip {text-decoration: none; }
        a.tip:hover {cursor:pointer;position: relative; }
        a.tip span {display: none; }
        a.tip:hover span { border: #c0c0c0 1px solid;background:#FFE0C0;padding: 3px;display: block;z-index: 100;
                           width:200px;left: 0px;margin-left: 62px;position: absolute;top: -1px;text-decoration: none; }              
    </style>
</head>
<body>
    <form id="CdslForm" runat="server">
        <div id="MainDiv">
            <div id="Header" class="Header">
                Add Value In Master Tables</div>
            <div id="pageCont">
                <div class="left">
                    <div id="tabCont" class="left">
                        <a href="javascript:void(0)" onclick="fn_AccordTab('CDSL_Tab')">
                            <div id="divCDSL" class="expand_Tab">
                                CDSL Master</div>
                        </a>
                        <div id="divCDSL_Cont">
                            <a href="javascript:void(0);" onclick="fn_divTab('Geographical')">
                                <div id="divGeographical" class="active_Tab">
                                    Geographical
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('AnnualIncome')">
                                <div id="divAnnualIncome" class="inActive_Tab">
                                    AnnualIncome
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('Nationality')">
                                <div id="divNationality" class="inActive_Tab">
                                    Nationality
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('Education')">
                                <div id="divEducation" class="inActive_Tab">
                                    Education
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('LegalStatus')">
                                <div id="divLegalStatus" class="inActive_Tab">
                                    LegalStatus
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('Language')">
                                <div id="divLanguage" class="inActive_Tab">
                                    Language
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('PanExemption')">
                                <div id="divPanExemption" class="inActive_Tab">
                                    PanExemption
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('CdslOccupation')">
                                <div id="divCdslOccupation" class="inActive_Tab">
                                    Occupation
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('Currency')">
                                <div id="divCurrency" class="inActive_Tab">
                                    Currency
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('CDSLStaticData')">
                                <div id="divCDSLStaticData" class="inActive_Tab">
                                    CDSLStaticDataCode
                                </div>
                            </a>
                        </div>
                        <a href="javascript:void(0)" onclick="fn_AccordTab('KRA_Tab')">
                            <div id="divKRA" class="collapse_Tab">
                                KRA Master</div>
                        </a>
                        <div id="divKRA_Cont" style="display: none;">
                            <a href="javascript:void(0);" onclick="fn_divTab('AddressProof')">
                                <div id="div_AddressProof" class="inActive_Tab">
                                    AddressProof
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('IdentityProof')">
                                <div id="div_IdentityProof" class="inActive_Tab">
                                    IdentityProof
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('PanExemptCategory')">
                                <div id="div_PanExemptCategory" class="inActive_Tab">
                                    PanExemptCategory
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('IndividualStatus')">
                                <div id="div_IndividualStatus" class="inActive_Tab">
                                    IndividualStatus
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('NRIStatusProof')">
                                <div id="div_NRIStatusProof" class="inActive_Tab">
                                    NRIStatusProof
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('NonIndividualStatus')">
                                <div id="div_NonIndividualStatus" class="inActive_Tab">
                                    NonIndividualStatus
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('Occupation')">
                                <div id="div_Occupation" class="inActive_Tab">
                                    Occupation
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('PoliticalConnection')">
                                <div id="div_PoliticalConnection" class="inActive_Tab">
                                    PoliticalConnection
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('MaritalStatus')">
                                <div id="div_MaritalStatus" class="inActive_Tab">
                                    MaritalStatus
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('State')">
                                <div id="div_State" class="inActive_Tab">
                                    State
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('Country')">
                                <div id="div_Country" class="inActive_Tab">
                                    Country
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('ContactType')">
                                <div id="div_ContactType" class="inActive_Tab">
                                    ContactType
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('KRANationality')">
                                <div id="div_KRANationality" class="inActive_Tab">
                                    Nationality
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('KRAAnnualIncome')">
                                <div id="div_KRAAnnualIncome" class="inActive_Tab">
                                    AnnualIncome
                                </div>
                            </a><a href="javascript:void(0);" onclick="fn_divTab('KRAStaticData')">
                                <div id="div_KRAStaticData" class="inActive_Tab">
                                    KRAStaticData
                                </div>
                            </a>
                        </div>
                    </div>
                    <div id="divPanel" class="left panelCont">
                        <dxcp:ASPxCallbackPanel ID="CbpContainer" runat="server" ClientInstanceName="cCbpContainer"
                            OnCallback="CbpContainer_Callback">
                            <PanelCollection>
                                <dxp:panelcontent runat="server">
                                    <div id="divPanelContent">
                                        <div class="divPanelHeader">
                                            Add Data In <span id="spnTable" style="padding-right: 5px; font-weight: bold;"></span>
                                            Master Table</div>
                                        <div id="Row00" class="Row" style="display: none;">
                                            <div class="LFloat_Lable LableWidth">
                                                KycRA</div>
                                            <div class="LFloat_Content ContentWidth">
                                                <dxe:ASPxComboBox ID="CmbKycRA" Width="165px" runat="server" ValueType="System.String"
                                                    ClientInstanceName="cCmbKycRA" SelectedIndex="0">
                                                    <Items>
                                                        <dxe:ListEditItem Value="1" Text="CVL" />
                                                        <dxe:ListEditItem Value="2" Text="NDML" />
                                                        <dxe:ListEditItem Value="3" Text="DotEx" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {fn_CmbKycRA(s.GetValue());}" />
                                                </dxe:ASPxComboBox>
                                            </div>
                                        </div>
                                        <div id="Row0" class="Row">
                                            <div class="LFloat_Lable LableWidth">
                                                Type/FieldName</div>
                                            <div class="LFloat_Content ContentWidth">
                                                <dxe:ASPxComboBox ID="Combo_FeildName" Width="165px" runat="server" ValueType="System.String"
                                                    ClientInstanceName="cCombo_FeildName">
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="divViewCommonLink" class="left">
                                                <a href="javascript:void(0);" onclick="fn_ShowMasterGrid()" style="border: none;">
                                                    <img src="../../images/addnew.gif" width="21px" height="21px" alt="View Records"
                                                        title="View Records" /></a>
                                                <br class="clear" />
                                            </div>
                                        </div>
                                        <div id="Row1" class="Row">
                                            <div class="LFloat_Lable LableWidth">
                                                Description</div>
                                            <div class="LFloat_Content" style="width: 250px;">
                                                <asp:TextBox runat="server" ID="txtDescription" Width="245px"></asp:TextBox></div>
                                        </div>
                                        <div id="Row2" class="Row">
                                            <div id="lblDynamic1" class="LFloat_Lable LableWidth">
                                                Test1
                                            </div>
                                            <div class="LFloat_Content ContentWidth">
                                                <asp:TextBox runat="server" ID="txtDynamic1" Width="160px"></asp:TextBox></div>
                                        </div>
                                        <div id="Row3" class="Row">
                                            <div id="lblDynamic2" class="LFloat_Lable LableWidth">
                                                Test2
                                            </div>
                                            <div class="LFloat_Content ContentWidth">
                                                <asp:TextBox runat="server" ID="txtDynamic2" Width="160px"></asp:TextBox></div>
                                        </div>
                                        <div id="Row4" class="Row">
                                            <div id="lblDynamic3" class="LFloat_Lable LableWidth">
                                                Test3
                                            </div>
                                            <div class="LFloat_Content ContentWidth">
                                                <asp:TextBox runat="server" ID="txtDynamic3" Width="160px"></asp:TextBox></div>
                                        </div>
                                        <div id="Row5" class="Row">
                                            <div id="lblDynamic4" class="LFloat_Lable LableWidth">
                                                Test4
                                            </div>
                                            <div class="LFloat_Content ContentWidth">
                                                <asp:TextBox runat="server" ID="txtDynamic4" Width="160px"></asp:TextBox></div>
                                        </div>
                                        <div id="Row6" class="Row">
                                            <div id="lblDynamic5" class="LFloat_Lable LableWidth">
                                                Test5
                                            </div>
                                            <div class="LFloat_Content ContentWidth">
                                                <asp:TextBox runat="server" ID="txtDynamic5" Width="160px"></asp:TextBox></div>
                                        </div>
                                        <div id="Row7" class="Row">
                                            <div id="lblDynamic6" class="LFloat_Lable LableWidth">
                                                Test6
                                            </div>
                                            <div class="LFloat_Content ContentWidth">
                                                <asp:TextBox runat="server" ID="txtDynamic6" Width="160px"></asp:TextBox></div>
                                        </div>
                                        <div id="Row8" class="Row">
                                            <div id="lblDynamic7" class="LFloat_Lable LableWidth">
                                                Test7
                                            </div>
                                            <div class="LFloat_Content ContentWidth">
                                                <asp:TextBox runat="server" ID="txtDynamic7" Width="160px"></asp:TextBox></div>
                                        </div>
                                        <div id="Row9" class="Row">
                                            <div id="lblDynamic8" class="LFloat_Lable LableWidth">
                                                Test8
                                            </div>
                                            <div class="LFloat_Content ContentWidth">
                                                <asp:TextBox runat="server" ID="txtDynamic8" Width="160px"></asp:TextBox></div>
                                        </div>
                                    </div>
                                    <br class="clear" />
                                    <br class="clear" />
                                    <center>
                                        <dxe:ASPxButton ID="Btndone" runat="server" AutoPostBack="False" ClientInstanceName="cBtndone"
                                            Text="[S]ave" Width="150px" AccessKey="S">
                                            <ClientSideEvents Click="function (s, e) {Btndone_Click();}" />
                                        </dxe:ASPxButton>
                                    </center>
                                    <br class="clear" />
                                    <%--<a href="javascript:ShowHideFilter(ActiveObject);" onclick="fn_divTab(ta)"><span
                                        style="color: Blue; text-decoration: underline; vertical-align: bottom; font-size: 12px">
                                        Bulk Import</span></a>--%>
                                </dxp:panelcontent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="function (s, e) {CbpContainer_EndCallBack();}" />
                        </dxcp:ASPxCallbackPanel>
                        <br class="clear" />
                    </div>
                </div>               
                <div id="divGvExistsInfo" class="left panelCont" style="display: none; width: 430px;
                    margin-left: 8px;">
                    <div class="divPanelHeader" style="font-size: 12px;">
                        Similar <b><span id="SpnMatchTable"></span></b>&nbsp; Values Exists. Continue To
                        Add
                    </div>
                    <div id="DGEI_Row1">
                        <dxwgv:ASPxGridView ID="GvExistsInfo" ClientInstanceName="cGvExistsInfo" runat="server"
                            AutoGenerateColumns="false" Settings-ShowVerticalScrollBar="true" OnCustomCallback="GvExistsInfo_CustomCallback">
                            <ClientSideEvents EndCallback="function (s, e) {GvExistsInfo_EndCallBack();}" />
                            <Settings />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Sr.No" FieldName="RowID" Width="25" VisibleIndex="0">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Description" Width="308" FieldName="Description"
                                    VisibleIndex="1">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="PValue" FieldName="KeyValue" VisibleIndex="1"
                                    Visible="false">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataColumn Width="35">
                                    <DataItemTemplate>
                                        <a href="#" onclick="GvExistsInfo_PerformCallBack('DeleteExistInfo~'+'<%# Eval("KeyValue") %>');">
                                            Delete</a>
                                    </DataItemTemplate>
                                </dxwgv:GridViewDataColumn>
                            </Columns>
                            <Templates>
                                <EmptyDataRow>
                                    No Data Found..</EmptyDataRow>
                            </Templates>
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                        </dxwgv:ASPxGridView>
                    </div>
                    <div id="DGEI_Row2" style="margin-top: 5px;">
                        <div id="lblContinue" style="display: none; font-size: 12px;">
                            Click <b>Continue</b> To Add Record.
                            <br class="Clear" />
                            <br class="Clear" />
                        </div>
                        <div id="Col1" class="left" style="margin-right: 5px;">
                            <dxe:ASPxButton ID="BtnContinue" ClientInstanceName="cBtnContinue" runat="server"
                                AutoPostBack="False" Text="[C]ontinue" Width="150px" AccessKey="C">
                                <ClientSideEvents Click="function (s, e) {GvExistsInfo_PerformCallBack('Continue');}" />
                            </dxe:ASPxButton>
                        </div>
                        <div id="Col2">
                            <dxe:ASPxButton ID="BtnCancel" runat="server" AutoPostBack="False" Text="Cancel"
                                Width="150px">
                                <ClientSideEvents Click="function (s, e) {GvExistsInfo_PerformCallBack('Cancel');}" />
                            </dxe:ASPxButton>
                        </div>
                    </div>
                </div>
            </div>
            <dxpc:ASPxPopupControl ID="PopUp_ScripAlert" runat="server" ClientInstanceName="cPopUp_ScripAlert"
                Width="740px" HeaderText="Excel Import" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle"
                CloseAction="OuterMouseClick" Modal="True" Height="250px">
                <ContentCollection>
                    <dxpc:PopupControlContentControl runat="server">
                        <div>
                            <center>
                                <div style="font-weight: bold; color: black; background-color: gainsboro; border-right: silver thin solid;
                                    border-top: silver thin solid; border-left: silver thin solid; border-bottom: silver thin solid;">
                                    With Excel Header
                                </div>
                            </center>
                            <br />
                            <center>
                                <div>
                                    <b style="text-align: right" id="B_Header" runat="server"></b>
                                </div>
                            </center>
                            <br />
                            <br />
                        </div>
                        <div>
                            <div id="divbtnexcel">
                                <dxe:ASPxButton ID="btnexcel" runat="server" AutoPostBack="False" Text="Create Excel">
                                    <ClientSideEvents Click="function (s, e) {btnexcel_Click();}" />
                                </dxe:ASPxButton>
                            </div>
                            <br class="clear" />
                            <div id="divnext" style="width: 600px">
                                <div id="row5_col1" class="Info left">
                                    Please Save as The Excel Formatted File In Your Device. And Fill Contents In Excel
                                    Which You Want To Save. Then Click Next Button To Import The Excel Sheet !! !!
                                </div>
                                <div style="margin-left: 25px; margin-top: 20px;" class="left">
                                    <dxe:ASPxButton ID="btnnext" runat="server" AutoPostBack="False" Text="Next &gt;&gt;">
                                        <ClientSideEvents Click="function (s, e) {btnnext_Click();}" />
                                    </dxe:ASPxButton>
                                </div>
                            </div>
                            <div id="divimportexcel">
                                <div class="left">
                                    <asp:FileUpload ID="FileUpload" runat="server" Width="272px" />
                                </div>
                                <div class="left" style="margin-left: 25px;">
                                    <dxe:ASPxButton ID="btnimportexcel" runat="server" AutoPostBack="False" Text="Import Excel">
                                        <ClientSideEvents Click="function (s, e) {btnimportexcel_Click();}" />
                                    </dxe:ASPxButton>
                                </div>
                            </div>
                        </div>
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle BackColor="LightGray" ForeColor="Black" />
            </dxpc:ASPxPopupControl>
        </div>
        <div id="divCommonGvw">
            <dxpc:ASPxPopupControl ID="Popup_CommonGvw" runat="server" ClientInstanceName="cPopup_CommonGvw"
                Width="950px" HeaderText="View Master Table" PopupHorizontalAlign="WindowCenter"
                Height="300px" PopupVerticalAlign="WindowCenter" CloseAction="none" ShowCloseButton="false"
                Modal="True">
                <ContentCollection>
                    <dxpc:PopupControlContentControl ID="PopupCommonGvwCont" runat="server">
                        <div id="divFilterGvw" class="paging">
                            <div class="right">
                                <a href="javascript:void(0);" style="border: none;" onclick="fn_btnCloseGvw()">
                                    <img src="../Images/btn_GvwClose.png" style="border: none; padding: 1px;" alt="close"
                                        title="close" /></a>
                            </div>
                            <div class="left" style="padding: 1.5px; margin-top: 2px;">
                                <a class="number_box" style="padding: 0px 2px 0px 2px;" href="javascript:ShowHideGvwFilter('s');">
                                    Show Filter</a> <a class="number_box" style="padding: 0px 2px 0px 2px;" href="javascript:ShowHideGvwFilter('All');">
                                        All Records</a></div>
                        </div>
                        <div id="divGvwContent">
                            <dxwgv:ASPxGridView ID="gvwCommon" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                                KeyFieldName="ID" Width="99.7%" OnHtmlRowCreated="gvwCommon_HtmlRowCreated" OnCustomCallback="gvwCommon_CustomCallback">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="No." Visible="False" Width="5%" FixedStyle="Left"
                                        VisibleIndex="0">
                                        <DataItemTemplate>
                                            <%#Container.ItemIndex+1 %>
                                        </DataItemTemplate>
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Description" FieldName="Description" Width="60%"
                                        FixedStyle="Left" Visible="True" VisibleIndex="1">
                                        <CellStyle CssClass="gridcellleft" Wrap="True">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="CDSL Code" FieldName="CDSLCode" Visible="True"
                                        Width="30%" VisibleIndex="2">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="CVL Code" FieldName="CVLCode" Visible="True"
                                        Width="10%" VisibleIndex="3">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="NDML Code" FieldName="NDMLCode" Visible="True"
                                        Width="10%" VisibleIndex="4">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="DOTEX Code" FieldName="DOTEXCode" Visible="True"
                                        Width="10%" VisibleIndex="5">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Width="25%" VisibleIndex="6" Visible="true">
                                        <DataItemTemplate>
                                            <a class="ed" href="javascript:void(0);" onclick="fn_EditCommonMaster('<%# Container.KeyValue %>')">
                                                Edit</a> <a class="ed" href="javascript:void(0);" onclick="fn_DeleteCommonMaster('<%# Container.KeyValue %>')">
                                                    Delete</a>
                                        </DataItemTemplate>
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <ClientSideEvents EndCallback="function (s, e) {grid_EndCallBack();}" />
                            </dxwgv:ASPxGridView>
                        </div>
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle BackColor="LightGray" ForeColor="Black" />
            </dxpc:ASPxPopupControl>
        </div>
        <div id="divPopupDetail">
            <dxpc:ASPxPopupControl ID="Popup_Detail" runat="server" ClientInstanceName="cPopup_Detail"
                Width="410px" HeaderText="View Master Table's Detail" PopupHorizontalAlign="WindowCenter"
                Height="100px" PopupVerticalAlign="WindowCenter" CloseAction="CloseButton" Modal="True">
                <ContentCollection>
                    <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                        <div class="detail_Bg">
                            <div id="dtl1" class="Row">
                                <div class="LFloat_Lable LableWidth">
                                    Description</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtCommonDescription" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div id="dtl2" class="Row">
                                <div class="LFloat_Lable LableWidth">
                                    CDSL Code</div>
                                <div class="LFloat_Content codeWidth">
                                    <a href="javascript:void(0);" class='tip' style="color: #BF6A15">
                                        <dxe:ASPxTextBox ID="txtCdslCode" ClientInstanceName="ctxtCdslCode" ClientEnabled="true"
                                            runat="server" CssClass="codeTextbox" ReadOnly="true">
                                        </dxe:ASPxTextBox>
                                        <span>Code Not Changable From Here. </span></a>
                                </div>
                            </div>
                            <div id="dtl3" class="Row">
                                <div class="LFloat_Lable LableWidth">
                                    CVL Code</div>
                                <div class="LFloat_Content codeWidth">
                                    <a href="javascript:void(0);" class='tip' style="color: #BF6A15">
                                        <dxe:ASPxTextBox ID="txtCvlCode" ClientInstanceName="ctxtCvlCode" ClientEnabled="true"
                                            runat="server" CssClass="codeTextbox" ReadOnly="true">
                                        </dxe:ASPxTextBox>
                                        <span>Code Not Changable From Here. </span></a>
                                </div>
                            </div>
                            <div id="dtl4" class="Row">
                                <div class="LFloat_Lable LableWidth">
                                    NDML Code</div>
                                <div class="LFloat_Content codeWidth">
                                    <a href="javascript:void(0);" class='tip' style="color: #BF6A15">
                                        <dxe:ASPxTextBox ID="txtNdmlCode" ClientInstanceName="ctxtNdmlCode" ClientEnabled="true"
                                            runat="server" CssClass="codeTextbox" ReadOnly="true">
                                        </dxe:ASPxTextBox>
                                        <span>Code Not Changable From Here. </span></a>
                                </div>
                            </div>
                            <div id="dtl5" class="Row">
                                <div class="LFloat_Lable LableWidth">
                                    DOTEX Code</div>
                                <div class="LFloat_Content codeWidth">
                                    <a href="javascript:void(0);" class='tip' style="color: #BF6A15">
                                        <dxe:ASPxTextBox ID="txtDotexCode" ClientInstanceName="ctxtDotexCode" ClientEnabled="true"
                                            runat="server" CssClass="codeTextbox" ReadOnly="true">
                                        </dxe:ASPxTextBox>
                                        <span>Code Not Changable From Here. </span></a>
                                </div>
                            </div>
                            <div id="dtl01" class="Row">
                                <div id="lblTest1" class="LFloat_Lable LableWidth">
                                    Test1</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtTest1" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div id="dtl02" class="Row">
                                <div id="lblTest2" class="LFloat_Lable LableWidth">
                                    Test2</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtTest2" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div id="dtl03" class="Row">
                                <div id="lblTest3" class="LFloat_Lable LableWidth">
                                    Test3</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtTest3" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div id="dtl04" class="Row">
                                <div id="lblTest4" class="LFloat_Lable LableWidth">
                                    Test4</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtTest4" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div id="dtl05" class="Row">
                                <div id="lblTest5" class="LFloat_Lable LableWidth">
                                    Test5</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtTest5" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div id="dtl06" class="Row">
                                <div id="lblTest6" class="LFloat_Lable LableWidth">
                                    Test6</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtTest6" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div id="dtl07" class="Row">
                                <div id="lblTest7" class="LFloat_Lable LableWidth">
                                    Test7</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtTest7" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div id="dtl08" class="Row">
                                <div id="lblTest8" class="LFloat_Lable LableWidth">
                                    Test8</div>
                                <div class="LFloat_Content ContentWidth">
                                    <asp:TextBox ID="txtTest8" runat="server" Width="160px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="detail_Footer">
                                <div class="right">
                                    <dxe:ASPxButton ID="btnDetailCancel" ClientInstanceName="cBtnDetailCancel" runat="server"
                                        AutoPostBack="False" Text="Cancel">
                                        <ClientSideEvents Click="function (s, e) {fn_BtnDetailCancel();}" />
                                    </dxe:ASPxButton>
                                </div>
                                <div class="left">
                                    <dxe:ASPxButton ID="btnDetailSave" ClientInstanceName="cBtnDetailSave" runat="server"
                                        AutoPostBack="False" Text="Save">
                                        <ClientSideEvents Click="function (s, e) {fn_BtnDetailSave();}" />
                                    </dxe:ASPxButton>
                                </div>
                                <br class="clear" />
                            </div>
                            <br class="clear" />
                        </div>
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle BackColor="LightGray" ForeColor="Black" />
            </dxpc:ASPxPopupControl>
        </div>
        <div style="display: none;">
            <asp:Button ID="BtnForExportEvent" runat="server" OnClick="cmbExport_SelectedIndexChanged"
                BackColor="#DDECFE" BorderStyle="None" />
            <asp:Button ID="BtnForimportEvent" runat="server" OnClick="cmbImport_SelectedIndexChanged1"
                BackColor="#DDECFE" BorderStyle="None" />
            <asp:HiddenField ID="hdnhedeartext" runat="server" />
            <asp:HiddenField ID="hdntablename" runat="server" />
            <asp:HiddenField runat="server" ID="hdnEditID" />
            <asp:HiddenField runat="server" ID="hdnCommonGridBind" />
        </div>
    </form>
</body>
</html>
