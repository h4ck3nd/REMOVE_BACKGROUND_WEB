<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2, h3 {
            color: #2c3e50;
        }
        img {
            max-width: 100%;
            border-radius: 8px;
            margin-top: 20px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }
        .button {
            background-color: #27ae60;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            margin: 20px 10px 0 10px;
            transition: background 0.3s ease;
        }
        .button:hover {
            background-color: #219150;
        }
        .loader {
            display: none;
            margin-top: 20px;
        }
        .loader:after {
            content: " ";
            display: inline-block;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            border: 4px solid #27ae60;
            border-color: #27ae60 transparent #27ae60 transparent;
            animation: spin 1.2s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        .history {
            margin-top: 40px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }
        .history img {
            width: 100px;
            border-radius: 6px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Imagen procesada con éxito:</h2>

    <img src="<%= request.getContextPath() %>/download?file=${imageName}" alt="Imagen sin fondo"><br>

    <a href="<%= request.getContextPath() %>/download?file=${imageName}" onclick="showLoader()">
        <button class="button">Descargar</button>
    </a>

    <a href="<%= request.getContextPath() %>/index.jsp">
        <button class="button" style="background-color:#34495e;">Subir otra imagen</button>
    </a>

    <div class="loader" id="loader"></div>

    <%
        List<String> history = (List<String>) session.getAttribute("history");
        String contextPath = request.getContextPath();
        if (history != null && history.size() > 1) {
    %>
    <h3>Historial de imágenes procesadas:</h3>
    <div class="history">
        <%
            for (int i = history.size() - 2; i >= 0; i--) {
                String file = history.get(i);
        %>
        <a href="<%= contextPath %>/download?file=<%= file %>" title="Descargar">
            <img src="<%= contextPath %>/download?file=<%= file %>" />
        </a>
        <%
            }
        %>
    </div>
    <%
        }
    %>
</div>

<script>
    function showLoader() {
        document.getElementById('loader').style.display = 'inline-block';
    }
</script>
</body>
</html>
