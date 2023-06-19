<?php
include 'db.php';
session_start();

if (isset($_POST['submit']) && !empty($_POST['submit'])) {
    if (isset($_POST['MovieId']) && !empty($_POST['MovieId'])) {
        $movieId = $_POST['MovieId'];
        $deletedMovies = deleteMovieById($db, $movieId);
        if ($deletedMovies > 0) {
            echo "<script>alert('Successfully deleted $deletedMovies movie(s)');</script>";
        } else {
            echo "<script>alert('Failed to delete movie(s)');</script>";
        }
    } elseif (isset($_POST['selectedMovies']) && !empty($_POST['selectedMovies'])) {
        $selectedMovies = $_POST['selectedMovies'];
        $deletedMovies = deleteMovies($db, $selectedMovies);
        if ($deletedMovies > 0) {
            echo "<script>alert('Successfully deleted $deletedMovies movie(s)');</script>";
        } else {
            echo "<script>alert('Failed to delete movie(s)');</script>";
        }
    } else {
        echo "<script>alert('Please select movie(s) to delete');</script>";
    }
}

function deleteMovieById($db, $movieId)
{
    $sql = "DELETE FROM movies WHERE id=?";
    $stmt = $db->prepare($sql);
    if (!$stmt) {
        var_dump($db->error);
        return 0;
    }
    $stmt->bind_param("i", $movieId);
    $stmt->execute();
    $deletedCount = $stmt->affected_rows;
    $stmt->close();
    return $deletedCount;
}

function deleteMovies($db, $movies)
{
    $deletedCount = 0;
    $sql = "DELETE FROM movies WHERE id IN (" . implode(",", $movies) . ")";
    $stmt = $db->prepare($sql);
    if (!$stmt) {
        var_dump($db->error);
        return $deletedCount;
    }
    $stmt->execute();
    $deletedCount = $stmt->affected_rows;
    $stmt->close();
    return $deletedCount;
}
?>


<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        * h1 {
            font-size: 30px;
            color: beige;
        }

        .dell-movie {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .heading {
            margin-bottom: 60px;
            font-size: 30px;
            color: beige;
        }

        .movie-details {
            border-radius: 15px;
            padding: 25px 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .back-to-admin button {
            padding: 20px;
            background-color: #b22222;
            color: white;
            font-size: 20px;
            margin-bottom: 20px;
            border: 2px solid #b22222;
            border-radius: 50px;
            cursor: pointer;
        }

        form {
            display: flex;
            flex-direction: column;
            background-color: rgba(88, 88, 88, .9);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 125px;
            width: 65%;
        }

        .movie-name {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            font-size: 25px;
        }

        .movie-name input {
            width: 50%;
            padding: 10px;
            border-radius: 10px;
            border: 2px solid #b22222;
            font-size: 20px;
        }

        .movie-name button {
            padding: 10px;
            border-radius: 10px;
            border: 2px solid #b22222;
            font-size: 20px;
            background-color: #b22222;
            color: white;
            cursor: pointer;
        }

        .movie-name button:hover {
            background-color: white;
            color: #b22222;
        }

        .movie-name input:hover {
            border: 2px solid white;
        }

        .movie-name input:focus {
            border: 2px solid white;
        }

        .movie-name input::placeholder {
            color: #b22222;
        }

        .error {
            text-align: center;
            color: red;
            font-size: 15px;
        }

        .success {
            text-align: center;
            color: green;
            font-size: 15px;
        }

        .back-to-admin button:hover {
            background-color: white;
            color: #b22222;
        }

        .submit {
            display: flex;
            justify-content: center;
        }

        .btn-DelMovie {
            padding: 10px;
            border-radius: 10px;
            border: 2px solid #b22222;
            font-size: 20px;
            background-color: #b22222;
            color: white;
            cursor: pointer;
        }
    </style>

    <script type="text/javascript">
        function validateMovie() {
            var movieId = document.forms["movie-form"]["MovieId"].value;
            var movieIdError = document.getElementById("movieIdError");
            var movieIdSuccess = document.getElementById("movieIdSuccess");
            var movieIdRegex = /^[0-9]+$/;

            if (movieId == "") {
                movieIdError.innerHTML = "Movie ID is required";
                return false;
            } else if (!movieIdRegex.test(movieId)) {
                movieIdError.innerHTML = "Movie ID must be a valid integer";
                return false;
            } else {
                movieIdError.innerHTML = "";
                movieIdSuccess.innerHTML = "Movie ID is valid";
                return true;
            }
        }
    </script>
</head>
<body>
    <div class="overall-background">
        <?php include_once 'header1.php'; ?>
        <div class="dell-movie">
            <div class="heading">
                <h1>Delete Movie</h1>
            </div>
            <div class="movie-details">
                <form name="movie-form" action="DeleteMovie.php" method="POST" onsubmit="return validateMovie()">
                    <div class="movie-name">
                        <label>Movie ID</label>
                        <input type="text" name="MovieId" placeholder="Enter Movie ID">
                        <button class="btn-DelMovie" type="submit" onclick="return validateMovie()" name="submit">Delete Movie</button>
                    </div>
                    <div class="error" id="movieIdError"></div>
                    <div class="success" id="movieIdSuccess"></div>
                </form>

                <form name="delete-form" action="DeleteMovie.php" method="POST">
                    <div class="movie-list">
                        <label>Select Movie(s) to Delete:</label>
                        <?php
                        $sql = "SELECT MovieId, MovieName FROM movies";
                        $stmt = $db->prepare($sql);
                        $stmt->execute();
                        $result = $stmt->get_result();
                        while ($row = $result->fetch_assoc()) {
                            $movieId = $row['MovieId'];
                            $movieName = $row['MovieName'];
                            echo "<div><input type='checkbox' name='selectedMovies[]' value='$movieId'>$movieName</div>";
                        }
                        ?>
                    </div>
                    <div class="submit">
                        <button class="btn-DelMovie" type="submit" name="submit">Delete Selected Movies</button>
                    </div>
                </form>

                <div class="back-to-admin">
                    <button onclick="window.location.href='Admin.php'">Back to Admin</button>
                </div>
            </div>
        </div>
        <?php include 'footer.php'; ?>
    </div>
</body>
</html>
