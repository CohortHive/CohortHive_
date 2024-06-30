<?php
session_start();
require 'components/config.php';

// Ensure GitHub token is in session
if (!isset($_SESSION['github_token'])) {
    header('Location: index.php');
    exit;
}

$token = $_SESSION['github_token'];

// Ensure 'owner' and 'repo' are in query params
if (isset($_GET['owner']) && isset($_GET['repo'])) {
    $owner = urlencode($_GET['owner']);
    $repo = urlencode($_GET['repo']);
    $apiBase = "https://api.github.com/repos/$owner/$repo";
} else {
    header('Location: index.php');
    exit;
}

// Function to make GitHub API requests
function github_api_request($url, $token)
{
    $ch = curl_init($url);
    $headers = [
        "Authorization: token $token",
        "User-Agent: PHP Script"
    ];
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    if ($response === false) {
        $error = curl_error($ch);
        curl_close($ch);
        die("Curl error: $error");
    }
    curl_close($ch);

    if ($http_code !== 200) {
        die("Error fetching data from GitHub API: HTTP $http_code. Response: $response");
    }
    return json_decode($response, true);
}

// Function to list repository contents
function list_repo_contents($url, $token)
{
    return github_api_request($url, $token);
}

// Function to get repository metadata
function get_repo_metadata($apiBase, $token)
{
    $urls = [
        'contributors' => "$apiBase/contributors",
        'branches' => "$apiBase/branches",
        'commits' => "$apiBase/commits",
        'pulls' => "$apiBase/pulls",
        'releases' => "$apiBase/releases"
    ];

    $metadata = [];
    foreach ($urls as $key => $url) {
        $metadata[$key] = github_api_request($url, $token);
    }
    return $metadata;
}

// Get repository metadata
$metadata = get_repo_metadata($apiBase, $token);

// If path is set, get contents of that path
if (isset($_GET['path'])) {
    $path = urlencode($_GET['path']);
    $url = "$apiBase/contents/$path";
    $contents = list_repo_contents($url, $token);
    echo json_encode($contents);
    exit;
}

// Get root contents of the repository
$rootContents = list_repo_contents("$apiBase/contents", $token);

?>

<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>GitHub Repository Contents</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f7f7f7;
        }

        .container {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            background-color: #24292e;
            color: #fff;
            padding: 10px;
            margin: 0 -20px 20px;
            border-radius: 8px 8px 0 0;
        }

        .file-info {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        .file-info p {
            margin: 5px 0;
        }

        .btn-group {
            margin-top: auto;
        }

        .btn {
            margin-right: 10px;
        }

        .button-link {
            align-self: flex-start;
            margin-top: auto;
            padding: 8px 12px;
            background-color: #0366d6;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .button-link:hover {
            background-color: #024aa7;
        }

        .file-content {
            background-color: #f1f8ff;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        #metadata {
            margin-top: 20px;
        }

        #metadata h2 {
            background-color: #24292e;
            color: #fff;
            padding: 10px;
            margin: 20px 0 10px;
            border-radius: 5px;
        }

        .btn-primary {
            background-color: #0366d6;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            h1 {
                font-size: 1.8rem;
            }

            .file-info {
                font-size: 0.9rem;
            }

            .file-content {
                font-size: 0.9rem;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <h1 class="mb-4">Repository Contents</h1>
        <div id="content" class="mb-4"></div>
        <div id="metadata"></div>
    </div>
    <script>
        async function fetchContents(path = '') {
            const response = await fetch(`?owner=<?php echo $owner; ?>&repo=<?php echo $repo; ?>&path=${encodeURIComponent(path)}`);
            if (!response.ok) {
                alert('Error fetching repository contents: ' + response.status);
                return;
            }
            const data = await response.json();
            const container = document.getElementById('content');
            container.innerHTML = '';
            if (Array.isArray(data)) {
                data.forEach(item => {
                    const div = document.createElement('div');
                    div.classList.add('file-info');
                    div.innerHTML = `
                        <p><strong>Name:</strong> ${item.name}</p>
                        <p><strong>Type:</strong> ${item.type}</p>
                        <p><strong>Path:</strong> ${item.path}</p>
                    `;
                    const btnGroup = document.createElement('div');
                    btnGroup.classList.add('btn-group');

                    if (item.type === 'dir') {
                        const openButton = document.createElement('button');
                        openButton.classList.add('btn', 'btn-primary', 'btn-sm');
                        openButton.textContent = 'Open';
                        openButton.onclick = () => fetchContents(item.path);
                        btnGroup.appendChild(openButton);
                    } else if (item.type === 'file') {
                        const viewButton = document.createElement('button');
                        viewButton.classList.add('btn', 'btn-secondary', 'btn-sm');
                        viewButton.textContent = 'View Content';
                        viewButton.onclick = async () => {
                            const fileResponse = await fetch(item.download_url);
                            if (!fileResponse.ok) {
                                alert('Error fetching file content: ' + fileResponse.status);
                                return;
                            }
                            const fileContent = await fileResponse.text();
                            const contentDiv = document.createElement('div');
                            contentDiv.classList.add('file-content');
                            contentDiv.textContent = fileContent;
                            div.appendChild(contentDiv);
                        };
                        btnGroup.appendChild(viewButton);
                    }

                    if (item.html_url) {
                        const linkButton = document.createElement('a');
                        linkButton.classList.add('button-link', 'btn', 'btn-primary', 'btn-sm');
                        linkButton.href = item.html_url;
                        linkButton.textContent = 'Visit link';
                        btnGroup.appendChild(linkButton);
                    }

                    div.appendChild(btnGroup);
                    container.appendChild(div);
                });
            } else {
                container.innerHTML = '<p><em>No contents found or unable to decode JSON response.</em></p>';
            }
        }
        
        async function showMetadata() {
            const metadataContainer = document.getElementById('metadata');
            const metadata = <?php echo json_encode($metadata); ?>;
            metadataContainer.innerHTML = `
                <h2>Contributors</h2>
                <ul>${metadata.contributors.map(contributor => `<li>${contributor.login}</li>`).join('')}</ul>
                <h2>Branches</h2>
                <ul>${metadata.branches.map(branch => `<li>${branch.name}</li>`).join('')}</ul>
                <h2>Commits</h2>
                <ul>${metadata.commits.slice(0, 10).map(commit => `<li>${commit.commit.message} by ${commit.commit.author.name}</li>`).join('')}</ul>
                <h2>Pull Requests</h2>
                <ul>${metadata.pulls.slice(0, 10).map(pr => `<li>${pr.title} by ${pr.user.login}</li>`).join('')}</ul>
                <h2>Releases</h2>
                <ul>${metadata.releases.map(release => `<li>${release.name}</li>`).join('')}</ul>
            `;
        }

        document.addEventListener('DOMContentLoaded', () => {
            fetchContents();
            showMetadata();
        });
    </script>
</body>

</html>
