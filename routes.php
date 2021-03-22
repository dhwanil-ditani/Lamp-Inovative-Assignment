<?php

Route::set('index.php', function() {
    Controller::createView("Index");
});

Route::set('login', function() {
    Controller::createView("Login");
});

Route::set('student-dash', function() {
    Controller::createView("StudentDashboard");
});

Route::set('faculty-dash', function() {
    Controller::createView("FacultyDashboard");
});

?>