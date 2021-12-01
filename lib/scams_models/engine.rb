module ScamsModels
  class Engine < Rails::Engine
    engine_name :scams_models

    if Rails::VERSION::MAJOR >= 6
      parent_class_name = Rails.application.class.module_parent_name
    else
      parent_class_name = Rails.application.class.parent_name
    end

    if parent_class_name != "Scams"
      # FIXME: more types need to be added here for this to work in
      # different apps
      [ScamsModelBase, AssetType,Bitstream,Bundle,Classification,Contributor,Creator,Crop,DigitalCreator,
        DigitalFormat, Division, DivisionType, Eac, EacDate, Expression,
        ExternalLink, Genre, GeographicLocation,
        IsPartOf, Jp2, Language, NameRole, NoteType, OriginalFormat,
        Package, Page, Publication, Region, Repository, Resource,
        ResourceDate, Right, SeriesTitle,Subject,TitleOther,TitleSource,Topic,
        Work, WorkCreator, WorkExternalLink, WorkGeographicLocation,
        WorkNote, WorkSubject, WorkType
        ].each do |klass|
          klass.send(:connection)
      end
    end
  end
end
