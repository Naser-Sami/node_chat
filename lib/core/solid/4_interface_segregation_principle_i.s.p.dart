// • Advanced Example:
// Suppose you have an application
// that handles various types of file uploads like images,
// videos, and documents,
// but each type has different requirements.

// Bad example: One large interface forces classes to implement methods they don't need.
import 'dart:developer';

abstract class FileUploaderBad {
  void uploadImage(String path);
  void uploadVideo(String path);
  void uploadDocument(String path);
}

class ImageUploaderBad implements FileUploaderBad {
  @override
  void uploadImage(String path) {
    log('Uploading image from $path');
  }

  @override
  void uploadVideo(String path) {
    // Not needed, violates ISP
  }

  @override
  void uploadDocument(String path) {
    // Not needed, violates ISP
  }
}

// Good example: Separate interfaces for each type of file upload.
abstract class ImageUpload {
  void uploadImage(String path);
}

abstract class VideoUpload {
  void uploadVideo(String path);
}

abstract class DocumentUpload {
  void uploadDocument(String path);
}

class ImageUploader implements ImageUpload {
  @override
  void uploadImage(String path) {
    log('Uploading image from $path');
  }
}

class VideoUploader implements VideoUpload {
  @override
  void uploadVideo(String path) {
    log('Uploading video from $path');
  }
}

class DocumentUploader implements DocumentUpload {
  @override
  void uploadDocument(String path) {
    log('Uploading document from $path');
  }
}

	// • Why is this better?:
  // Each uploader class only depends on the methods it needs,
  // making the system more modular and easy to maintain.