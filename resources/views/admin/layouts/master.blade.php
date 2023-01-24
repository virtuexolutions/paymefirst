<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PayMeFirst|@yield('title')</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{asset('admin')}}/plugins/fontawesome-free/css/all.min.css">
  <link rel="stylesheet" href="{{asset('admin/plugins/summernote/summernote.min.css')}}">

  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('admin')}}/dist/css/adminlte.min.css">
  <link rel="stylesheet" type="text/css" 
     href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	
</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">

@include('admin.layouts.header')

  <!-- Main Sidebar Container -->
@include('admin.layouts.sidebar')
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>{{\Route::current()->getName()}}</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">{{\Route::current()->getName()}}</li>
            </ol>
          </div>
        </div>
      </div>
    </section> -->

  <!-- Content Wrapper. Contains page content -->
@yield('content')
@show
  <!-- /.content-wrapper -->

@include('admin.layouts.footer')