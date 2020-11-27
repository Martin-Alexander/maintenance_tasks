# frozen_string_literal: true

require 'application_system_test_case'

module MaintenanceTasks
  class TasksTest < ApplicationSystemTestCase
    test 'list all tasks' do
      visit maintenance_tasks_path

      assert_title 'Maintenance Tasks'

      assert_link 'Maintenance::UpdatePostsTask'
      assert_link 'Maintenance::ErrorTask'
    end

    test 'show a Task' do
      visit maintenance_tasks_path

      click_on('Maintenance::UpdatePostsTask')

      assert_title 'Maintenance::UpdatePostsTask'
      assert_text 'Succeeded'
      assert_text 'Ran for less than 5 seconds, finished 8 days ago.'
    end

    test 'visit main page through iframe' do
      visit root_path

      within_frame('maintenance-tasks-iframe') do
        assert_content 'Maintenance Tasks'
      end
    end
  end
end
