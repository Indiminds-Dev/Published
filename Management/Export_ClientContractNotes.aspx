<%@ page language="C#" autoeventwireup="true" inherits="Management_Export_ClientContractNotes, App_Web_g1t3n0jz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Export Client Contract Notes Page</title>
    <!--External Style-->
    <!--Internal Style-->
    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <style type="text/css">       
        #MainFull { padding:5px; width:995px}
        #Container1 { width: 435px; padding:5px}
        .LableWidth { width:110px;}
        .ContentWidth { width:125px; height:21px;}       
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:18px; float:right;} 
        .txt_left { text-align:left;}
        .txt_right { text-align:right;}                                           
   </style>
    <!--External Javascript-->

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <!--Start For Ajax-->

    <script type="text/javascript" src="../CentralData/JSScript/init.js"></script>

    <script type="text/javascript" src="../CentralData/JSScript/GenericAjaxList.js"></script>

    <link type="text/css" href="../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <!--End For Ajax-->
    <!--Internal Javascript-->

    <script language="javascript" type="text/javascript">
        function PageLoad()///Call Into Page Load
        {          
           HideShow('C1_Row2_Col4','H');
           HideShow('C1_Row2_Col5','H');
           HideShow('Container2','H');                  
        }      
        function fn_GroupBy(obj)
        {
            GetObjectID('<%=lstSelection.ClientID%>').length=0;             
            if(obj=="C")
            { 
                cRblClient.SetSelectedIndex(0);     
                fn_Client('A');                
                HideShow('C1_Row2_Col4','H'); 
                HideShow('C1_Row2_Col5','H');
                HideShow('C1_Row2_Col3','S');
                CallServer("CallAjax-Client","");              
            }
            if(obj=="B")
            {
                cRblBranch.SetSelectedIndex(0);     
                fn_Branch('A'); 
                HideShow('C1_Row2_Col3','H');  
                HideShow('C1_Row2_Col5','H');               
                HideShow('C1_Row2_Col4','S');               
                CallServer("CallAjax-Branch",""); 
            }           
            if(obj=="G")                
            { 
                HideShow('C1_Row2_Col3','H'); 
                HideShow('C1_Row2_Col4','H');
                HideShow('Container2','H');
                HideShow('C1_Row2_Col5','S');
                HideShow('C1_Row2_Col6','H');
                cCmbGroupType.PerformCallback("GroupType~");
             }
        }      
        function fn_Client(obj)
        {  
            if(obj=="A")
            {
                SetValue('HiddenField_ClientBranchGroup','');                                          
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                HideShow('Container2','H');
                HideShow('C1_Row6','S');
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
                   HideShow('C1_Row6','H');
                   CallServer("CallAjax-Client",""); 
                   //GetObjectID('txtSelectionID').focus();
                } 
            }                         
        }        
        function fn_Branch(obj)
        {  
            if(obj=="A")
            {
                SetValue('HiddenField_ClientBranchGroup','');
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                HideShow('Container2','H');
                HideShow('C1_Row6','S');
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
                   HideShow('C1_Row6','H');
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
                    SetValue('HiddenField_ClientBranchGroup','');
               }
               else if(cCmbGroupType.cpBindGroupType=="N")
               {
                    cCmbGroupType.SetEnabled(false);                   
               }
           }          
           Height('500','500');
        }
        function fn_CmbGroupType(obj)
        {
            if(obj=="0")
            {
               HideShow('C1_Row2_Col6','H');
               alert('Please Select Group Type !');
               cbtnExport.SetEnabled(false);
            }
            else
            {
               cRblGroup.SetSelectedIndex(0);     
               HideShow('C1_Row2_Col6','S');
               cbtnExport.SetEnabled(true);
            }
           Height('500','500');
        }      
        function fn_Group(obj)
        {  
            if(obj=="A")
            {
                SetValue('HiddenField_ClientBranchGroup','');                                          
                GetObjectID('<%=lstSelection.ClientID%>').length=0;
                HideShow('Container2','H');
                HideShow('C1_Row6','S');
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
                   HideShow('C1_Row6','H');
                   CallServer("CallAjax-Group~"+cCmbGroupType.GetText(),"");
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
            if(msg=="ClientErr")
                alert("There is No Proper Client Selection!!!");
            else if(msg=="BranchErr")
                alert("There is No Proper Branch Selection!!!");
            else if(msg=="GroupErr")
                alert("There is No Proper Group Selection!!!");             
        }
       function Reset()
        {
           cCmbGroupBy.SetSelectedIndex(0); 
           cCmbGroupBy.SetEnabled(true); 
           cRblClient.SetSelectedIndex(0);
           cRblClient.SetEnabled(true); 
           cRblBranch.SetSelectedIndex(0);
           cRblGroup.SetSelectedIndex(0);
           cCmbGroupType.SetSelectedIndex(0);
           HideShow('C1_Row2_Col4','H');       
           HideShow('C1_Row2_Col5','H');
           GetObjectID('<%=lstSelection.ClientID%>').length=0;
           SetValue('HiddenField_ClientBranchGroup',''); 
           HideShow('Container2','H');                                                     
           Height('500','500');
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
                HideShow('C1_Row6','S');                    
            }
            else if((GetObjectID('Container2').style.display=="inline") && (listBox.length == 0))
            { 
                if((cCmbGroupBy.GetSelectedIndex()==0) && (cRblClient.GetSelectedIndex()==1))
                {             
                     alert("Please Select Atleast One Client Item!!!");
                }   
                else if((cCmbGroupBy.GetSelectedIndex()==1) && (cRblBranch.GetSelectedIndex()==1))
                {             
                    alert("Please Select Atleast One Branch Item!!!");
                }
                else if((cCmbGroupBy.GetSelectedIndex()==2) && (cRblGroup.GetSelectedIndex()==1))
                {             
                     alert("Please Select Atleast One Group Item!!!");
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
                 if((Data[0]=='Branch')||(Data[0]=='Group')||(Data[0]=='Client'))
                    SetValue('HiddenField_ClientBranchGroup',Data[1]);                                                     
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
            var GenericAjaxListAspxPath = '../CentralData/Pages/GenericAjaxList.aspx';            
            ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main',GenericAjaxListAspxPath);      
        }
        function CallAjax(obj1,obj2,obj3,Query)
        {
            var CombinedQuery=new String(Query);
            var GenericAjaxListAspxPath = '../CentralData/Pages/GenericAjaxList.aspx';
            ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main',GenericAjaxListAspxPath);
        }        
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="MainFull">
            <div id="Header" class="Header">
                Export Contract Notes of NRI Clients for Banks <span class="clear"></span>
            </div>
            <div id="Row0" class="Row">
                <div id="Container1" class="container">
                    <div id="C1_Row1" class="Row">
                        <div id="C1_Row1_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                        </div>
                        <div id="C1_Row1_Col2" class="LFloat_Content ContentWidth">
                            <dxe:ASPxDateEdit ID="DateFor" runat="server" ClientInstanceName="cDateFor" DateOnError="Today"
                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="125px"
                                Font-Size="11px" TabIndex="0">
                               <%-- <dropdownbutton text="Select">
                                </dropdownbutton>--%>
                                <clientsideevents datechanged="function(s,e){DateChange(cDateFor);}"></clientsideevents>
                            </dxe:ASPxDateEdit>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <div id="C1_Row2" class="Row">
                        <div id="C1_Row2_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="lblGroupBy" runat="server" Text="Group By : "></asp:Label>
                        </div>
                        <div class="left">
                            <div id="C1_Row2_Col2" class="LFloat_Content ContentWidth">
                                <dxe:ASPxComboBox ID="CmbGroupBy" runat="server" ValueType="System.String" ClientInstanceName="cCmbGroupBy"
                                    SelectedIndex="0" TabIndex="0" Width="125px">
                                    <items>
                                        <dxe:ListEditItem Text="Client" Value="C"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Branch" Value="B"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Group" Value="G"></dxe:ListEditItem>
                                    </items>
                                    <clientsideevents selectedindexchanged="function(s, e) {fn_GroupBy(s.GetValue());}" />
                                </dxe:ASPxComboBox>
                            </div>
                            <div class="left">
                                <div>
                                    <div id="C1_Row2_Col3" class="LFloat_Content ContentWidth">
                                        <dxe:ASPxRadioButtonList ID="RblClient" runat="server" SelectedIndex="0" ItemSpacing="15px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblClient">
                                            <items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />                                               
                                            </items>
                                            <clientsideevents valuechanged="function(s, e) {fn_Client(s.GetValue());}" />
                                            <border borderwidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                </div>
                                <div>
                                    <div id="C1_Row2_Col4" class="LFloat_Content ContentWidth">
                                        <dxe:ASPxRadioButtonList ID="RblBranch" runat="server" SelectedIndex="0" ItemSpacing="15px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblBranch">
                                            <items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />                                                
                                            </items>
                                            <clientsideevents valuechanged="function(s, e) {fn_Branch(s.GetValue());}" />
                                            <border borderwidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                    <span class="clear"></span>
                                </div>
                                <div id="C1_Row2_Col5">
                                    <div class="LFloat_Content ContentWidth">
                                        <dxe:ASPxComboBox ID="CmbGroupType" ClientInstanceName="cCmbGroupType" runat="server"
                                            Font-Size="11px" TabIndex="0" Width="125px" OnCallback="CmbGroupType_Callback">
                                            <clientsideevents valuechanged="function(s, e) {fn_CmbGroupType(s.GetValue());}"
                                                endcallback="CmbGroupType_EndCallback" />
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="C1_Row2_Col6" class="LFloat_Content ContentWidth" style="display: none;
                                        margin-top: 3px;">
                                        <dxe:ASPxRadioButtonList ID="RblGroup" runat="server" SelectedIndex="0" ItemSpacing="15px"
                                            Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                            ClientInstanceName="cRblGroup">
                                            <items>
                                                <dxe:ListEditItem Text="All" Value="A" />
                                                <dxe:ListEditItem Text="Selected" Value="S" />                                               
                                            </items>
                                            <clientsideevents valuechanged="function(s, e) {fn_Group(s.GetValue());}" />
                                            <border borderwidth="0px" />
                                        </dxe:ASPxRadioButtonList>
                                    </div>
                                    <span class="clear"></span>
                                </div>
                                <span class="clear"></span>
                            </div>
                            <span class="clear"></span>
                        </div>
                        <span class="clear"></span>
                    </div>
                    <span class="clear"></span>
                    <div id="C1_Row3" class="Row">
                        <div id="C1_Row3_Col1" class="LFloat_Lable LableWidth">
                            <asp:Label ID="Label1" runat="server" Text="Contract Type : "></asp:Label>
                        </div>
                        <div id="C1_Row3_Col2" class="LFloat_Content ContentWidth">
                            <dxe:ASPxComboBox ID="CmbContractType" runat="server" ValueType="System.String" ClientInstanceName="cCmbContractType"
                                SelectedIndex="0" TabIndex="0" Width="125px">
                                <items>
                                        <dxe:ListEditItem Text="Purchase" Value="P"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Sale" Value="S"></dxe:ListEditItem>                                       
                                    </items>
                            </dxe:ASPxComboBox>
                        </div>
                    </div>
                    <span class="clear"></span>
                    <br class="clear" />
                    <div id="C1_Row6" class="Row">
                        <dxe:ASPxButton ID="btnExport" runat="server" ClientInstanceName="cbtnExport" CssClass="btnUpdate"
                            AutoPostBack="False" Height="5px" Text="Export" Width="101px" OnClick="btnExport_Click">
                            <%-- <clientsideevents click="function (s, e) {fn_show();}" />--%>
                        </dxe:ASPxButton>
                    </div>
                </div>
                <div id="Container2" class="container">
                    <div id="C2_Row0" class="Row">
                        <div id="C2_Row0_Col1" class="LFloat_Content">
                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="320px" TabIndex="0"></asp:TextBox>
                        </div>
                        <div id="C2_Row0_Col2" class="LFloat_Lable">
                            <a href="javascript:void(0);" tabindex="0" onclick="btnAddToList_click()"><span class="lnkBtnAjax green">
                                Add to List</span></a>
                        </div>
                    </div>
                    <div id="C2_Row1" class="Row">
                        <div id="C2_Row1_Col1" class="LFloat_Content finalSelectedBox">
                            <asp:ListBox ID="lstSelection" runat="server" Font-Size="12px" Height="100px" Width="400px"
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
            <br />
            <div style="display: none">
                <asp:TextBox ID="txtSelectionID_hidden" runat="server"></asp:TextBox>
                <asp:HiddenField ID="HiddenField_ClientBranchGroup" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>
