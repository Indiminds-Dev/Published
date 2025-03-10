<%@ page language="C#" autoeventwireup="true" inherits="Segments_Comm_User_BL_Comm_Import_ICEXCTT, App_Web_9e_xhpv8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Import CTT For ICEX</title>

    <script type="text/javascript" src="../../../../CentralData/JSScript/GenericJScript.js"></script>

    <link type="text/css" href="../../../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <style type="text/css">       
        #MainFull { padding:5px;}
         #Container1 { width: 500px;}
        .SplitCont {height:200px;overflow-y:scroll;}
        .tab{border:1px solid #555; padding:5px; vertical-align:bottom; background-color:#ddd; float:left;}
        .tab-Selected{border:1px solid #555; padding:7px; vertical-align:bottom; background-color:#aeaeae;; float:left;}
        .LableWidth { width:110px;}
        .ContentWidth { width:170px; height:21px;}
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:18px; float:right;} 
        .txt_left { text-align:left;}
        .txt_right { text-align:right;} 
                                                   
   </style>

    <script language="javascript" type="text/javascript">
    function Page_Load()
        {
            HideShow('Row0','S');
            //HideShow('Row3','H');
            HideShow('Row4','H');
            //HideShow('Row4','H');
        }
    function error()
        {
            Page_Load();
            HideShow('Row4','S');
            alert('1')
            GetObjectID('Row4').innerHTML="No Image Available";
            
        }
    function success(variable)
        {
            
            var splitcontent;
            var splitcontentfirstpos;
            splitcontentfirstpos=variable.split('|')[0];
            splitcontent=variable.split('|')[1];
            
            //Page_Load();
            
            HideShow('Row4','S');
            if(splitcontentfirstpos=='Error')
                GetObjectID('Row4').className ='Error';
            else
                GetObjectID('Row4').className ='Success';
                GetObjectID('Row4').innerHTML=splitcontent;
        }
    function BtnImport_Click()
        {
            //cGvAuthRecord.PerformCallback();
            GetObjectID('btnYes').click();
        }
    
    function height()
      {
       if(document.body.scrollHeight>=450)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '450px';
        window.frameElement.Width = document.body.scrollWidth;
      }  
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div id="MainFull">
            <div id="Header" class="Header">
                Import CTT</div>
            <div id="Row0" class="Row">
                <div id="Container1" class="container">
                    <div id="Row1">
                        <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                            Select File :
                        </div>
                        <div id="Row1_Col2">
                            <asp:FileUpload ID="fileuploadcontrol" runat="server" Width="350px" />
                        </div>
                        <%-- <div id="Row1_Col3" class="LFloat_Content ContentWidth">
                            <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                Width="84px" />
                        </div>--%>
                    </div>
                    <span class="clear" style="height: 2px;">&nbsp;</span>
                    <div id="Row2" class="Row btnRight" style="margin-left: 280px;">
                        <br class="clear" />
                        <dxe:ASPxButton ID="BtnImport" ClientInstanceName="cBtnImport" runat="server" AutoPostBack="False"
                            Text="Import" Width="85px" ToolTip="Click To Import">
                            <ClientSideEvents Click="function (s, e) {BtnImport_Click();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>
            </div>
            <br />
            <br class="Clear" />
            <br class="Clear" />
            <div id="Row4">
               
            </div>
           <%-- <br class="Clear" />
            <div id="Row5" class="Success">
                Insert Successfully !!
            </div>--%>
        </div>
        <div style="display: none;">
            <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Yes" OnClick="btnYes_Click" />
        </div>
    </form>
</body>
</html>
