<%@ page language="C#" autoeventwireup="true" inherits="Reports_changedpacc_cheque, App_Web_rvnctcoh" %>

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
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
 <%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
    <%--<link href="../CSS/style.css" rel="stylesheet" type="text/css" />--%>
    <%--<script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>--%>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <%--<link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />--%>
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <%--<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>--%>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    

    <style type="text/css">    
    form {
		    display:inline;	
		    	
	    }
	 .frmleftCont{float:left; background-color: #B7CEEC;margin:2px; padding:2px; height:26px; border: solid 1px  #D1E0F3; font-size:12px;}
   
	</style>

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

    </script>

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
	
	/*Tooltip*/
	 /* trigger button */
  #download_now {
    background:transparent url(../images/RightNav.gif) no-repeat scroll 0 0;
    display:block;
    height:44px;
    margin: 0 auto;
    margin-bottom:30px;
    overflow:hidden;
    text-indent:-999em;
    width:159px;
    cursor:pointer;
  }
 
  /* mouseover state */
  #download_now:hover {
    background-position:0 -44px;
  }
 
  /* clicked state */
  #download_now:focus {
    background-position:0 -88px;
  }
 
  /* tooltip styling */
  .tooltip {
    display:none;
    background:url(../images/RightNav.gif);
    height:163px;
    padding:40px 30px 10px 30px;
    width:310px;
    font-size:11px;
    color:#fff;
  }
 
  /* a .label element inside tooltip */
  .tooltip .label {
    color:yellow;
    width:35px;
  }
 
  .tooltip a {
    color:#ad4;
    font-size:11px;
    font-weight:bold;
  }
  
	
	</style>

    <script language="javascript" type="text/javascript">
    var RowID
    function OnGridFocusedRowChanged() 
    {
        gridfinal.GetSelectedFieldValues('CashBankDetail_ID', OnGetRowValues);
        
    }
    function OnGetRowValues(values) 
    {
//     cbAll.checked = true;
//        cbAll.SetChecked=true;
    //RowID = values;
    
        RowID = 'n';
        for(var j = 0; j < values.length; j ++) {
            if(RowID != 'n')
                RowID += ',' + values[j];
            else
            
                RowID = values[j];
                
              
               document.getElementById("hdnfrequency").value=RowID
               
        }
        //alert(counter+'test');
    }
   
    function OnAllCheckedChanged(s, e) {

  if (s.GetChecked())
  {
        
     gridfinal.SelectRows();

     }
   
  else
  {
    
     gridfinal.UnselectRows();
     }

}

function OnGridSelectionChanged(s, e) {

  cbAll.SetChecked(s.GetSelectedRowCount() == s.cpVisibleRowCount);
  alert(cpVisibleRowCount);
  

}
var _handle = true;



function OnPageCheckedChanged(s, e) {

  _handle = false;

  if (s.GetChecked())

    gridasset.SelectAllRowsOnPage();

  else

    gridasset.UnselectAllRowsOnPage();

}
var _selectNumber = 0;  // the number of selected rows within the page



function OnGridSelectionChanged(s, e) {

    cbAll.SetChecked(s.GetSelectedRowCount() == s.cpVisibleRowCount);

            if (e.isChangedOnServer == false) {
                if (e.isAllRecordsOnPage && e.isSelected)
                    _selectNumber = s.GetVisibleRowsOnPage();
                else if (e.isAllRecordsOnPage && !e.isSelected)
                    _selectNumber = 0;
                else if (!e.isAllRecordsOnPage && e.isSelected)
                    _selectNumber++;
                else if (!e.isAllRecordsOnPage && !e.isSelected)
                    _selectNumber--;

                if (_handle) {
                    cbPage.SetChecked(_selectNumber == s.GetVisibleRowsOnPage());
                    _handle = false;
                }
                _handle = true;
               
            }
            else {
                cbPage.SetChecked(cbAll.GetChecked());
               
            }
        }

var _selectNumber = 0;  // the number of selected rows within the page



