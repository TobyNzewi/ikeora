Feature: Navigating about the platform
  As an authenticated user on Ikeora
  to perform various operations
  I need to be able to safely navigate all around

  Scenario: Going from dashboard to profile
    Given I am on the home page
    Then I should see "Home"
    And I should see "Sign in with Facebook"
    When I follow "Sign in with Facebook"
    Then I should see "Successfully authenticated from Facebook account."
    And I should see "Dashboard"
    When I follow "Profile"
    Then I should see "My Profile"
    When I follow "Dashboard"
    Then I should see "Dashboard"
    When I follow "Sign out"
    Then I should see "Signed out successfully."
