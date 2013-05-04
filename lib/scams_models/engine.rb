module ScamsModels
  class Engine < Rails::Engine
    engine_name :scams_models
    initializer "establish_scams_models_connections" do
      if Rails.application.class.parent_name != "Scams"
        # FIXME: more types need to be added here for this to work in
        # different apps
        [AssetType,Bitstream,Bundle,Classification,Contributor,Creator,Crop,DigitalCreator,
          DigitalFormat, Division, DivisionType, Eac, EacDate, Expression,
          ExternalLink, Genre, GeographicLocation,
          IsPartOf, Jp2, Language, NameRole, NoteType, OriginalFormat,
          Package, Page, Publication, Region, Repository, Resource,
          ResourceDate, Right, SeriesTitle,Subject,TitleOther,TitleSource,Topic,
          Work, WorkCreator, WorkExternalLink, WorkGeographicLocation,
          WorkNote, WorkSubject, WorkType
          ].each do |klass|
            klass.send(:establish_connection, "scams_#{Rails.env}")
        end
      end
    end
  end
end
