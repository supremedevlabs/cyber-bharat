import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:isolate';

import '../../app_constants.dart';
import '../../models/service_result.dart';



class AIService {


  Future<String> generateTextInIsolate(String prompt) async {
    final receivePort = ReceivePort();

    await Isolate.spawn(_generateTextIsolate, [prompt, receivePort.sendPort]);

    final result = await receivePort.first;
    return result as String;
  }

  void _generateTextIsolate(List<dynamic> params) async {
    String prompt = params[0];
    SendPort sendPort = params[1];

    try {
      var generativeAI = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: AppConstants.apiKey,
        generationConfig: GenerationConfig(
          temperature: 0.4,
          topK: 32,
          topP: 1,
          maxOutputTokens: 4096,
        ),
        safetySettings: [
          SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
          SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
        ],
      );

      var chatSession = generativeAI.startChat();
      final response = await chatSession.sendMessage(Content.text(prompt));

      // If response is valid, send it back to the main thread
      if (response.text != null && response.text!.isNotEmpty) {
        sendPort.send(response.text!);
      } else {
        sendPort.send('Unexpected empty response');
      }
    } catch (e) {
      sendPort.send('Error: ${e.toString()}');
    }
  }

  Future<ServiceResult<String>> generateText(String prompt) async {
    if (prompt.isEmpty) {
      return ServiceResult(
        statusCode: StatusCode.badRequest,
        data: "",
        message: 'Please provide a prompt.',
      );
    }

    try {
      String generatedText = await generateTextInIsolate(prompt);

      if (generatedText.isNotEmpty) {
        return ServiceResult(
          statusCode: StatusCode.ok,
          data: generatedText,
          message: 'Text generated successfully.',
        );
      } else {
        return ServiceResult(
          statusCode: StatusCode.badRequest,
          data: "",
          message: 'Unexpected empty response from the API.',
        );
      }
    } catch (e) {
      return ServiceResult(
        statusCode: StatusCode.unknownError,
        data: "",
        message: 'An error occurred while generating text: $e',
      );
    }
  }

 
  
  static Future<Map<String, dynamic>> parseJsonInIsolate(
      String jsonString) async {
    return json.decode(jsonString);
  }
}
