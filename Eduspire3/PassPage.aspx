<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="PassPage.aspx.cs" Inherits="Eduspire3.PassPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <%-- <img src="Images/Logo.png" />--%>

    
     <script src="jsfiles/html2canvas.min.js"></script>
    <script src="jsfiles/pdfmake.min.js"></script>
    <script type="text/javascript">
        function Export() {
            html2canvas(document.getElementById('Download'), {
                onrendered: function (canvas) {
                    var data = canvas.toDataURL();
                    var docDefinition = {
                        content: [{
                            image: data,
                            width: 500
                        }]
                    };
                    pdfMake.createPdf(docDefinition).download("Download Result.pdf");
                    alert("Downloading Started");
                }
            });
        }
    </script>

      <div id="Download">
    <div class="form-control" id="">
  <asp:Label runat="server" ID="congrats" style="margin-left:96px; margin-top:68px;" Font-Size="XX-Large" ForeColor="SeaGreen" class="fa fa-flag-checkered" Font-Bold="true">CONGRATULATIONS YOU HAVE PASSED THE TEST!</asp:Label> 
        <br /><br />
        
        <div class="form-group"  style="margin-top: 61px; margin-left:362px;">
    <asp:Label runat="server" Font-Size="28px" Font-Underline="true" class="fa fa-python align-content-center" Font-Bold="true" ForeColor="#cc0000" ID="score">YOUR SCORE</asp:Label>
        </div>

          <div class="row">
            <asp:Label runat="server" style="margin-left:30px;" ID="Label1" Font-Size="24px" Text="Student Name:" class="fa fa-python col-4" Font-Bold="true" ></asp:Label>
            <asp:Label ID="lblName"  class="fa fa-python col-4" ForeColor="Green" Font-Size="24px" runat="server"></asp:Label>
            <asp:Label ID="lblLastName"  class="fa fa-python col-4" Visible="false" ForeColor="Green" Font-Size="24px" runat="server"></asp:Label>
              <asp:Label ID="lblURL" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="row">
            <asp:Label runat="server" style="margin-left:30px;" ID="Label2" Font-Size="24px" Text="Student Email ID:" class="fa fa-python col-4" Font-Bold="true" ></asp:Label>
            <asp:Label ID="lblEmailID"  class="fa fa-python col-4" ForeColor="Green" Font-Size="24px" runat="server"></asp:Label>
      
        </div>


        <div class="row">
            <asp:Label runat="server" style="margin-left:30px;" Visible="false" ID="lblid" Font-Size="24px" Text="User ID:" class="fa fa-python col-4" Font-Bold="true" ></asp:Label>
            <asp:Label ID="lbluserid"  class="fa fa-python col-4" Visible="false" ForeColor="Green" Font-Size="24px" runat="server"></asp:Label>
      
        </div>
        <div class="row">
            
            <asp:Label runat="server" style="margin-left:30px;" class="fa fa-python col-4" ID="id" Text="Test on Course:" Font-Bold="true" Font-Size="24px"></asp:Label>
            <asp:Label runat="server" ID="lbltestCourse" class="fa fa-python col-4" ForeColor="Green" Font-Size="24px" ></asp:Label>
          </div>
            
            <div class="row">
            <asp:Label runat="server" style="margin-left:30px;" ID="Label3" Font-Size="24px" Text="Test Name:" class="fa fa-python col-4" Font-Bold="true" ></asp:Label>
            <asp:Label ID="lblTestName"  class="fa fa-python col-4"  ForeColor="Green" Font-Size="24px" runat="server"></asp:Label>
      
        </div>
    <div class="row">  
    <asp:Label ID="totalQue" runat="server" style="margin-left:30px;" class="fa fa-python col-4" Font-Bold="true" Font-Size="24px" Text="Total Questions:"></asp:Label>
    <asp:Label runat="server" ID="lblNoOFQuestions" Font-Bold="true" class="fa fa-python col-4" ForeColor="Green" Font-Size="24px"></asp:Label>
</div>

        <div class="row">
    <asp:Label ID="lblcorrAns" runat="server" style="margin-left:30px;" class="fa fa-python col-4" Font-Bold="true" Font-Size="24px" Text="Correct Answers:"></asp:Label>
    <asp:Label runat="server" ID="lblAns" Font-Bold="true" class="fa fa-python col-4" ForeColor="Green" Font-Size="24px"></asp:Label>
</div>

         <div class="row">
    <asp:Label ID="lblttlmark" runat="server" style="margin-left:30px;" class="fa fa-python col-4" Font-Bold="true" Font-Size="24px" Text="Total Mark's :"></asp:Label>
    <asp:Label runat="server" ID="lbltotalmarks" Font-Bold="true" class="fa fa-python col-4" ForeColor="Green" Font-Size="24px"></asp:Label>
         
</div>
        
         <div class="row">
            <asp:Label runat="server" style="margin-left:30px;" ID="Label4" Font-Size="24px" Text="Date:" class="fa fa-python col-4" Font-Bold="true" ></asp:Label>
            <asp:Label ID="lblDate"  class="fa fa-python col-4" ForeColor="Green" Font-Size="24px" runat="server"></asp:Label>
       
        </div>
       
    </div>

      </div><div class="row">
    <input type="button" id="btnExport" value="Download PDF" class="btn btn-success btn-danger" onclick="Export()"/>&nbsp;&nbsp;&nbsp;&nbsp;
   <form runat="server">
       <asp:Button ID="btnCertificate" Text="Get Certificate" class="btn btn-success btn-danger" runat="server" OnClick="btnCertificate_Click" />
   </form></div>
</asp:Content>
