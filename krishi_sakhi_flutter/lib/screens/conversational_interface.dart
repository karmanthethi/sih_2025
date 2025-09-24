import 'package:flutter/material.dart';
import '../services/navigation_service.dart';
import '../utils/app_theme.dart';

class ConversationalInterface extends StatefulWidget {
  const ConversationalInterface({super.key});

  @override
  State<ConversationalInterface> createState() => _ConversationalInterfaceState();
}

class _ConversationalInterfaceState extends State<ConversationalInterface> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    // Add initial welcome message
    _messages.add(
      ChatMessage(
        text: 'നമസ്കാരം! മലയാളത്തിൽ എന്നോട് സംസാരിക്കാം. നിങ്ങളുടെ കൃഷിയെ കുറിച്ച് എന്തെങ്കിലും ചോദ്യങ്ങൾ ഉണ്ടോ?',
        isUser: false,
        timestamp: DateTime.now(),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.saffron.withOpacity(0.1),
              Colors.white,
              AppTheme.green.withOpacity(0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        NavigationService.goBack();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppTheme.saffron,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Krishi Mitra',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.saffron,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              
              // Chat messages
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _buildMessageBubble(_messages[index]);
                  },
                ),
              ),
              
              // Input area
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'ഒരു സന്ദേശം ടൈപ്പ് ചെയ്യുക...',
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _sendMessage,
                            icon: const Icon(
                              Icons.send,
                              color: AppTheme.green,
                            ),
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    
                    const SizedBox(width: 8),
                    
                    // Voice input button
                    Container(
                      decoration: const BoxDecoration(
                        color: AppTheme.green,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: _toggleVoiceInput,
                        icon: Icon(
                          _isListening ? Icons.mic : Icons.mic_none,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message.isUser 
            ? MainAxisAlignment.end 
            : MainAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.support_agent,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
          ],
          
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: message.isUser 
                    ? AppTheme.saffron
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isUser 
                      ? Colors.white 
                      : Colors.grey[800],
                  fontSize: 14,
                ),
              ),
            ),
          ),
          
          if (message.isUser) ...[
            const SizedBox(width: 8),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppTheme.saffron,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ],
      ),
    );
  }
  
  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    
    setState(() {
      _messages.add(
        ChatMessage(
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );
    });
    
    _messageController.clear();
    _scrollToBottom();
    
    // Simulate AI response
    Future.delayed(const Duration(seconds: 1), () {
      _simulateAIResponse(text);
    });
  }
  
  void _simulateAIResponse(String userMessage) {
    String response = '';
    
    // Simple Malayalam responses based on keywords
    if (userMessage.contains('കീട') || userMessage.contains('pest')) {
      response = 'കീടങ്ങളെ നിയന്ത്രിക്കാൻ നിങ്ങൾക്ക് ജൈവ കീടനാശിനികൾ ഉപയോഗിക്കാം. നീം ഓയിൽ വളരെ ഫലപ്രദമാണ്.';
    } else if (userMessage.contains('വെള്ളം') || userMessage.contains('water')) {
      response = 'നിങ്ങളുടെ വിളയ്ക്ക് അനുയോജ്യമായ ജലസേചന രീതി ഡ്രിപ് ഇറിഗേഷൻ ആണ്. ഇത് വെള്ളം ലാഭിക്കാൻ സഹായിക്കും.';
    } else if (userMessage.contains('വളം') || userMessage.contains('fertilizer')) {
      response = 'ജൈവ വളങ്ങൾ മണ്ണിന്റെ ആരോഗ്യത്തിനു നല്ലതാണ്. കമ്പോസ്റ്റും പശുവളവും ഉപയോഗിക്കാം.';
    } else {
      response = 'നിങ്ങളുടെ ചോദ്യം മനസ്സിലായി. കൂടുതൽ വിശദമായ വിവരങ്ങൾക്കായി കൃഷി വിദഗ്ധനെ സമീപിക്കുക.';
    }
    
    setState(() {
      _messages.add(
        ChatMessage(
          text: response,
          isUser: false,
          timestamp: DateTime.now(),
        ),
      );
    });
    
    _scrollToBottom();
  }
  
  void _toggleVoiceInput() {
    setState(() {
      _isListening = !_isListening;
    });
    
    if (_isListening) {
      // Simulate voice recognition
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isListening = false;
        });
        _messageController.text = 'എന്റെ വിളയിൽ കീടങ്ങൾ ഉണ്ട്, എന്ത് ചെയ്യാം?';
      });
    }
  }
  
  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  
  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}