<%@ Page Title="" Language="C#" MasterPageFile="~/ContentTut.Master" AutoEventWireup="true" CodeBehind="UploadVideo.aspx.cs" Inherits="Eduspire3.UploadVideo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        
        .table td, .table th {
            padding: 0.5rem !important;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }
         .mand {
            color: Red;
            position: absolute;
            font-size: 16px;
            font-weight: 500;
        }

        .error {
            color: Red;
            /* visibility: hidden; */
            position: absolute;
            font-size: 13px;
            font-weight: 500;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <form id="form1" runat="server">
        <section class="login-block">
            <div class="" style="margin-top: -93px;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card card-registration my-3" style="left: 0px; top: 0px">
                            <div class="row g-0">
                                <asp:HiddenField runat="server" ID="tutorilaID" />
                                <div class="col-xl-12 login-sec">
                                    <div class="card-body p-md-3 text-black">
                                        <h2 style="margin-top: -56px;" class="text-center">Upload Lectures</h2>

                                        <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                                         <asp:Label ID="lblTut_ID" runat="server" Visible="false"></asp:Label>

                                        <div class="row" >
                                             <div class="col-md-3 mb-2 form-group">
                                                  <label for="exampleInputEmail1" class="text-uppercase">Lecture Title: </label>
                                                 <asp:TextBox ID="txtTitle" class="form-control" runat="server" Placeholder="Enter Video Title"></asp:TextBox>
                                                 <asp:Label ID="lblTitleError" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                                             </div>
                                            </div>

                                            <div class="row" >
                                            <div class="col-md-3 mb-2 form-group">
                                                  <label for="exampleInputEmail1" class="text-uppercase">Lecture on Course: </label>
                                                <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Course" DataValueField="Course"></asp:DropDownList>
                                               <%-- <asp:ListItem text="--Select--" value="0"></asp:ListItem>--%>
                                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT [Course] FROM [Course_Table13]"></asp:SqlDataSource>
                                                  <asp:Label ID="lblDrpError" runat="server" ForeColor="#ff0000" Text=""></asp:Label> 
                                            </div>
                                        </div>

                                         <div class="row" >
                                              <div class="col-md-3 mb-2 form-group">
                                                   <label for="exampleInputEmail1" class="text-uppercase">Lecture Description: </label>
                                              <asp:TextBox ID="txtDes" runat="server" class="form-control" TextMode="MultiLine" Placeholder="Enter Video Description" Width="675px" MaxLength="110"></asp:TextBox>    
                                              </div>
                                             </div>

                                         <div class="row" >
                                            <div class="col-md-3 mb-2 form-group">
                                                   <label for="exampleInputEmail1" class="text-uppercase">Upload Lecture: </label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                                <asp:Label ID="lblNote" runat="server"  Text="NOTE: Video size must be less than 100MB" Font-Bold="True" Font-Size="X-Small"></asp:Label><br />
                                             <asp:Label ID="lblFileError" runat="server" ForeColor="#ff0000" Text=""></asp:Label>    
                                            </div>
                                             </div>

                                         <div class="d-flex justify-content-end pt-3">
                                             <asp:Button ID="btnUpload" runat="server" Text="Upload"  BackColor="#FF6666" ForeColor="White" BorderWidth="1px" Height="39px" Width="109px" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight='normal'" OnClick="btnUpload_Click" />
                                         &nbsp;&nbsp;&nbsp;
                                         <asp:Button type="button" class="btn btn-light btn-Cancel" Text="Clear"  runat="server" ID="btnClear" OnClick="btnClear_Click" ></asp:Button>    
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </form>

</asp:Content>
