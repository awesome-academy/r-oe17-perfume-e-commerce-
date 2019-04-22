Dir.glob("lib/tasks/*.rake").each { |r| load r}

Rake::Task["populate:seed_role"].invoke
Rake::Task["populate:seed_user"].invoke
Rake::Task["populate:seed_sense"].invoke
Rake::Task["populate:seed_category"].invoke
Rake::Task["populate:seed_product"].invoke
