import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Display current date with riverpod hooks
//
/// Wrap main with providerscope for gloabal access
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     const ProviderScope(
//     child: MyApp(),
//     ),
//    );
// }

final currentDate = Provider<DateTime>((ref) => DateTime.now());

class TryThis extends ConsumerWidget {
  const TryThis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(currentDate);
    //final example = ref.watch(helloWorldProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hooks RiverPodPlay'),
      ),
      body: Center(
        child: Text(
          date.toIso8601String(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
