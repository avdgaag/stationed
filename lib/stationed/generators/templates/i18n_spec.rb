Dir.glob('config/locales/*.yml') do |locale_file|
  describe locale_file do
    it { should be_parseable }
    it { should have_valid_pluralization_keys }
    it { should_not have_missing_pluralization_keys }
    it { should have_one_top_level_namespace }
    it { should_not have_legacy_interpolations }
    it { should have_a_valid_locale }
  end
end
