<?php
if(session_status()===PHP_SESSION_NONE){
    session_start();
}
require_once "../../components/config.php";
require_once "../components/UserAuthorization.php";
$user_name=$_SESSION['name'];
$room_id=$_SESSION['room_code'];

?>


<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Room</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='styles/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='styles/lobby.css'>
</head>
<body>

    <header id="nav">
       <div class="nav--list">
            <a href="../index.php?room=<?php echo $room_id;?>">
                <h3 id="logo">
                    <img src="images/logo.png" alt="">
                    <span>CohortHive | </span>
                    <span><?php echo $_SESSION['room_name']; ?></span>
                </h3>
            </a>
       </div>

       
    </header>

    <main id="room__lobby__container">
        
        <div id="form__container">
             <div id="form__container__header">
                 <p>👋 Join Room</p>
             </div>
 
 
            <form id="lobby__form" >
 
                 <div class="form__field__wrapper">
                     <label>Your Name</label>
                     <input type="text" name="name" value="<?php echo htmlspecialchars($user_name); ?>" disabled style="cursor: not-allowed;" />
                 </div>
 
                 <div class="form__field__wrapper">
                     <label>Room Name</label>
                     <input type="text" name="room"  value="<?php echo htmlspecialchars($room_id); ?>" disabled style="cursor: not-allowed;" />
                 </div>
 
                 <div class="form__field__wrapper">
                     <button type="submit">Go to Room 
                         <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M13.025 1l-2.847 2.828 6.176 6.176h-16.354v3.992h16.354l-6.176 6.176 2.847 2.828 10.975-11z"/></svg>
                    </button>
                 </div>
            </form>
        </div>
     </main>
    
</body>
<script type="text/javascript" src="js/lobby.js"></script>
</html>