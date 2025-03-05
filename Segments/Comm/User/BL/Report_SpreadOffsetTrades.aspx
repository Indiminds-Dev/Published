<%@ page language="C#" autoeventwireup="true" inherits="Segments_Comm_User_BL_Report_SpreadOffsetTrades, App_Web_kz6j9mpv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Spread Offset Trades Page</title>
    <!--External Styles-->
    <link type="text/css" href="../../../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <!--External Scripts file-->
    <!-- Ajax List Requierd-->
    <link type="text/css" href="../../../../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <script type="text/javascript" src="../../../../CentralData/JSScript/GenericAjaxList.js"></script>
    <script type="text/javascript" src="../../../../CentralData/JSScript/init.js"></script>
    <!--Other Script-->
    <script type="text/javascript" src="../../../../CentralData/JSScript/GenericJScript.js"></script>
    <!--JS Inline Method-->
    <!--Page and Filter Script -->
    <script type="text/javascript" language="javascript">
        function Page_Load()
        { 
           HideShow('Container2','H'); 
           HideShow('Row2','H');                       
           Height('300','300');                              
        }      
	    function SignOff()
        {
            window.parent.SignOff();
        }
        function Reset()
        {       
           cDtPosition.SetDate(new Date());           
           cRblAsset.SetSelectedIndex(0);     
           cCmbGroupBy.SetSelectedIndex(0); 
           cRblBranch.SetSelectedIndex(0);
           cRblClient.SetSelectedIndex(0);
           cRblGroup.SetSelectedIndex(0);
           HideShow('C1_Row2_Col4','H');
           HideShow('C1_Row2_Col5','H');
           HideShow('C1_Row2_Col3','S');         
           SetValue('HDNAsset','');
           SetValue('HDNBranch','');
           SetValue('HDNGroup','');   
           SetValue('HDNClient','');            
           Height('300','300');
           //alert('Reset1');                         
        }
        function DateChange(positionDate)
        {
            var FYS='<%=Session["FinYearStart"]%>';
            var FYE='<%=Session["FinYearEnd"]%>';
            var LFY='<%=Session["LastFinYear"]%>';
            DevE_CheckForFinYear(positionDate,FYS,FYE,LFY);                    
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
        function fn_Asset(obj)
        {  
            if(obj=="A")
            {
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                HideShow('Container2','H');
                HideShow('C1_Row3','S');
            }
            else if(obj=="S")
            {               
                if(GetObjectID('Container2').style.display=="inline")
                {                
                   cRblAsset.SetSelectedIndex(0);     
                   lnkBtnAddFinalSelection();                        	
                }
                else
                {
                   HideShow('Container2','S');
                   HideShow('C1_Row3','H');
                   CallServer("CallAjax-Asset",""); 
                   //GetObjectID('txtSelectionID').focus();
                } 
            }                         
        }     
        function fn_GroupBy(obj)
        {
            GetObjectID('<%=lstSelection.ClientID%>').length=0;             
            if(obj=="B")
            {
                cRblBranch.SetSelectedIndex(0);     
                fn_Branch('A'); 
                if(GetObjectID('C1_Row2_Col4').style.display=='inline')
                        HideShow('C1_Row2_Col4','H');  
                HideShow('C1_Row2_Col5','H');               
                HideShow('C1_Row2_Col3','S');               
                CallServer("CallAjax-Branch",""); 
            }           
            if(obj=="G")                
            { 
                HideShow('C1_Row2_Col3','H');
                if(GetObjectID('C1_Row2_Col4').style.display=='inline')
                        HideShow('C1_Row2_Col4','H'); 
                HideShow('Container2','H');
                HideShow('C1_Row2_Col5','S');
                HideShow('C1_Row2_Col6','H');
                cCmbGroupType.PerformCallback("GroupType~");
             }            
             if(obj=="C")
             { 
                cRblClient.SetSelectedIndex(0);     
                fn_Client('A');                
                HideShow('C1_Row2_Col5','H');
                HideShow('C1_Row2_Col3','H'); 
                HideShow('C1_Row2_Col4','S');
                CallServer("CallAjax-Client","");              
              }
        }      
        function fn_Branch(obj)
        {  
            if(obj=="A")
            {
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                HideShow('Container2','H');
                HideShow('C1_Row3','S');
            }
            else if(obj=="S")
            {               
                if(GetObjectID('Container2').style.display=="inline")
                {                
                   cRblBranch.SetSelectedIndex(0);     
                   lnkBtnAddFinalSelection();                        	
                }
                else
                {
                   HideShow('Container2','S');
                   HideShow('C1_Row3','H');
                   CallServer("CallAjax-Branch",""); 
                   //GetObjectID('txtSelectionID').focus();
                } 
            }                         
        }
        function CmbGroupType_EndCallback()
        {
           if(cCmbGroupType.cpBindGroupType!=undefined)
           {
               if(cCmbGroupType.cpBindGroupType=="Y")
               {
                    cCmbGroupType.SetSelectedIndex(0);  
                    SetValue('HDNGroup','');                        
               }
               else if(cCmbGroupType.cpBindGroupType=="N")
               {
                    cCmbGroupType.SetEnabled(false);                   
               }
           }          
           Height('300','300');
        }
        function fn_CmbGroupType(obj)
        {
            if(obj=="0")
            {
               HideShow('C1_Row2_Col6','H');
               alert('Please Select Group Type !');
               cbtnShow.SetEnabled(false);
            }
            else
            {
               cRblGroup.SetSelectedIndex(0);     
               HideShow('C1_Row2_Col6','S');
               cbtnShow.SetEnabled(true);
            }
            Height('300','300');
        }      
        function fn_Group(obj)
        {  
            if(obj=="A")
            {
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                HideShow('Container2','H');
                HideShow('C1_Row3','S');
            }
            else if(obj=="S")
            {               
                if(GetObjectID('Container2').style.display=="inline")
                {                
                   cRblGroup.SetSelectedIndex(0);     
                   lnkBtnAddFinalSelection();                        	
                }
                else
                {
                   HideShow('Container2','S');
                   HideShow('C1_Row3','H');
                   CallServer("CallAjax-Group~"+cCmbGroupType.GetText(),"");
                   //GetObjectID('txtSelectionID').focus();
                } 
            }                         
        }
        function fn_Client(obj)
        {  
            if(obj=="A")
            {
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                HideShow('Container2','H');
                HideShow('C1_Row3','S');
                CallServer("CallAjax-Client",""); 
            }
            else if(obj=="S")
            {               
                if(GetObjectID('Container2').style.display=="inline")
                {                
                   cRblClient.SetSelectedIndex(0);     
                   lnkBtnAddFinalSelection();                        	
                }
                else
                {
                   HideShow('Container2','S');
                   HideShow('C1_Row3','H');
                   CallServer("CallAjax-Client",""); 
                   //GetObjectID('txtSelectionID').focus();
                } 
            }                         
        }        
        function NORECORD()
        {            
             alert('No Record Found !!!');  
             Reset();                    
        }
        function ErrorMsg(msg)
        {
            if(msg=="BranchErr")
                alert("There is No Proper Branch Selection!!!");
            else if(msg=="GroupErr")
                alert("There is No Proper Group Selection!!!");
            else if(msg=="ClientErr")
                alert("There is No Proper Client Selection!!!");
            else if(msg=="AssetErr")
                alert("There is No Proper Asset Selection!!!");
        } 
    </script>

    <!-- CallAjax and Receive Server Script-->

    <script language="javascript" type="text/javascript">       
        FieldName='none';
        function btnAddToList_click()
        {
            var txtName = GetObjectID('txtSelectionID');
            if(txtName != '')
            {
                var txtId = GetValue('txtSelectionID_hidden');
                var listBox = GetObjectID('lstSelection');
                var listLength = listBox.length;               
                var opt = new Option();
                opt.value = txtId;
                opt.text = txtName.value;
                listBox[listLength]=opt;
                txtName.value='';
            }
            else
                alert('Please Search Name And Then Add!');
            txtName.focus();
            txtName.select();   
        }
        function lnkBtnAddFinalSelection()
	    {
	        var listBox = GetObjectID('lstSelection');         
            var listID='';
            var i;
            if(listBox.length > 0)
            {                             
                for(i=0;i<listBox.length;i++)
                {
                    if(listID == '')
                        listID = listBox.options[i].value+'!'+listBox.options[i].text;
                    else
                        listID += '^' + listBox.options[i].value+'!'+listBox.options[i].text;
                }
                CallServer(listID,"");  
                var j;
                for(j=listBox.options.length-1;j>=0;j--)
                {
                    listBox.remove(j);
                } 
                HideShow('Container2','H');
                HideShow('C1_Row3','S');                    
            }
            else if((GetObjectID('Container2').style.display=="inline") && (listBox.length == 0))
            { 
                if(cRblAsset.GetSelectedIndex()==1)
                {
                   alert("Please Select Atleast One Asset Item!!!");                    
                }             
                else if((cCmbGroupBy.GetSelectedIndex()==0) && (cRblBranch.GetSelectedIndex()==1) && (cRblAsset.GetSelectedIndex()==0))
                {             
                    alert("Please Select Atleast One Branch Item!!!");
                }
                else if((cCmbGroupBy.GetSelectedIndex()==1) && (cRblGroup.GetSelectedIndex()==1) && (cRblAsset.GetSelectedIndex()==0))
                {             
                     alert("Please Select Atleast One Group Item!!!");
                }
                else if((cCmbGroupBy.GetSelectedIndex()==2) && (cRblClient.GetSelectedIndex()==1) && (cRblAsset.GetSelectedIndex()==0))
                {             
                     alert("Please Select Atleast One Client Item!!!");
                }                        
            }
	    }
	    function lnkBtnRemoveFromSelection()
        {   
            var listBox = GetObjectID('lstSelection');
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
        function ReceiveServerData(rValue)
        {            
            var Data=rValue.split('@');                
            if(Data[1]!="undefined")
            {
                if(Data[0]=='Branch')
                {
                    SetValue('HDNBranch',Data[1]);
                }
                else if(Data[0]=='Group')
                { 
                    SetValue('HDNGroup',Data[1]);
                }
                else if(Data[0]=='Client')
                { 
                   SetValue('HDNClient',Data[1]);
                }
                else if(Data[0]=='Asset')
                { 
                    SetValue('HDNAsset',Data[1]);
                }                               
            } 
            if(Data[0]=='AjaxQuery')
            {                
                AjaxComQuery = Data[1];               
                var AjaxList_TextBox=GetObjectID('txtSelectionID');
                AjaxList_TextBox.value='';
                AjaxList_TextBox.attachEvent('onkeyup',CallGenericAjaxJS);
             }              
        }
        function CallGenericAjaxJS(e)
        {
            var AjaxList_TextBox=GetObjectID('txtSelectionID');
            AjaxList_TextBox.focus();
            AjaxComQuery=AjaxComQuery.replace("\'","'");
            var GenericAjaxListAspxPath = '../../../../CentralData/Pages/GenericAjaxList.aspx';
            ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main',GenericAjaxListAspxPath);
        }       
    </script>

    <!--Page Style-->
    <style type="text/css">       
        #MainFull { padding:5px;}
        #Container1 { width: 520px;}
        #Container2 { width: 420px; display:none;}       
	    .LableWidth { width:110px;}
        .ContentWidth { width:170px; height:21px;}
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:10px; float:right;} 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="MainFull">
            <div id="header" class="Header">
                <div id="divShowFilter" style="text-align: right;">
                    <dxe:ASPxButton ID="btnReset" runat="server" AutoPostBack="False" ClientInstanceName="cbtnReset"
                        Text="Reset" Font-Size="7" TabIndex="0" CssClass="btnRight">
                        <ClientSideEvents Click="function(s,e){Reset();}" />
                        <Paddings Padding="0" PaddingBottom="0" PaddingLeft="0" PaddingRight="0" />
                    </dxe:ASPxButton>
                </div>
                Spread Offset Trades
            </div>
            <div id="Row0" class="Row">
                <div id="Container1" class="container">
                    <div id="C1_Row0" class="Row">
                        <div id="C1_Row0_Col1" class="LFloat_Lable LableWidth">
                            Date :
                        </div>
                        <div id="C1_Row0_Col2" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="DtPosition" runat="server" ClientInstanceName="cDtPosition" DateOnError="Today"
                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" TabIndex="0">
                                <ClientSideEvents DateChanged="function(s,e){DateChange(cDtPosition);}"></ClientSideEvents>
                                <DropDownButton Text="From">
                                </DropDownButton>
                            </dxe:ASPxDateEdit>
                        </div>                       
                        <span class="clear"></span>
                    </div>
                    <div id="C1_Row1" class="Row">
                        <div id="C1_Row1_Col1" class="LFloat_Lable LableWidth">
                            Asset :
                        </div>
                        <div id="C1_Row1_Col2" class="LFloat_Content ContentWidth">
                            <dxe:ASPxRadioButtonList ID="RblAsset" runat="server" SelectedIndex="0" ItemSpacing="20px"
                                Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                ClientInstanceName="cRblAsset">
                                <Items>
                                    <dxe:ListEditItem Text="All" Value="A" />
                                    <dxe:ListEditItem Text="Specific" Value="S" />
                                </Items>
                                <ClientSideEvents ValueChanged="function(s, e) {fn_Asset(s.GetValue());}" />
                                <Border BorderWidth="0px" />
                            </dxe:ASPxRadioButtonList>
                        </div>
                    </div>
                    <div id="C1_Row2" class="Row">
                        <div id="C1_Row2_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblGroupBy" runat="server" Text="Group By : "></asp:Label>
                        </div>
                        <div class="left">
                            <div id="C1_Row2_Col2" class="LFloat_Content ContentWidth">
                                <dxe:ASPxComboBox ID="CmbGroupBy" runat="server" ValueType="System.String" ClientInstanceName="cCmbGroupBy"
                                    SelectedIndex="0" TabIndex="0">
                                    <Items>
                                        <dxe:ListEditItem Text="Branch" Value="B"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Group" Value="G"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Client" Value="C"></dxe:ListEditItem>
                                    </Items>
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {fn_GroupBy(s.GetValue());}" />
                                </dxe:ASPxComboBox>
                            </div>
                            <div class="left">
                                <div>
                                    <div id="C1_Row2_Col3" class="LFloat_Content ContentWidth">
                                        <dxe:ASPxRadioButtonList ID="RblBranch" runat="server" SelectedIndex="0" ItemSpacing="20px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblBranch">
                                            <Items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Specific" Value="S" />
                                            </Items>
                                            <ClientSideEvents ValueChanged="function(s, e) {fn_Branch(s.GetValue());}" />
                                            <Border BorderWidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                                <div>
                                    <div id="C1_Row2_Col4" class="LFloat_Content ContentWidth">
                                        <dxe:ASPxRadioButtonList ID="RblClient" runat="server" SelectedIndex="0" ItemSpacing="20px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblClient">
                                            <Items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Specific" Value="S" />
                                            </Items>
                                            <ClientSideEvents ValueChanged="function(s, e) {fn_Client(s.GetValue());}" />
                                            <Border BorderWidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                                <div id="C1_Row2_Col5">
                                    <div class="LFloat_Content ContentWidth">
                                        <dxe:ASPxComboBox ID="CmbGroupType" ClientInstanceName="cCmbGroupType" runat="server"
                                            Font-Size="13px" TabIndex="0" OnCallback="CmbGroupType_Callback">
                                            <ClientSideEvents ValueChanged="function(s, e) {fn_CmbGroupType(s.GetValue());}"
                                                EndCallback="CmbGroupType_EndCallback" />
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="C1_Row2_Col6" class="LFloat_Content ContentWidth" style="display: none;
                                        margin-top: 3px;">
                                        <dxe:ASPxRadioButtonList ID="RblGroup" runat="server" SelectedIndex="0" ItemSpacing="20px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblGroup">
                                            <Items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Specific" Value="S" />
                                            </Items>
                                            <ClientSideEvents ValueChanged="function(s, e) {fn_Group(s.GetValue());}" />
                                            <Border BorderWidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                                <span class="clear"></span>
                            </div>
                        </div>
                    </div>
                    <div id="C1_Row3" class="Row btnRight">
                        <dxe:ASPxButton ID="btnShow" runat="server" AutoPostBack="true" ClientInstanceName="cbtnExport"
                            Text="Export" OnClick="BtnExport_Click" Width="100px">
                        </dxe:ASPxButton>
                    </div>
                </div>
                <div id="Container2" class="container">
                    <div id="C2_Row0" class="Row">
                        <div id="C2_Row0_Col1" class="LFloat_Content">
                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="323px" TabIndex="0"></asp:TextBox>
                        </div>
                        <div id="C2_Row0_Col2" class="LFloat_Lable">
                            <a href="javascript:void(0);" tabindex="0" onclick="btnAddToList_click()"><span class="lnkBtnAjax green">
                                Add to List</span></a>
                        </div>
                    </div>
                    <div id="C2_Row1" class="Row">
                        <div id="C2_Row1_Col1" class="LFloat_Content finalSelectedBox">
                            <asp:ListBox ID="lstSelection" runat="server" Font-Size="12px" Height="100px" Width="410px"
                                TabIndex="0"></asp:ListBox>
                        </div>
                    </div>
                    <div id="C2_Row2" class="Row">
                        <div id="C2_Row2_Col1" class="LFloat_Lable">
                            <a href="javascript:void(0);" tabindex="0" onclick="lnkBtnAddFinalSelection()"><span
                                class="lnkBtnAjax blue">Done</span></a>&nbsp;&nbsp; <a href="javascript:void(0);"
                                    tabindex="0" onclick="lnkBtnRemoveFromSelection()"><span class="lnkBtnAjax red">Remove</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="Row2">
                <asp:TextBox ID="txtSelectionID_hidden" runat="server"></asp:TextBox>
                <asp:HiddenField ID="HDNAsset" runat="server" />
                <asp:HiddenField ID="HDNBranch" runat="server" />
                <asp:HiddenField ID="HDNGroup" runat="server" />
                <asp:HiddenField ID="HDNClient" runat="server" />                
            </div>
        </div>
    </form>
</body>
</html>
