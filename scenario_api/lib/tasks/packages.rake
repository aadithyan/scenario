namespace :api do
  namespace :v1 do
    task populate_packages: :environment do
      work_packages = [{ name: 'Projects', package_code: 'WK-PRJ001', description: 'Manage your projects' },
                       { name: 'Performance Analyzer', package_code: 'WK-PRA002', description: 'Manage employees performance' },
                       { name: 'Project Billings', package_code: 'WK-PRJB003', description: 'Manage your billings' },
                       { name: 'Code Library', package_code: 'WK-CDL004', description: 'Manage your codes and references' },
                       { name: 'Check Lists', package_code: 'WK-CHL005', description: 'Manage your codes and references' }]

      life_packages = [{ name: 'Daily Schedules', package_code: 'L-DSL001', description: 'Manage your daily schedules' },
                       { name: 'Diaries', package_code: 'L-DRY002', description: 'Write your own stories' },
                       { name: 'Classrooms', package_code: 'L-CLRM003', description: 'Study to increa knowledge' },
                       { name: 'Timetables', package_code: 'L-TM004', description: 'Schedule a day' },
                       { name: 'Wallets', package_code: 'L-WLT005', description: 'Manage your income and expenses' }]
      common_packages = [{ name: 'Notes', package_code: 'CMN-NTS001', description: 'Take down notes' },
                         { name: 'Todo', package_code: 'CMN-TDO002', description: 'Manage your tasks for the day' },
                         { name: 'Reminders', package_code: 'CMN-RMD003', description: 'Manage your reminders' },
                         { name: 'Calenders', package_code: 'CMN-CLDR004', description: 'Manage your calenders' },
                         { name: 'Bookmarks', package_code: 'CMN-BKMR004', description: 'Manage your Bookmarks' },
                         { name: 'Credentials', package_code: 'CMN-CRL005', description: 'Organize your passwords' }]

      work_packages.each do |wk_package|
        category = Api::V1::PackageCategory.find_by(name: 'Work')
        if category.present?
          wk_package[:package_categories_id] = category.id
          Api::V1::Package.create(wk_package)
        end
      end

      life_packages.each do |wk_package|
        category = Api::V1::PackageCategory.find_by(name: 'Life')
        if category.present?
          wk_package[:package_categories_id] = category.id
          Api::V1::Package.create(wk_package)
        end
      end

      common_packages.each do |wk_package|
        category = Api::V1::PackageCategory.find_by(name: 'Common')
        if category.present?
          wk_package[:package_categories_id] = category.id
          Api::V1::Package.create(wk_package)
        end
      end

    end
  end
end