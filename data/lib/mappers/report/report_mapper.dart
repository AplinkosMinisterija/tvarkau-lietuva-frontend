part of mappers;

class ReportMapper implements Mapper<ReportEntity, domain.ReportModel> {
  const ReportMapper();

  @override
  domain.ReportModel fromEntity(ReportEntity entity) {
    return domain.ReportModel(
      id: entity.id,
      name: entity.name,
      type: entity.type,
      email: entity.email,
      reportLong: entity.reportLong,
      reportLat: entity.reportLat,
      status: entity.status,
      reportDate: entity.reportDate,
      address: entity.address,
      phone: entity.phone,
      comment: entity.comment,
      workingHours: entity.workingHours,
      moreInformation: entity.moreInformation,
      imageUrls: entity.imageUrls,
      isVisible: entity.isVisible,
      isDeleted: entity.isDeleted,
      refId: entity.refId,
    );
  }

  @override
  ReportEntity toEntity(domain.ReportModel item) {
    return ReportEntity(
      id: item.id,
      name: item.name,
      reportLong: item.reportLong,
      reportLat: item.reportLat,
      reportDate: item.reportDate,
      status: item.status,
      type: item.type,
      email: item.email,
      phone: item.phone,
      address: item.address,
      workingHours: item.workingHours,
      moreInformation: item.moreInformation,
      imageUrls: item.imageUrls ?? [],
      isVisible: item.isVisible??false,
      isDeleted: item.isDeleted,
      refId: item.refId,
    );
  }
}
