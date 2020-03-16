namespace :one_offs do

  task :get_new_episodes => :environment do
    DiscoveryService.episodes!
  end

  task :start_import => :environment do
    DiscoveryService.shows!
  end

  task :new_pods => :environment do
    # ['term'].each |term|
    #   PodcastIngestionFromSearch.search term
    # end
  end

  task :re_ingest_small_logos => :environment do
    Podcast.all.order('created_at desc').each { |e| e.update_logo! }
  end

  task :add_pods_to_collections => :environment do
    Collection.remap_collections!
  end

  task :add_large_logos => :environment do
    Podcast.update_logo!
  end

  task :fix_empty_bios => :environment do
    Podcast.all.each { |e| e.update_bio! }
  end

  task :fix_genres => :environment do
    Podcast.all.each { |e| e.update_genre! }
  end

end
