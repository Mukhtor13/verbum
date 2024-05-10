import 'package:dictionary/app/ui/screens/select_dictionary/select_dictionary_screen_view_model.dart';
import 'package:dictionary/app/ui/screens/select_dictionary/widgets/navigate_home_button.dart';
import 'package:dictionary/app/ui/screens/select_dictionary/widgets/select_type_button.dart';
import 'package:dictionary/constants/constants.dart';
import 'package:dictionary/data/storage/dictionary_type_storage.dart';
import 'package:flutter/material.dart';

class SelectDictionaryScreen extends StatefulWidget {
  const SelectDictionaryScreen({required this.viewModel, super.key});

  final SelectDictionaryScreenViewModel viewModel;

  @override
  State<SelectDictionaryScreen> createState() => _SelectDictionaryScreenState();
}

class _SelectDictionaryScreenState extends State<SelectDictionaryScreen> {
  DictionaryTypeStorage storage = DictionaryTypeStorage();
  bool englishUzbek = false;
  bool uzbekEnglish = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Assalomu Alaykum 🤗', style: AppTypography.h2),
              const SizedBox(height: 8),
              const Text('Lug\'at turini tanlang', style: AppTypography.h2),
              const SizedBox(height: 32),
              SelectTypeButton(
                onPressed: () {
                  storage.saveDictTypeKey(0);
                  setState(() {
                    englishUzbek = true;
                    uzbekEnglish = false;
                  });
                },
                title: 'English-Uzbek',
                buttonWidth: widget.viewModel.buttonWidth(context),
                isActice: englishUzbek,
              ),
              const SizedBox(height: 16),
              SelectTypeButton(
                onPressed: () {
                  storage.saveDictTypeKey(1);
                  setState(() {
                    uzbekEnglish = true;
                    englishUzbek = false;
                  });
                },
                title: 'O\'zbekcha-Inglizcha',
                buttonWidth: widget.viewModel.buttonWidth(context),
                isActice: uzbekEnglish,
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: storage.dictTypeKey != null,
                replacement: const SizedBox(height: 60),
                child: NavigateHomeButton(
                  width: widget.viewModel.buttonWidth(context) / 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
