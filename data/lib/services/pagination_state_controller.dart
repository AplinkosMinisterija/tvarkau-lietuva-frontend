class PaginationStateController<T> {
  int currentPage;
  int lastPage;
  List<T> entities;

  PaginationStateController({
    required this.currentPage,
    required this.lastPage,
    required this.entities,
  });

  factory PaginationStateController.initial() {
    return PaginationStateController<T>(
      currentPage: 1,
      lastPage: 1,
      entities: <T>[],
    );
  }

  bool get shouldLoadNewPage {
    if (currentPage <= lastPage) {
      return true;
    } else {
      return false;
    }
  }

  void addProducts(List<T> product) {
    entities.addAll(product);
  }

  void updateProduct(T product, int index) {
    entities.removeAt(index);
    entities.insert(index, product);
  }

  void removeProduct(int index) {
    entities.removeAt(index);
  }

  void setNewPage(
    List<T> newItems,
    int lastPageNumber,
  ) {
    currentPage = currentPage + 1;
    lastPage = lastPageNumber;
    addProducts(newItems);
  }

  void clearList() {
    currentPage = 1;
    entities = <T>[];
  }
}
