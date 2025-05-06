<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
    <title>Eliminar fondo de imagen</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f1f1;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 80px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        h1 {
            color: #333;
        }
        input[type="file"] {
            margin: 15px 0;
        }
        button {
            background-color: #3498db;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #2980b9;
        }
        #progressBarContainer {
            display: none;
            margin-top: 20px;
        }
        .progress {
            width: 100%;
            background-color: #eee;
            border-radius: 8px;
            overflow: hidden;
        }
        .progress-bar {
            height: 16px;
            width: 0%;
            background-color: #3498db;
            animation: progress 3s infinite;
        }
        @keyframes progress {
            0% { width: 0%; }
            50% { width: 80%; }
            100% { width: 0%; }
        }
        #processingText {
            margin-top: 10px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Eliminar fondo de imagen</h1>
    <form method="post" action="<%= request.getContextPath() %>/upload" enctype="multipart/form-data" onsubmit="showProgress()">
        <input type="file" name="image" accept="image/*" required>
        <br>
        <button type="submit">Subir y procesar</button>

        <div id="progressBarContainer">
            <div class="progress">
                <div class="progress-bar" id="progressBar"></div>
            </div>
            <div id="processingText">Procesando imagen, por favor espera...</div>
        </div>
    </form>
</div>

<script>
    function showProgress() {
        document.getElementById('progressBarContainer').style.display = 'block';
    }
</script>
</body>
</html>
