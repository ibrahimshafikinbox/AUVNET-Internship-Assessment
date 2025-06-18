import 'dart:io';

void main() {
  
  final files = Directory('.')
      .listSync(recursive: true)
      .whereType<File>() 
      .where((f) => f.path.endsWith('.dart'));

  
  
  
  
  
  final commentPattern = RegExp(
    r'(/\*[\s\S]*?\*/)|(
    multiLine: true,
  );

  print('Starting to remove comments from Dart files...');

  for (final file in files) {
    print('🔍 Processing: ${file.path}');
    try {
      final content = file.readAsStringSync();

      
      
      
      final cleanedContent = content.replaceAll(commentPattern, '');

      file.writeAsStringSync(cleanedContent);
      print('✅ Cleaned: ${file.path}');
    } catch (e) {
      print('❌ Error processing ${file.path}: $e');
    }
  }

  print(
      '\n🎉 Comment removal attempt complete for ${files.length} Dart files.');
  print(
      '⚠️ WARNING: While this script attempts to remove comments, complex cases (like comment-like strings) might be affected. Always backup your code before running such scripts.');
}
