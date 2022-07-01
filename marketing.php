
<?php
session_start();

if (!isset($_SESSION["login"])) {
  header("Location: login.php");
  exit;

  }

$id = $_GET["id"];

$ch = curl_init();
$url = "http://localhost:8181/brand/penjualan/$id";

curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);


$result = json_decode(curl_exec($ch), true);

// var_dump($result["data"]["penjualan"][0]["mitra"]); die;

curl_close($ch);

  $mobil = curl_init();
  $urlmobil = "http://localhost:8181/mobil/allmobil";

  curl_setopt($mobil, CURLOPT_URL, $urlmobil);
  curl_setopt($mobil, CURLOPT_RETURNTRANSFER, true);

  $mobilresult = json_decode(curl_exec($mobil), true);

  curl_close($mobil);
  // var_dump($mobilresult["data"][21]); die;
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title></title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/icons8-globe-32.png" rel="icon">
  <link href="assets/img/icons8-globe-32.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/stylebrand.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: iPortfolio - v3.7.0
  * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Mobile nav toggle button ======= -->
  <i class="bi bi-list mobile-nav-toggle d-xl-none"></i>

  <!-- ======= Header ======= -->
  <header id="header">
    <div class="d-flex flex-column">

      <div class="profile">
        <img src="assets/img/brands/<?= $result["data"]["gambar"] ?>" alt="" class="img-fluid rounded-circle">
        <h1 class="text-light"><a href="index.html"></a><?= htmlspecialchars($result["data"]["nama"]) ?></h1>
        <div class="social-links mt-3 text-center">
          <a href="<?= $result["data"]["website"] ?>" class="Website"><i class="bx bx-globe"></i></a>
          <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
          <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        </div>
      </div>

      <nav id="navbar" class="nav-menu navbar">
        <ul>
          <li><a href="#transaksi" class="nav-link scrollto active"><i class="bx bx-file-blank"></i> <span>Transaksi</span></a></li>  
          <li><a href="#unit" class="nav-link scrollto"><i class="bx bx-car"></i> <span>Unit Ready</span></a></li>
          <li><a href="logout.php" class="nav-link scrollto"><i class="bx bx-exit"></i> <span>Logout</span></a></li>
        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->

  <main id ="main">
   <!-- ======= transaksi Section ======= -->
  <section id="transaksi" class="transaksi" style="margin-top: -50px;">
      <div class="container">
        <div class="row">
          <div class="col">
            <h3>Tabel Transaksi</h3>
          <table class="table table-light table-striped">
            <thead class="table-dark">
              <tr>
                <th scope="col">#</th>
                <th scope="col">Tangaal</th>
                <th scope="col">Mitra</th>
                <th scope="col">Unit</th>
                <th scope="col">No Pol</th>
                <th scope="col">Status</th>
                <th scope="col">Driver</th>
                <th scope="col">Day</th>
                <th scope="col">Perhari</th>
                <th scope="col">Op</th>
                <th scope="col">Total</th>
                <th scope="col">Total Op</th>
                <th scope="col">Sisa Profit</th>
              </tr>
            </thead>
            <tbody>
              <?php 
              $no=1;
              ?>
              <?php foreach ($result["data"]["penjualan"] as $row ):?>
              <tr>
                <th scope="row"><?= $no++ ?></th>
                <td><?= $row["CreatedAt"] ?></td>
                <td><?= $row["mitra"] ?></td>
                <td><?= $row["unit"] ?></td>
                <td><?= $row["nopol"] ?></td>
                <td><?= $row["status"] ?></td>
                <td><?= $row["driver"] ?></td>
                <td><?= $row["day"] ?></td>
                <td><?= $row["perhari"] ?></td>
                <td><?= $row["op"] ?></td>
                <td><?= $row["total"] ?></td>
                <td><?= $row["total_op"] ?></td>
                <td><?= $row["sisa_profit"] ?></td>
              </tr>
              <?php endforeach; ?>
              
            </tbody>
            </table>
            
          </div>
        </div>

      </div>
    </section><!-- End transaksi Section -->

  <!-- ======= unit Section ======= -->
  <section id="unit" class="d-flex flex-column justify-content-center align-items-center">
    <div class="container">
      <div class="row">
        <h3> List Unit Ready</h3>
      <?php foreach ($mobilresult["data"] as $spek): 
            if($spek["is_ready"] == true) {
              $status = "Avalaible";
            } else {
              $status = "not Available";
            }

            ?>
        <div class="col-4">
          <div class="card mb-3" style="width: 18rem;">
            <img src="./assets/img/menu/<?= $spek["gambar"] ?>" class="card-img-top" alt="...">
            <div class="card-body">
            <ul class="list-group">
              <li class="list-group-item">Unit : <?= $spek["unit"] ?> </li>
              <li class="list-group-item">No Pol : <?= $spek["nopol"] ?></li>
              <li class="list-group-item">Mitra : <?= $spek["mitra"]["nama"] ?></li>
              <li class="list-group-item">Status : <?= $status ?></li>
            </ul>
            </div>
            
        </div>
        </div>
        <?php endforeach; ?>
      </div>
    </div>
  </main>

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Basecamp Pusat Rental Mobil Lombok</span></strong>
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/ -->
        Designed by <a href="#transaksi">Basecamp</a>
      </div>
    </div>
  </footer><!-- End  Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/typed.js/typed.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/mainbrand.js"></script>

</body>

</html>