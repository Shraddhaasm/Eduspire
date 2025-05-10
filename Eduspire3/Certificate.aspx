<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="Eduspire3.Certificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
      <script src="jsfiles/html2canvas.min.js"></script>
    <script src="jsfiles/pdfmake.min.js"></script>
    <script type="text/javascript">
        function Export() {
            // alert("hello");
            html2canvas(document.getElementById('GetPDF'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Certificate.pdf");
                    alert("Certificate Downloading Started");
                }
            });
        }
    </script>
</head>
<body>
  
        <style type='text/css'>
            body {
                margin-top:40px;
                padding-left:20%;
                display: table;
                color:#DE6262;
                font-family: Georgia, serif;
                font-size: 24px;
                text-align: center;
            }
            .container {
                 width: 750px;
                height: 563px;
                background-color:antiquewhite;
                border: 20px solid #FFB88C;
                display: table-cell;
                vertical-align: middle;
            }
            .logo {
                margin-top:4px;
                color:#FFB88C;
            }

            .marquee {
                color: #DE6262;
                font-size: 48px;
                margin: 20px;
            }
            .assignment {
                margin: 20px;
                color:black;
            }
            .person {
                border-bottom: 2px solid black;
                font-size: 32px;
                font-style: italic;
                margin: 20px auto;
                width: 400px;
            }
            .reason {
                margin: 20px;
                font-style:oblique;
            }
            .gradient-border {
                border: 20px solid;
                border-image: linear-gradient(to bottom, #FFB88C, #DE6262) 5;

            }
            .inner-border{
                   border: 2px solid;
                border-image: linear-gradient(to bottom, #FFB88C, #DE6262);


            }
            .size{
                height:10px;
                width:3px;
            }
        .image {
            height: 101px;
            margin-top: -102px;
            margin-left: 230px;
        }

        </style>
    <form id="form1" runat="server">
        <div>
              <div id="GetPDF">

            
        <div class="container gradient-border">
            <div>
                <asp:Image ID="Image1" runat="server" style="height: 80px; width: 80px; margin-right:670px;"/>
            </div>
            <div class="image">
              <img src="Images/Logo.png" style="margin-left: -202px;height: 129px;margin-top: 22px;" />
                </div>
       <br />
            <div  style="margin-right: -575px;font-size:12px; color:black">
                <asp:Label id="lbluserid" runat="server"></asp:Label>
            </div>
              <div  style="margin-right: -575px;font-size:12px; color:black">
                <asp:Label id="LblTestID" runat="server"></asp:Label>
            </div>
            <div class="marquee" style="margin-top: 32px">
                Certificate of Completion
            </div>

            <div class="assignment">
                This certificate is presented to
            </div>

            <div class="person">
                <div class="row" >
               <asp:Label  runat="server" class="col-6" ID="lblName" Font-Size="28px"> </asp:Label> <asp:Label runat="server" class="col-6" ID="lblLastName" Font-Size="28px"></asp:Label>

                </div>
            </div>
            <div class="row">
            <div class="reason assignment">
                For Completing the 
            </div><asp:Label ID="lblcourse" runat="server" class="person" Font-Size="28px"></asp:Label><div class="reason assignment"> course for Beginners from Eduspire
           </div></div>
                <div >
                <img src="Images/Leaf.png" style="height: 121px; margin-block-end: -101px;" />
                </div>
            <div>
                <%--<img src="Images/OxfordLogo.png" />--%>
            </div>
            <div >
                <table style="margin-left: -91px;width: 111%;">
                    <tr>
                        <td><asp:Label runat="server" ID="Label2" style="color:black" Text="_______________"></asp:Label></td>
                        <td>    <asp:Label runat="server" ID="lblDate" Font-Size="12"  style="color:black"></asp:Label></td>
                    </tr>
                    <tr>
                        <td> <asp:Label runat="server" ID="Label4"  style="color:black" Font-Size="12" Text="Signature of Authority"></asp:Label></td>
                        <td><asp:Label runat="server" ID="lbl5"  style="color:black" Text="Date of Certification" Font-Size="12" ></asp:Label></td>
                           <asp:Label runat="server" Font-Size="14px"> EDUSPIRE</asp:Label><br/>
                          <asp:Label runat="server" Font-Size="14px"> 2022-23</asp:Label>
                    </tr>
                   <%-- <tr>
                         <td> <asp:Label ID="LBLEDU"  style="MARGIN-RIGHT: -369PX;" runat="server" Text="EDUSPIRE" Font-Size="Small"></asp:Label></td>
                    </tr>
                    <tr>
                       <td>  <asp:Label runat="server" style="margin-right: -367px;font-size:Small;" ID="lblyear" Text="2022-23"></asp:Label></td>
                       
                       
                    </tr>--%>
                </table>
            
             </div>
        </div>


        </div>
        <input type="button" id="btnExport" value="Get PDF" onclick="Export()" style="color:forestgreen" /><br />
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/HomePage.aspx">Home</asp:HyperLink><br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/CoursesStu.aspx">Continue</asp:HyperLink><br />
             <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/PassPage.aspx">Back</asp:HyperLink>
        </div>
    </form>
</body>
</html>
