@core @core_backup @_file_upload
Feature: Duplicate ableplayer activity
  In order to set up my course contents quickly
  As a teacher with editing permissions
  I need to duplicate activities inside the same course

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                | idnumber |
      | teacher1 | Teacher   | 1        | teacher1@example.com | T1       |
      | student1 | Student   | 1        | student1@example.com | S1       |

    And the following "courses" exist:
      | fullname | shortname | category | enablecompletion |
      | Course 1 | C1        | 0        | 1                |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | teacher1 | C1     | editingteacher |
      | student1 | C1     | student        |
    And the following "activity" exists:
      | activity                            | ableplayer                                           |
      | course                              | C1                                                   |
      | name                                | My First Ableplayer                                  |
      | playlist                            | 0                                                    |
      | mode                                |                                                      |
      | lang                                |                                                      |
      | poster                              |                                                      |
      | media file[0]                       | /mod/ableplayer/tests/fixtures/deadline.mp4           |
      #| file[Captions]                      | mod/ableplayer/tests/fixtures/sample_description.txt |
    And the following config values are set as admin:
      | backup_import_activities | 0 | backup |

  @javascript
  Scenario: Duplicate an ableplayer
    Given I log in as "teacher1"
    And I am on "Course 1" course homepage with editing mode on
    And I click on "My First Ableplayer" "link" in the "General" "section"
    And I click on "Settings" "link"
    And I click on "Expand all" "button"
    #And I scroll page to DOM element with ID "media-file"
    And I should see "Media file"
    #And I click on "Add..." "button"
    #And I wait "3" seconds
    #And I click on "Upload a file" "link"
    And I wait "3" seconds
    #And I select "repo_upload_file" "file"
    And I upload "/mod/ableplayer/tests/fixtures/deadline.mp4" file to "Media file" filemanager
    #When I click on "Upload this file" "button"
    And I press "Save and display"
    And I click on "General" "link" in the "breadcrumb" "section"
    And I duplicate "My First Ableplayer" activity
    And I should see "My First Ableplayer (copy) "
    And I wait "2" seconds
    And I click on "My First Ableplayer (copy)" "link" in the "General" "section"
    And I click on "Settings" "link"
    And I click on "Expand all" "button"
    Then I should see "deadline.mp4"
    #And I should see "sample_description.txt"
    Then I wait "3" seconds




    #And I click on "My First Ableplayer (copy)" "link" in the "General" "section"
    #And I click on "Settings" "link"
    #And I click on "Expand all" "button"
    #Then I should see "sample_video.mp4"
    #And I should see "sample_description.txt"
    #And I wait "3" seconds
    #And I set the following fields to these values:
    #  | id_name |  name |
    #  | AblePlayer name | Original First Ableplayer |
    #And I press "Save and return to course"
    #And I wait "2" seconds
    #And I click on "My First Ableplayer (copy)" "link" in the "General" "section"
    #And I click on "Settings" "link"
    #And I set the following fields to these values:
    #  | id_name |  name |
    #  | AblePlayer name | Duplicated First Ableplayer |
    #And I press "Save and return to course"
    #Then I should see "Original First Ableplayer" in the "General" "section"
    #And I should see "Duplicated First Ableplayer" in the "General" "section"
    #Then I wait "3" seconds
    #And I should see "Duplicated First Ableplayer" in the "Topic 1" "section"