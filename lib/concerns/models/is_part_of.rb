module ScamsModels::Concerns::Models::IsPartOf
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :resources do
      def no_thumbnail_url(reload=false)
        @active = nil if reload
        @active ||= find(:all, :conditions => 'thumbnail_url IS NULL')
      end
      def jp2(reload=false)
        @active = nil if reload
        @active ||= find(:all, :conditions => 'jp2_path IS NOT NULL')
      end
      def no_jp2(reload=false)
        @active = nil if reload
        @active ||= find(:all, :conditions => 'jp2_path IS NULL')
      end
      def luna_thumbnail_url(reload=false)
        @active = nil if reload
        @active ||= find(:all, :conditions => 'thumbnail_url LIKE "%images.lib.ncsu.edu%"')
      end
      def scrc_thumbnail_url(reload=false)
        @active = nil if reload
        @active ||= find(:all, :conditions => 'thumbnail_url LIKE "%scrc.lib.ncsu.edu%"')
      end
      # This may be the only method that is used or tested here.
      def stubs(reload=false)
        @active = nil if reload
        @active ||= where(:recordStatus => 'level 0')
      end
      def project_records(reload=false)
        @active = nil if reload
        @active ||= find(:all, :include => [:asset_types], :conditions => {'asset_types.asset_type' => 'Project record' })
      end
      def not_a_text(reload=false)
        @active = nil if reload
        @active ||= find(:all, :include => [:asset_types], :conditions => "asset_types.asset_type != 'Text'")
      end
    end



    has_many :stub_generators
    has_many :eacs, :through => :resources
  end

end