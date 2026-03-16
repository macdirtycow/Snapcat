// CameraManager.swift

import Foundation
import AVFoundation

class CameraManager {
    private let captureSession = AVCaptureSession()
    private var cameraDevice: AVCaptureDevice?
    private var videoInput: AVCaptureDeviceInput?
    private var photoOutput: AVCapturePhotoOutput?

    func setupCamera() {
        // Request camera access
        AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
            if granted {
                self?.initializeCamera()
            } else {
                print("Camera access denied")
            }
        }
    }

    private func initializeCamera() {
        if let devices = AVCaptureDevice.devices(for: .video) {
            cameraDevice = devices.first
            do {
                videoInput = try AVCaptureDeviceInput(device: cameraDevice!)
                if captureSession.canAddInput(videoInput!) {
                    captureSession.addInput(videoInput!)
                }
                photoOutput = AVCapturePhotoOutput()
                if captureSession.canAddOutput(photoOutput!) {
                    captureSession.addOutput(photoOutput!)
                }
                captureSession.startRunning()
            } catch {
                print("Error initializing camera: \(error)")
            }
        }
    }

    func takePhoto(completion: @escaping (Data?) -> Void) {
        let settings = AVCapturePhotoSettings() // Customize settings if needed.
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }
}

extension CameraManager: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error)")
            completion(nil)
            return
        }
        if let imageData = photo.fileDataRepresentation() {
            completion(imageData)
        } else {
            completion(nil)
        }
    }
}