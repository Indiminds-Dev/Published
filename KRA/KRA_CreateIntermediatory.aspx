<%@ page language="C#" autoeventwireup="true" inherits="KRA_KRA_CreateIntermediatory, App_Web_g3gsjpud" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
      <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />
     <style type="text/css">       
        #MainFull { padding:5px;}
         #Container123 { width: 520px;}      
        .tab{border:1px solid #555; padding:5px; vertical-align:bottom; background-color:#ddd; float:left;}
        .tab-Selected{border:1px solid #555; padding:7px; vertical-align:bottom; background-color:#aeaeae;; float:left;}
        .LableWidth { width:130px;}
        .ContentWidth { width:280px; height:21px;}
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:18px; float:right;} 
        .txt_left { text-align:left;}
        .txt_right { text-align:right;}
        .Row{Margin-bottom:25px;clear:both;}            
        .lable_left{float:left;border: solid 1px #aaa;padding:2px;height:18px;width:200px; margin-right:10px;font-size:12px;line-height:18px;}
        .content_left{float:left;margin-right:3px;border: solid 1px #aaa;padding:2px 10px 2px 10px; background-color:#FFD4AA;height:18px;line-height:18px;}                       
   </style>
   
<script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script type="text/javascript" language="javascript">
    function PageLoad()///Call Into Page Load
    {         
       
//       height(); 
         
               
    }
    function Reset()
            {
            
            }
     function SignOff()
            {
            window.parent.SignOff();
            }
    function height()
    {
        if(document.body.scrollHeight>=560)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '560px';
         window.frameElement.Width = document.body.scrollWidth;
       
    }
    function btnSave_Details()
    {
  
     if(ctxtIntermidiatory.GetText()=='')
        {
            alert('Please Enter Intermediatory Id');
            ctxtIntermidiatory.Focus();
        
        }
      else if(ctxtUploaduser.GetText()=='')
      {
        alert('Please Enter UploadUser Value');
        ctxtUploaduser.Focus();
      
      }  
      else
        {
          if(GetObjectID('<%=hiddenedit.ClientID%>').value=='')
             {            
                cGvCredential.PerformCallback('SaveProfession~'+cCmbCompanyName.GetText()+'~'+cCmbAgency.GetText()+'~'+ctxtIntermidiatory.GetText()+'~'+ctxtUploaduser.GetText());
             }
            else
             {            
                cGvCredential.PerformCallback('UpdateProfession~'+GetObjectID('<%=hiddenedit.ClientID%>').value);
             }
        }    
    
    }
    
    function GvCredential_EndCallBack()
    {
      if(cGvCredential.cpinsert!=null)
        {
         if(cGvCredential.cpinsert=='Success')
             {
                alert('Inserted Successfully');
                ctxtIntermidiatory.SetText('');
                ctxtUploaduser.SetText('');
             }
         else            
               alert("Error On Insertion\n'Please Try Again!!'");
            
         }
              
      if(cGvCredential.cpUpdate!=null)
        {
         if(cGvCredential.cpUpdate=='Success')
             {
                alert('Updated Successfully');
                ctxtIntermidiatory.SetText('');
                ctxtUploaduser.SetText('');
                GetObjectID('<%=hiddenedit.ClientID%>').value='';
             }
         else
            
               alert("Error On Updation\n'Please Try Again!!'");
            
        }      
          
      if(cGvCredential.cpEdit!=null)
         {        
          if(cGvCredential.cpEdit.split('~')[0]=='EditData')
              {
                GetObjectID('<%=hiddenedit.ClientID%>').value=cGvCredential.cpEdit.split('~')[1];
//              document.getElementById('<%=hiddenedit.ClientID%>').value=cGvCredential.cpEdit.split('~')[1];
                cCmbCompanyName.SetValue(cGvCredential.cpEdit.split('~')[2]);
                cCmbAgency.SetValue(cGvCredential.cpEdit.split('~')[3]);
                ctxtIntermidiatory.SetValue(cGvCredential.cpEdit.split('~')[4]);
                ctxtUploaduser.SetValue(cGvCredential.cpEdit.split('~')[5]);
              }
         }
       if(cGvCredential.cpExists!=null)
          {
           if(cGvCredential.cpExists=="Exists")
               {
                alert('Company Name for this agency already Exists');
                ctxtIntermidiatory.SetText('');
                ctxtUploaduser.SetText('');
               }
           else
                alert("Error on operatio\n'Please Try again!!'");      
          }
        if(cGvCredential.cpDelete!=null) 
          {
           if(cGvCredential.cpDelete=='Success')
           {
                alert('Deleted Successfully');
//                cCmbCompanyName.SetSelectedIndex(0);
//                cCmbAgency.SetSelectedIndex(0);
                ctxtIntermidiatory.SetText('');
                ctxtUploaduser.SetText('');
                }
            else
                alert("Error on deletion\n'Please Try again!!'");
          }                 
    
    }
    function OnEditClick(kid,cid,aid,iid,uid)
    {
  
         cGvCredential.PerformCallback('Edit~'+kid+'~'+cid+'~'+aid+'~'+iid+'~'+uid);
        
    
    }
    
    function fn_Delete(kid)
    {
        cGvCredential.PerformCallback('Delete~'+kid);
    }
   
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="MainFull">
        <div id="Header" class="Header">Create Intermediatory</div>
         <div id="Row0" class="Row">
             <div id="Container123" class="container">
             <div id="Row1">
                <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                            Company Name</div>
                            
                <div id="Row1_Col2" class="LFloat_Content ContentWidth">
                             <dxe:ASPxComboBox ID="CmbCompanyName" ClientInstanceName="cCmbCompanyName" runat="server"
                                            Width="280px" Font-Size="13px" TabIndex="0" OnCallback="CmbCompanyName_Callback">
                                            <ClientSideEvents ValueChanged="function(s, e) {fn_CmbCompanyName(s.GetValue());}"
                                                />
                             </dxe:ASPxComboBox>
                </div>            
             </div>
              <span class="clear" style="height: 5px;">&nbsp;</span>
             <div id="Row2">
                 <div id="Row2_Col1" class="LFloat_Lable LableWidth">
                        Agency
                 </div>
                 <div id="Row2_Col2" class="LFloat_Content ContentWidth">
                        <dxe:ASPxComboBox ID="cmbAgency" ClientInstanceName="cCmbAgency" runat="server"
                                      Width="280px" Font-Size="13px" TabIndex="0" OnCallback="cmbAgency_Calback">
                                      <ClientSideEvents ValueChanged="function(s,e) {fn_cmbAgency(s.GetValue());}" />
                                      </dxe:ASPxComboBox>
                 </div>
             </div>
         <span class="clear" style="height: 5px;">&nbsp;</span>
             <div id="Row3">
                   <div id="Row3_Col1" class="LFloat_Lable LableWidth">
                        Intermediatory ID
                   </div>
                   <div id="Row3_Col2" class="LFloat_Content ContentWidth">
                         <dxe:ASPxTextBox ID="txtIntermediatoryID" ClientInstanceName="ctxtIntermidiatory" runat="server"
                         Width="120px" MaxLength="12" MaskSettings-ErrorText="for mannual"
                         Height="16px">
                         </dxe:ASPxTextBox>
                   </div>
             </div>
          <span class="clear" style="height: 5px;">&nbsp;</span>
              <div id="Row4">
                    <div id="Row4_Col1" class="LFloat_Lable LableWidth">
                        UploadUser
                   </div>
                   <div id="Row4_Col2" class="LFloat_Content ContentWidth">
                         <dxe:ASPxTextBox ID="txtUploadUser" ClientInstanceName="ctxtUploaduser" runat="server"
                         Width="120px" MaxLength="12" MaskSettings-ErrorText="for mannual" 
                       
                         Height="16px">
                         </dxe:ASPxTextBox>
                   </div>
              </div>             
             <div id="Row5" class="Row">
                <span class="clear" style="height: 5px;">&nbsp;</span>
              <div id="Div1" class="LFloat_Lable LableWidth">
                       
                   </div>
             <div id="Row5_Col1" class="LFloat_Content ContentWidth">
              <dxe:ASPxButton ID="btnSave_Details" ClientInstanceName="cbtnSave_Details" runat="server"
                                                AutoPostBack="False" Text="Save">
                                                <ClientSideEvents Click="function (s, e) {btnSave_Details();}" />
                                            </dxe:ASPxButton>
             </div>
             
             </div>
             </div>
         </div>
             
            
            
    </div>
    <div id="Row6" class="Row1">
                    <dxwgv:ASPxGridView ID="GvCredential" KeyFieldName="KRA_ID" ClientInstanceName="cGvCredential" runat="server"
                    AutoGenerateColumns="False" Width="1050px" OnCustomCallback="GvCredential_CustomCallback">
                    <ClientSideEvents EndCallback="function(s, e) {GvCredential_EndCallBack();}" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="0" Width="25px">
                            <DataItemTemplate>
                                <%#Container.ItemIndex+1 %>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                     <dxwgv:GridViewDataTextColumn VisibleIndex="1" Width="75px">
                            <DataItemTemplate>
                                <center>
                                    <a href="javascript:void(0);" onclick="OnEditClick('<%#Eval("KRA_ID")%>','<%#Eval("KRA_CompanyID")%>','<%#Eval("KRA_Agency")%>','<%#Eval("KRA_IntermediaryID")%>','<%#Eval("KRA_UploadUserId")%>')">
                                        Edit </a>
                                </center>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                        
                         <dxwgv:GridViewDataTextColumn VisibleIndex="1" Width="75px">
                            <DataItemTemplate>
                                <center>
                                    <a href="javascript:void(0);" onclick="fn_Delete('<%#Eval("KRA_ID")%>')">
                                        Delete </a>
                                </center>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                        
                        
                        <dxwgv:GridViewDataColumn Caption="Company Id" Visible="false" VisibleIndex="22" Width="75px">
                            <DataItemTemplate>
                                <%#Eval("KRA_CompanyID")%>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn Caption="Company Name" VisibleIndex="2" Width="75px">
                            <DataItemTemplate>
                                <%#GetCompany((string)Eval("KRA_CompanyID"))%>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataColumn>
                        
                        <dxwgv:GridViewDataColumn Caption="KRA_Agency" Visible="false" VisibleIndex="23" Width="75px">
                            <DataItemTemplate>
                                <%#Eval("Name")%>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataColumn>
                        
                        <dxwgv:GridViewDataColumn Caption="Agency Name" VisibleIndex="2" Width="75px">
                            <DataItemTemplate>
                                <%#GetAgencyName((string)Eval("KRA_Agency"))%>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataColumn>

                        <dxwgv:GridViewDataColumn FieldName="KRA_IntermediaryID" VisibleIndex="3" Width="75px">
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataTextColumn VisibleIndex="4" Width="100px" Caption="UploadUser ID">
                            <DataItemTemplate>
                                <%#(string)Eval("KRA_UploadUserId")%>
                              <%--  <%#GetClientCat((string)Eval("ClientType"))%>--%>
                            </DataItemTemplate>
                        </dxwgv:GridViewDataTextColumn>
                      
                        
                        </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="True" />
                    <SettingsLoadingPanel Text="Please Wait..." />
                    <Styles>
                        <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977">
                        </FocusedRow>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                </dxwgv:ASPxGridView>

    </div>
     <div class="HiddenFieldArea" style="display: none;">
                <asp:HiddenField runat="server" ID="hiddenedit" />
            </div>
    </form>
</body>
</html>
