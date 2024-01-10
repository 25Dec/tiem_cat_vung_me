import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';
import '../../features/auth/domain/usecases/sign_in.dart';
import '../../features/auth/domain/usecases/sign_up_with_email.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

part "injection_container.main.dart";
