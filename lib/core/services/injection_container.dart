import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';
import '../../features/auth/domain/usecases/register_account.dart';
import '../../features/auth/domain/usecases/send_otp.dart';
import '../../features/auth/domain/usecases/sign_out.dart';
import '../../features/auth/domain/usecases/verify_otp.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/home/domain/repositories/home_repo.dart';
import '../../features/home/domain/usecases/get_all_products.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/product_details/data/datasources/product_details_remote_data_source.dart';
import '../../features/product_details/data/repositories/product_details_repo_impl.dart';
import '../../features/product_details/domain/repositories/product_details_repo.dart';
import '../../features/product_details/domain/usecases/add_to_cart.dart';
import '../../features/product_details/domain/usecases/add_to_favorites.dart';
import '../../features/product_details/domain/usecases/get_product_details.dart';
import '../../features/product_details/presentation/bloc/product_details_bloc.dart';

part "injection_container.main.dart";
