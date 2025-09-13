// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SearchSection extends StatefulWidget {
//   final Function(int?, int?) onSearch;
//   final VoidCallback onClear;

//   const SearchSection({
//     Key? key,
//     required this.onSearch,
//     required this.onClear,
//   }) : super(key: key);

//   @override
//   State<SearchSection> createState() => _SearchSectionState();
// }

// class _SearchSectionState extends State<SearchSection> {
//   final TextEditingController _userIdController = TextEditingController();
//   final TextEditingController _postIdController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _userIdController.addListener(_onTextChanged);
//     _postIdController.addListener(_onTextChanged);
//   }

//   @override
//   void dispose() {
//     _userIdController.removeListener(_onTextChanged);
//     _postIdController.removeListener(_onTextChanged);
//     _userIdController.dispose();
//     _postIdController.dispose();
//     super.dispose();
//   }

//   void _onTextChanged() {
//     if (_userIdController.text.isEmpty && _postIdController.text.isEmpty) {
//       widget.onClear();
//     }
//     setState(() {});
//   }

//   void _handleSearch() {
//     final userId = _userIdController.text.isNotEmpty
//         ? int.tryParse(_userIdController.text)
//         : null;
//     final postId = _postIdController.text.isNotEmpty
//         ? int.tryParse(_postIdController.text)
//         : null;

//     widget.onSearch(userId, postId);
//   }

//   InputDecoration _inputDecoration(
//       String hint, IconData suffixIcon, TextEditingController controller) {
//     return InputDecoration(
//       hintText: hint,
//       hintStyle: const TextStyle(color: Colors.black),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(80),
//         borderSide: BorderSide(color: Colors.grey[300]!),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(80),
//         borderSide: BorderSide(color: Colors.grey[300]!),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(80),
//         borderSide: const BorderSide(color: Colors.blue),
//       ),
//       contentPadding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 12,
//       ),
//       // 👇 fixed suffix icon
//       suffixIcon: Icon(suffixIcon, color: Colors.grey[600]),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // User ID with search icon
//           Expanded(
//             child: TextField(
//               controller: _userIdController,
//               keyboardType: TextInputType.number,
//               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               decoration: _inputDecoration(
//                 "User Experience Designer",
//                 Icons.search, // 👈 search icon
//                 _userIdController,
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),

//           // Post ID with location icon
//           Expanded(
//             child: TextField(
//               controller: _postIdController,
//               keyboardType: TextInputType.number,
//               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               decoration: _inputDecoration(
//                 "Hyattsville",
//                 Icons.location_on, // 👈 location icon
//                 _postIdController,
//               ),
//             ),
//           ),
//           const SizedBox(width: 16),

//           // Search Button
//           ElevatedButton(
//             onPressed: _handleSearch,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue[600],
//               foregroundColor: Colors.white,
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(80),
//               ),
//             ),
//             child: const Text(
//               'Search',
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// } 


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchSection extends StatefulWidget {
  final Function(int?, int?) onSearch;
  final VoidCallback onClear;

  const SearchSection({
    Key? key,
    required this.onSearch,
    required this.onClear,
  }) : super(key: key);

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _postIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userIdController.addListener(_onTextChanged);
    _postIdController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _userIdController.removeListener(_onTextChanged);
    _postIdController.removeListener(_onTextChanged);
    _userIdController.dispose();
    _postIdController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (_userIdController.text.isEmpty && _postIdController.text.isEmpty) {
      widget.onClear();
    }
    setState(() {});
  }

  void _handleSearch() {
    final userId = _userIdController.text.isNotEmpty
        ? int.tryParse(_userIdController.text)
        : null;
    final postId = _postIdController.text.isNotEmpty
        ? int.tryParse(_postIdController.text)
        : null;

    widget.onSearch(userId, postId);
  }

  InputDecoration _inputDecoration(
      String hint, IconData suffixIcon, TextEditingController controller, bool isMobile) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(80),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(80),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(80),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 16,
        vertical: isMobile ? 10 : 12,
      ),
      suffixIcon: Icon(suffixIcon, color: Colors.grey[600], size: isMobile ? 20 : 24),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1024;
        
        return Container(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: isMobile 
            ? _buildMobileLayout(isMobile)
            : _buildDesktopLayout(isMobile, isTablet),
        );
      },
    );
  }

  Widget _buildMobileLayout(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // User ID field
        TextField(
          controller: _userIdController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: _inputDecoration(
            "User Experience Designer",
            Icons.search,
            _userIdController,
            isMobile,
          ),
        ),
        const SizedBox(height: 12),

        // Post ID field
        TextField(
          controller: _postIdController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: _inputDecoration(
            "Hyattsville",
            Icons.location_on,
            _postIdController,
            isMobile,
          ),
        ),
        const SizedBox(height: 16),

        // Search Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _handleSearch,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
            ),
            child: const Text(
              'Search',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isMobile, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // User ID with search icon
        Expanded(
          flex: isTablet ? 2 : 1,
          child: TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: _inputDecoration(
              "User Experience Designer",
              Icons.search,
              _userIdController,
              isMobile,
            ),
          ),
        ),
        SizedBox(width: isTablet ? 12 : 16),

        // Post ID with location icon
        Expanded(
          flex: isTablet ? 2 : 1,
          child: TextField(
            controller: _postIdController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: _inputDecoration(
              "Hyattsville",
              Icons.location_on,
              _postIdController,
              isMobile,
            ),
          ),
        ),
        SizedBox(width: isTablet ? 12 : 16),

        // Search Button
        ElevatedButton(
          onPressed: _handleSearch,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[600],
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 20 : 24, 
              vertical: isTablet ? 14 : 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          child: Text(
            'Search',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isTablet ? 14 : 16,
            ),
          ),
        ),
      ],
    );
  }
}