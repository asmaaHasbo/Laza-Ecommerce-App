import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_ecommerce_app/core/networking/api_result.dart';
import 'package:laza_ecommerce_app/features/home/data/models/category_model/categories_model.dart';
import 'package:laza_ecommerce_app/features/home/data/models/products_model/product_resquest_model.dart';
import 'package:laza_ecommerce_app/features/home/data/models/products_model/products_model.dart';
import 'package:laza_ecommerce_app/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  //============================ get Categories =================
  emitGetCategories() async {
    emit(HomeCategoryLoading());
    log('loading');
    ApiResult<CategoriesModel> response = await homeRepo.getCategories();
    response.when(
      success: (categoryModel) {
        log(categoryModel.categories?[2].name ?? 'No name');
        emit(HomeCategorySuccess(categoryModel: categoryModel));
      },
      failure: (err) {
        log(err);
        emit(HomeCategoryFailure(errMsg: err));
      },
    );
  }

  //============================ get product =================
  emitGetProducts() async {
    emit(HomeProductLoading());
    log('loading');
    ApiResult<ProductsModel> response = await homeRepo.getProducts(
      ProductResquestModel(
        searchTerm: null,
        category: null,
        minPrice: null,
        maxPrice: null,
        isInStock: null,
        sortBy: null,
        sortOrder: null,
        page: 1,
        pageSize: 500,
      ),
    );
    response.when(
      success: (productsModel) {
        if (productsModel.items != null && productsModel.items!.isNotEmpty) {
          log('Products count: ${productsModel.items!.length}');
        } else {
          log('No products found in response');
        }
        emit(HomeProductSuccess(productsModel: productsModel));
      },
      failure: (err) {
        log('Error: $err');
        emit(HomeProductFailure(errMsg: err));
      },
    );
  }
}
