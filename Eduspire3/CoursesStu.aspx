<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="CoursesStu.aspx.cs" Inherits="Eduspire3.CoursesStu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <form id="form1" runat="server">

   <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins|Ubuntu&display=swap');*{box-sizing: border-box;margin: 0;padding: 0}
    body{
       /* background: #eee;*/
        font-family: 'Ubuntu',sans-serif

    }
    .color{
    margin-bottom: 30px;
    font-weight: 800;
    font-size: 30px;
    color: #DE6262
    }
  .box{
      position: relative;width: 100%;
      padding-right: 15px;
      padding-left: 15px

  }
  .our-services{
      margin-top: 75px;
      padding-bottom: 30px;
      padding: 0 60px;
      min-height: 198px;
      text-align: center;
      border-radius: 10px;
      background-color: #fff;
      transition: all .4s ease-in-out;
      box-shadow: 0 0 25px 0 rgba(20,27,202,.17)
  }
  .our-services .icon{
      margin-bottom: -21px;
      transform: translateY(-50%);
      text-align: center
  }
  .our-services:hover h4, 
  .our-services:hover p{
      color: #fff

  }
  .speedup:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #fb0054 0%, #f55b2a 100%)

  }
  .settings:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #34b5bf 0%, #210c59 100%)
  }
  .privacy:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #3615e7 0%, #44a2f6 100%)
  }
  .backups:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #fc6a0e 0%, #fdb642 100%)

  }
  .ssl:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #8d40fb 0%, #5a57fb 100%)

  }
  .database:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #27b88d 0%, #22dd73 100%)
  }
</style>

    <div class="container-fluid mb-5">
    <div class="text-center color">
        <h3><strong>Courses</strong></h3>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="box">
                <div class="our-services settings">
                    <div class="icon">
                        <a href="Python.aspx">
                        <img src="Images/python.png" height="100px" /></a>
                          </div>
                    <h4>Python</h4>
                    <p>Python is a high-level, general-purpose programming language.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box">
                <div class="our-services speedup">
                    <div class="icon">
                        <a href="Java.aspx">
                        <img src="Images/JAVA.png" height="100px" /></a>
                        </div>
                    <h4>Java</h4>
                    <p>Java is a high-level, class-based, object-oriented programming language.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box">
           <%--     <div class="our-services privacy">--%>
                    <div class="our-services backups">
                    <div class="icon">
                         <a href="HTML.aspx">
                        <img src="Images/HMTL.png" height="100px" /></a> </div>
                    <h4>HTML</h4>
                    <p>The HyperText Markup Language or HTML is the standard markup language.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="box">
                <%--<div class="our-services backups">--%>
                <div class="our-services ssl">
                    <div class="icon">
                        <a href="C(Sharp).aspx">
                       <img src="Images/CSharp.png" height="100px" /> </a> <%--<img src="https://i.imgur.com/vdH9LKi.png">--%> </div>
                    <h4>C#</h4>
                    <p>C# is a general-purpose high-level programming language.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box">
                <%--<div class="our-services ssl">--%>
                <div class="our-services privacy">
                    <div class="icon">
                        <a href="CPlusPlus.aspx">
                      <img src="Images/CPP.png" height="100px" /></a> </div>
                    <h4>C++</h4>
                    <p>C++ is a cross-platform language that can be used to create high-performance applications.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box">
                <div class="our-services database">
                    <a href="DBMS.aspx">
                    <div class="icon"> <img src="https://i.imgur.com/VzjZw9M.png"></a> </div>
                    <h4>DBMS</h4>
                    <p> DML is the short name for Data Manipulation Language which deals with data manipulation</p>
                </div>
            </div>
        </div>
    </div>
</div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ExploreMore.aspx">Explore More...</asp:HyperLink>
    </form>
</asp:Content>