function OnGridSelectionChanged(s, e) {

    cbAll.SetChecked(s.GetSelectedRowCount() == s.cpVisibleRowCount);

            if (e.isChangedOnServer == false) {
                if (e.isAllRecordsOnPage && e.isSelected)
                    _selectNumber = s.GetVisibleRowsOnPage();
                else if (e.isAllRecordsOnPage && !e.isSelected)
                    _selectNumber = 0;
                else if (!e.isAllRecordsOnPage && e.isSelected)
                    _selectNumber++;
                else if (!e.isAllRecordsOnPage && !e.isSelected)
                    _selectNumber--;

                if (_handle) {
                    cbPage.SetChecked(_selectNumber == s.GetVisibleRowsOnPage());
                    _handle = false;
                }
                _handle = true;
               
            }
            else {
                cbPage.SetChecked(cbAll.GetChecked());
               
            }
        }


    
    
    </script>

    <script language="javascript" type="text/javascript">
//     function gridasset_EndCallBack()
//     {
//        //OnAllCheckedChanged(s, e);
//        
//        height();
//     }
 FieldName='Button1';
     
      function Page_Load()
        {
        HideShow('divstage3',"S");
        HideShow('Tblfooterfinal',"H");
            height();
           
        }
        function visibilefalse()
            {
                HideShow('divreportprv',"S");
                HideShow('divreportprint',"H");
                HideShow('divreportbtn',"H");
                var H = document.getElementById('div1');
                    H.style.width="150px";
            }
        function alerttest()
        {
         var sessiononclose ="<%=Session["Test"]%>";
             alert(sessiononclose);
        }
function ShowHideFilter2(obj)
     {
        gridprv.PerformCallback(obj);
   
     }
     function ShowHideFilter3(obj)
     {
        gridfinal.PerformCallback(obj);
   
     }
     function hideshow()
     {
     HideShow('divreportbtn',"H");
     var d = document.getElementById('div1');
     d.style.width="325px";
     }
function gridpreview_EndCallBack()
     {
      
    
        height();
     }     
function gridassetfinal_EndCallBack()
     {
     if(gridfinal.cpproperties=="pdf")
        {
        
            document.getElementById('BtnForExportEvent1').click();                                    
        }
        
        
        
        if(gridfinal.cpproperties=="false")
        {
        
            HideShow('divstage3',"S");
        HideShow('Tblfooterfinal',"H");                                    
        }
        if(gridfinal.cpproperties=="update")
        {
            alert('Update Successfully');
            parent.editwin.close();
        }

        height();
     }

function btnprint_Click()
    {
          
                HideShow('Tblfooterfinal',"S");
                HideShow('divstage3',"H");
                gridfinal.PerformCallback("pdftoprint~");
    } 
function btnreport_Click()
    {
    document.getElementById('BtnForExportEvent').click();
    
    }     
function btndone_Click()
    {
            
           height();
            if (RowID==undefined || RowID=='n')
            {
                 HideShow('Tblfooterfinal',"S");
                HideShow('divstage3',"H");
                alert ('Please Select Atleast one Item !!..');
            }
            else
            {

                HideShow('Tblfooterfinal',"S");
                HideShow('divstage3',"H");
                var dialouge
        if (RowID==undefined || RowID=='n')
            dialouge="Are You Sure none of this Cheques printed Correctly ??";
        else
            dialouge="Are You Sure Selected Cheques printed Correctly ??";
        var answer = confirm (dialouge);
        if (answer==true)
        {
            var answer1 = confirm (dialouge);
            if(answer1==true)
            {
                var answer2 = confirm (dialouge);
                if(answer2==true)
                {
                    perforcallbackgrid();
                }

            }
         }
             
      }
    }
    
    
   function perforcallbackgrid()
    {
        gridfinal.PerformCallback("Done~");
    }

    
function btnprv_Click()
    {
    var dialouge

            dialouge="Are You Sure none of this Cheques printed Correctly ??";

        var answer = confirm (dialouge);
        if (answer==true)
        {
            var answer1 = confirm (dialouge);
            if(answer1==true)
            {
                var answer2 = confirm (dialouge);
                if(answer2==true)
                {
                     HideShow('divstage3',"S");
                     HideShow('Tblfooterfinal',"H");
                     height();
                     gridprv.PerformCallback("Cancel~~~");
                }

            }
         }
    
       
    }

