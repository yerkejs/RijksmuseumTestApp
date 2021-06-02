extension StringExtension on String {
    /// Capitalizes first letter of the string 
    /// For intance "hello World" becomes Hello World
    String capitalize() {
      return "${this[0].toUpperCase()}${this.substring(1)}";
    }
}