<?php
// *************************************************************************
// *                                                                       *
// * DEPRIXA PRO -  Integrated Web Shipping System                         *
// * Copyright (c) JAOMWEB. All Rights Reserved                            *
// *                                                                       *
// *************************************************************************
// *                                                                       *
// * Email: support@jaom.info                                              *
// * Website: http://www.jaom.info                                         *
// *                                                                       *
// *************************************************************************
// *                                                                       *
// * This software is furnished under a license and may be used and copied *
// * only  in  accordance  with  the  terms  of such  license and with the *
// * inclusion of the above copyright notice.                              *
// * If you Purchased from Codecanyon, Please read the full License from   *
// * here- http://codecanyon.net/licenses/standard                         *
// *                                                                       *
// *************************************************************************


$userData = $user->cdp_getUserData();
$statusrow = $core->cdp_getStatus();


?>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/<?php echo $core->favicon ?>">
    <title><?php echo $lang['shiplist'] ?> | <?php echo $core->site_name ?></title>
    <!-- This Page CSS -->
    <!-- Custom CSS -->
    <link href="assets/css/style.min.css" rel="stylesheet">

    <link href="assets/css/front.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="assets/js/jquery.js"></script>
    <script type="text/javascript" src="assets/js/jquery-ui.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.js"></script>
    <script src="assets/js/jquery.wysiwyg.js"></script>
    <script src="assets/js/global.js"></script>
    <script src="assets/js/custom.js"></script>
    <link href="assets/customClassPagination.css" rel="stylesheet">
    <link href="assets/css/scroll-menu.css" rel="stylesheet">




</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->


    <?php include 'views/inc/preloader.php'; ?>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->

        <?php include 'views/inc/topbar.php'; ?>

        <!-- End Topbar header -->


        <!-- Left Sidebar - style you can find in sidebar.scss  -->

        <?php include 'views/inc/left_sidebar.php'; ?>


        <!-- End Left Sidebar - style you can find in sidebar.scss  -->

        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">

            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-5 align-self-center">
                        <h4 class="page-title"> <?php echo $lang['shiplist']; ?> | <i class="fas fa-cubes"></i> <?php echo $lang['filter24']; ?></h4>

                    </div>
                </div>
            </div>

            <!-- Action part -->
            <!-- Button group part -->
            <div class="bg-light p-15">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-12">
                                <!-- <div id="loader" style="display:none"></div> -->
                                <div id="resultados_ajax"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Action part -->


            <div class="container-fluid">
                <div class="row">
                    <!-- Column -->

                    <div class="col-lg-12 col-xl-12 col-md-12">

                        <div class="card">
                            <div class="card-body">

                                <div class="row mb-5">
                                    <div class="col-md-3 col-sm-12">
                                        <!-- <div class="form-group"> -->
                                        <div class="btn-group mt-2 hide" id="div-actions-checked">
                                            <span class="mt-2 mr-4"><strong id="countChecked"> Selected: 0</strong></span>
                                            <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Selected actions
                                            </button>
                                            <div class="dropdown-menu">
                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalCheckboxStatus"><i style="color:#20c997" class="ti-reload"></i>&nbsp;Edit Status</a>

                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modalDriverCheckbox"><i style="color:#ff0000" class="fas fa-car"></i>&nbsp;<?php echo $lang['left208'] ?></a>

                                                <a class="dropdown-item" onclick="cdp_printMultipleLabel();" target="_blank"> <i style="color:#343a40" class="ti-printer"></i>&nbsp;<?php echo $lang['toollabel'] ?> </a>


                                            </div>
                                        </div>
                                        <!-- </div> -->

                                    </div>

                                    <?php
                                    if ($user->cdp_is_Admin()) { ?>

                                        <div class=" col-sm-12 col-md-2 offset-7">

                                            <div class="form-group">
                                                <a href="courier_add.php"><button type="button" class="btn btn-primary "><i class="ti-plus" aria-hidden="true"></i> <?php echo $lang['createnewship'] ?></button></a>
                                            </div>
                                        </div>

                                    <?php } ?>

                                    <?php
                                if ($userData->userlevel == 1 ) { ?>
                                    <div class=" col-sm-12 col-md-2 offset-7">

                                        <div class="form-group">
                                            <a href="courier_add_client.php"><button type="button" class="btn btn-primary "><i class="ti-plus" aria-hidden="true"></i> <?php echo $lang['createnewship'] ?></button></a>
                                        </div>
                                    </div>
                                <?php } ?>

                                </div>

                                <div class="row mb-3 ml-2">

                                    <div class=" col-sm-12 col-md-4">

                                        <div class="input-group">
                                            <input type="text" name="search" id="search" class="form-control input-sm float-right" placeholder="search tracking" onkeyup="cdp_load(1);">
                                            <div class="input-group-append input-sm">
                                                <button type="submit" class="btn btn-info"><i class="fa fa-search"></i></button>
                                            </div>

                                        </div>
                                    </div><!-- /.col -->

                                    <div class="col-sm-12 col-md-3">
                                        <div class="input-group">
                                            <select onchange="cdp_load(1);" class="form-control custom-select" id="status_courier" name="status_courier">
                                                <option value="0">--<?php echo $lang['left210'] ?>--</option>
                                                <?php foreach ($statusrow as $row) : ?>
                                                    <option value="<?php echo $row->id; ?>"><?php echo $row->mod_style; ?></option>

                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-12 col-md-2">
                                        <div class="input-group">
                                            <select onchange="cdp_load(1);" class="form-control custom-select" id="filterby" name="filterby">
                                                <option value="0">Filter By</option>
                                                <option value="1">Pickup</option>
                                                <option value="2">Send</option>
                                                <option value="3">Consolidated</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="outer_divx"></div>


                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
            </div>

            <?php
            include('views/modals/modal_update_status_checked.php');
            ?>
            <?php include('views/modals/modal_send_email.php'); ?>

            <?php include('views/modals/modal_update_driver.php'); ?>
            <?php include('views/modals/modal_update_driver_checked.php'); ?>
            <?php include('views/modals/modal_verify_payment_packages.php'); ?>

            <?php include('views/modals/modal_cancel_pickup.php'); ?>

            <?php include('views/modals/modal_delete_pickup.php'); ?>


            <?php include('views/modals/modal_charges_list.php'); ?>
            <?php include('views/modals/modal_charges_add.php'); ?>
            <?php include('views/modals/modal_charges_edit.php'); ?>

        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->

 
    <!-- ============================================================== -->
    <!-- All Jquery --> 
    <!-- ============================================================== -->
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/custom_dependencies/jquery-3.6.0.min.js"></script>
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/custom_dependencies/bootstrap.min.js"></script>
    <!-- apps -->
    <script src="assets/js/app.min.js"></script>
    <script src="assets/js/app-style-switcher.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="assets/js/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="assets/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="assets/js/custom.min.js"></script>

    <script src="dataJs/courier.js"></script> 


</body>

</html>