function btnCancel_Click()
    {
       var dialouge

            dialouge="Are You Sure To Cancel All the Process and Go to First Stage Without Updation ??";

        var answer = confirm (dialouge);
        if (answer==true)
        {
            var answer1 = confirm (dialouge);
            if(answer1==true)
            {
                var answer2 = confirm (dialouge);
                if(answer2==true)
                {
                    closewindow();
                }

            }
         }
     }


function btnprevious_Click()
    {
    //alerttest();
        parent.editwin.close();
    }  
       
  //parent.editwin.onclose=function(){
//editwin.onclose=function(){

//var returnval=confirm("You are about to close this window. Are you sure?")
//return returnval
////if (returnval==true)
////    closewindow();

//}
function closewindow()
    {
        parent.editwin.close();
//        alert('123');
//        window.location="../Reports/test_chequeprint.aspx";
    }
function Btnnext_Click()
        {
            var txt=chq.GetText();
         if (txt.length>0)
         {
            var dt=ChangeDateFormat_CalToDB(dtDateinstru.GetDate());
                HideShow('Tblfooter',"H");
                HideShow('divPageheader',"H");
                HideShow('divstage3',"S");
                gridprv.PerformCallback("Show~"+txt+"~"+dt);
          }
                 else
                    alert('Please Fill Cheque Number');
        }
         
       function SignOff()
        {
            window.parent.SignOff();
        }
         FieldName='Button1';
       
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
            window.frameElement.widht = document.body.scrollWidht;
        }
        
 function PopulateGrid(obj)
 {
   grid.PerformCallback(obj);
 }

	   
	          
	    
	    
	    

	    
	   
       
        
	    

    
    
      
    
   
       
    </script>

    <script type="text/ecmascript">
        


            

        

            
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <div class="TableMain100">
                <div class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">ChequePrint Routine</span></strong>
                </div>
            </div>
            <div id="divstage3">
                <div>
                    <div class="left" style="width: 70px;">
                        <a href="javascript:ShowHideFilter2('s2');"><span style="color: Gray; text-decoration: underline;
                            font-size: 12px">Search</span></a>
                    </div>
                    <div class="left" style="width: 70px;">
                        <a href="javascript:ShowHideFilter2('All2');"><span style="color: Gray; text-decoration: underline;
                            font-size: 12px">ShowAll</span></a>
                    </div>
                    <span class="clear" style="height: 5px;">&nbsp;</span>
                </div>
                <dxwgv:ASPxGridView ID="gridpreview" runat="server" AutoGenerateColumns="False" KeyFieldName="CashBankDetail_ID"
                    Width="95%" ClientInstanceName="gridprv" OnCustomCallback="gridpreview_CustomCallback"
                    OnPageIndexChanged="gridpreview_PageIndexChanging">
                    <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                    <Styles>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                        <%--<Header ImageSpacing="5px" SortingImageSpacing="5px" CssClass="gridheader">
                        </Header>--%>
                        <FocusedGroupRow CssClass="gridselectrow">
                        </FocusedGroupRow>
                        <FocusedRow CssClass="gridselectrow">
                        </FocusedRow>
                    </Styles>
                    <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                        PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                        EditFormColumnCount="1" />
                    <SettingsText PopupEditFormCaption="Add/Modify " ConfirmDelete="Are you sure to Delete this Record!" />
                    <ClientSideEvents EndCallback="function(s, e) {gridpreview_EndCallBack();}" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="MainAccount_Name" ReadOnly="true" Caption="Account Name"
                            VisibleIndex="1" Width="15%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="cashbank_vouchernumber" ReadOnly="true"
                            Caption="Voucher No." VisibleIndex="2" Width="5%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CashBank_TransactionDate" ReadOnly="true"
                            Caption="Transaction Dt." VisibleIndex="3" Width="6%">
                            <CellStyle CssClass="gridcellleft" Wrap="true">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="4" Width="6%" FieldName="Payment" ReadOnly="true"
                            Caption="Ammount">
                            <CellStyle CssClass="gridcellleft" Wrap="true" HorizontalAlign="Right">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Account No With Bank" FieldName="accountname"
                            ReadOnly="true" VisibleIndex="8" Width="22%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Inst.No." FieldName="CashBankDetail_InstrumentNumber"
                            VisibleIndex="9" ReadOnly="true" Width="6%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Inst.Date" FieldName="CashBankDetail_InstrumentDate"
                            VisibleIndex="10" ReadOnly="true" Width="6%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="accid" FieldName="cbd_bankCode" VisibleIndex="9"
                            Visible="false">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Clientid" FieldName="CashBankDetail_Subaccountid"
                            VisibleIndex="10" Visible="false">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="true" />
                    <Settings ShowHorizontalScrollBar="false" ShowGroupButtons="False" ShowGroupPanel="false"
                        ShowStatusBar="Hidden" />
                </dxwgv:ASPxGridView>
                <span class="clear" style="height: 5px;">&nbsp;</span>
                <center>
                    <div id="div1" class="frmContent" style="width: 500px;" >
                        <div class="frmleftContent" style="width: 110px; line-height: 20px" id="divreportprv">
                            <dxe:ASPxButton ID="btnprevious" runat="server" AutoPostBack="False" Text="<< PRE[V]IOUS"
                                Width="100px" AccessKey="V">
                                <ClientSideEvents Click="function (s, e) {btnprevious_Click();}" />
                            </dxe:ASPxButton>
                            <%--<input id="Button2" type="button" value="Cancel" class="btnUpdate" onclick="btnprevious_Click()"
                                                style="width: 60px"  />--%>
                        </div>
                        <div class="frmleftCont" style="width: 180px; line-height: 20px" id="divreportprint">
                            <div>
                                
                                <dxe:ASPxButton ID="btnprint" runat="server" AutoPostBack="False" Text="Click To [P]rint Cheque >>"
                                    Width="180px" AccessKey="P">
                                    <ClientSideEvents Click="function (s, e) {btnprint_Click();}" />
                                </dxe:ASPxButton>
                            </div>
                        </div>
                        <div class="frmleftContent" style="width: 110px; line-height: 20px" id="divreportbtn">
                            
                            <dxe:ASPxButton ID="btnreport" runat="server" AutoPostBack="False" Text="Click To Get [B]ranchwise report"
                                    Width="180px" AccessKey="B">
                                    <ClientSideEvents Click="function (s, e) {btnreport_Click();}" />
                                </dxe:ASPxButton>
                        </div>
                    </div>
                </center>
            </div>
            <div id="Tblfooterfinal">
                <%--<div>
                    <span style="color: Red; font-weight: bold">If You Click Close Button Then Update All
                        Cheques</span>
                </div>--%>
                <span class="clear" style="height: 3px;">&nbsp;</span>
                <div>
                    <div class="left" style="width: 70px;">
                        <a href="javascript:ShowHideFilter3('s3');"><span style="color: Gray; text-decoration: underline;
                            font-size: 12px">Search</span></a>
                    </div>
                    <div class="left" style="width: 270px;">
                        <a href="javascript:ShowHideFilter3('All3');"><span style="color: Gray; text-decoration: underline;
                            font-size: 12px">ShowAll</span></a>
                    </div>
                   
                </div>
                <span class="clear" style="height: 5px;">&nbsp;</span>
                <dxwgv:ASPxGridView ID="gridassetfinal" runat="server" AutoGenerateColumns="False"
                    KeyFieldName="CashBankDetail_ID" Width="95%" ClientInstanceName="gridfinal" 
                    OnPageIndexChanged="gridassetfinal_PageIndexChanging" OnCustomCallback="gridassetfinal_CustomCallback">
                    <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                    <Styles>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                        <%--<Header ImageSpacing="5px" SortingImageSpacing="5px" CssClass="gridheader">
                        </Header>--%>
                        <FocusedGroupRow CssClass="gridselectrow">
                        </FocusedGroupRow>
                        <FocusedRow CssClass="gridselectrow">
                        </FocusedRow>
                    </Styles>
                    <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                        PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                        EditFormColumnCount="1" />
                    <SettingsText PopupEditFormCaption="Add/Modify " ConfirmDelete="Are you sure to Delete this Record!" />
                    <ClientSideEvents EndCallback="function(s, e) {gridassetfinal_EndCallBack();}" />
                    <ClientSideEvents SelectionChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                    <Columns>
                       <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Width="2%" VisibleIndex="0" >
                            <HeaderTemplate>
                            
                                <dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select/Deselect all rows"
                                     BackColor="White" OnInit="cbAll_Init">
                                    <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                </dxe:ASPxCheckBox>
                                <%-- <dxe:ASPxCheckBox ID="cbPage" runat="server" ClientInstanceName="cbPage" ToolTip="Select all rows within the page"
                                                        OnInit="cbPage_Init">
                                                        <ClientSideEvents CheckedChanged="OnPageCheckedChanged" />
                                                    </dxe:ASPxCheckBox>--%>
                            </HeaderTemplate>
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="MainAccount_Name" Caption="Account Name"
                            ReadOnly="true" VisibleIndex="1" Width="15%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="cashbank_vouchernumber" Caption="Voucher No."
                            ReadOnly="true" VisibleIndex="2" Width="5%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CashBank_TransactionDate" Caption="Transaction Dt."
                            ReadOnly="true" VisibleIndex="3" Width="6%">
                            <CellStyle CssClass="gridcellleft" Wrap="true">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="4" Width="6%" FieldName="Payment" Caption="Ammount"
                            ReadOnly="true">
                            <CellStyle CssClass="gridcellleft" Wrap="true" HorizontalAlign="Right">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Inst.No." FieldName="CashBankDetail_InstrumentNumber"
                            VisibleIndex="5" ReadOnly="true" Width="6%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Inst.Date" FieldName="CashBankDetail_InstrumentDate"
                            VisibleIndex="6" ReadOnly="true" Width="6%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Account No With Bank" FieldName="accountname"
                            ReadOnly="true" VisibleIndex="7" Width="22%">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="accid" FieldName="cbd_bankCode" VisibleIndex="9"
                            Visible="false">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Clientid" FieldName="CashBankDetail_Subaccountid"
                            VisibleIndex="10" Visible="false">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Left" />
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="true" />
                    <Settings ShowHorizontalScrollBar="false" ShowGroupButtons="False" ShowGroupPanel="false"
                        ShowStatusBar="Hidden" />
                </dxwgv:ASPxGridView>
                 <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                                    </dxwgv:ASPxGridViewExporter>
                <center>
                    <div id="divbtnprv" class="frmContent" style="width: 450px;">
                    <div class="frmleftCont" style="width: 110px; line-height: 20px">
                            <dxe:ASPxButton ID="btnpre" runat="server" AutoPostBack="False" Text="<< P[R]evious"
                                Width="110px" AccessKey="R">
                                <ClientSideEvents Click="function (s, e) {btnprv_Click();}" />
                            </dxe:ASPxButton>
                        </div>
                        <div class="frmleftContent" style="width: 120px; line-height: 20px">
                            <dxe:ASPxButton ID="btndone" runat="server" AutoPostBack="False" Text="[U]PDATE CHEQUES" Width="120px"
                                AccessKey="D">
                                <ClientSideEvents Click="function (s, e) {btndone_Click();}" />
                            </dxe:ASPxButton>
                        </div>
                        <div class="frmleftCont" style="width: 110px; line-height: 20px">
                            <dxe:ASPxButton ID="btncancel" runat="server" AutoPostBack="False" Text="[C]ANCEL"
                                Width="110px" AccessKey="C">
                                <ClientSideEvents Click="function (s, e) {btnCancel_Click();}" />
                            </dxe:ASPxButton>
                        </div>
                    </div>
                </center>
            </div>
        </div>
        <div style="display: none">
            <asp:HiddenField ID="hdnfrequency" runat="server" />
            <asp:Button ID="BtnForExportEvent1" runat="server" OnClick="cmbExport1_SelectedIndexChanged"
                BackColor="#DDECFE" BorderStyle="None" />
            <asp:Button ID="BtnForExportEvent" runat="server" OnClick="cmbExport_SelectedIndexChanged"
                BackColor="#DDECFE" BorderStyle="None" />
        </div>
    </form>
</body>
</html>
