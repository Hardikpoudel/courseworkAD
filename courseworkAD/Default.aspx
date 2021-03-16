<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="courseworkAD._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .image1 {
            
            background-image:url("image/save2.png");
            background-repeat:no-repeat;
            background-size: cover;
            height:85vh;
            width:100vw;
           /* align-items:center;
            justify-content:space-around;*/
        }
       /* .image2 {
        position:absolute;
        top:10%;
        left:10%;
        }*/

       .container{
      
                padding-right: 0; 
     padding-left: 0; 
     margin-right: 0; 
     margin-left: 0;
       }
        span {
            color: orange;
        }

    </style>
    <div class="image1">
        <div class="image2">
            <h1>Welcome To</h1>
            <h1><span>GOODFOOD</span></h1>
        
        <p><a runat="server" href="~/About" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
  </div>
    </div>

</asp:Content>
