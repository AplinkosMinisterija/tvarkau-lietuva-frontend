part of mappers;

abstract class Mapper<A, B> {
  B fromEntity(A entity);

  A toEntity(B item);
}

extension ListMapper<A, B> on Mapper<A, B> {
  List<B> fromList(List<A>? entities) {
    return entities?.map(fromEntity).toList() ?? <B>[];
  }

  List<A> toList(List<B> entities) {
    return entities.map(toEntity).toList();
  }
}
