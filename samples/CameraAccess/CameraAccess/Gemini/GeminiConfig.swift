import Foundation

enum GeminiConfig {
  static let websocketBaseURL = "wss://generativelanguage.googleapis.com/ws/google.ai.generativelanguage.v1beta.GenerativeService.BidiGenerateContent"
  static let model = "models/gemini-2.5-flash-native-audio-preview-12-2025"

  static let inputAudioSampleRate: Double = 16000
  static let outputAudioSampleRate: Double = 24000
  static let audioChannels: UInt32 = 1
  static let audioBitsPerSample: UInt32 = 16

  static let videoFrameInterval: TimeInterval = 1.0
  static let videoJPEGQuality: CGFloat = 0.5

  static let systemInstruction = "You are an AI assistant helping someone wearing smart glasses. You can see what they see through their glasses camera. Describe what you see when asked, and answer questions conversationally. Keep responses concise and natural."

  static var apiKey: String {
    get { UserDefaults.standard.string(forKey: "gemini_api_key_v2") ?? "" }
    set { UserDefaults.standard.set(newValue, forKey: "gemini_api_key_v2") }
  }

  static func websocketURL() -> URL? {
    guard !apiKey.isEmpty else { return nil }
    return URL(string: "\(websocketBaseURL)?key=\(apiKey)")
  }
}
