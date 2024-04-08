import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rolla_task/domain/local/token_store.dart';

final tokenStoreProvider = Provider<TokenStore>((ref) => TokenStore());
