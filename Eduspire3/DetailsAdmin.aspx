<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" CodeBehind="DetailsAdmin.aspx.cs" Inherits="Eduspire3.DetailsAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

     <style>
        .color{
          color: #DE6262;

        }
    </style>
    <form id="form2" runat="server">
        <section class="login-block">
            <div class="" style="margin-top: -93px;">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card card-registration my-3">
                            <div class="row g-0">
                                <asp:HiddenField runat="server" ID="tutorilaID" />
                                <div class="col-xl-12 login-sec">
                                    <div class="card-body p-md-3 text-black">
                                        <h2 style="margin-top: -56px;" class="text-center">Personal Information</h2>
            <asp:Label ID="Label1" class="text-left color"  runat="server" ></asp:Label>
            <br />
                <div class="row">                        
        <h5 class="text-left color"> First Name: </h5>  
            <asp:Label ID="lblFName" class="col-4"  Font-Size="Large" runat="server"></asp:Label>
            <br /></div>
               <div class="row">
            <h5 class="text-left color">  Last Name: </h5> 
            <asp:Label ID="lblLastName" class="col-4" Font-Size="Large" runat="server"></asp:Label>
            <br />
              </div>
              <div class="row">
             <h5 class="text-left color"> Contact No.: </h5> 
            <asp:Label ID="lblContact" class="col-4" Font-Size="Large" runat="server"></asp:Label>
            <br />
              </div>
             <div class="row">
           <h5 class="text-left color">   Email Address: </h5> 
             <asp:Label ID="LblEmail" class="col-4" Font-Size="Large" runat="server"></asp:Label>
            <br />
              </div>
         </div>
        </div>
       </div>
      </div>
    </section>
   </form>

</asp:Content>
