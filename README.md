# CommonSun Salesforce CRM Assignment

This project enhances the CommonSun Inc. Salesforce CRM system by implementing custom Apex triggers, classes, and automation for lead assignment, opportunity revenue calculation, and opportunity stage updates.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Testing](#testing)
- [License](#license)

## Project Overview

This project streamlines and enhances Salesforce CRM for CommonSun Inc. The key enhancements focus on automating lead management and opportunity revenue calculations, which are critical in improving the overall sales process and business performance tracking.

The main features implemented in this project include:
- Automating lead assignments based on custom business rules
- Validating leads based on criteria such as email, industry, and company size
- Dynamically calculating revenue for opportunities using custom Apex logic
- Automatically updating opportunity stages based on business logic

## Features

### 1. Automated Lead Assignment
The system automatically assigns leads to the appropriate users based on predefined business logic and criteria.

### 2. Lead Qualification Validation
Apex triggers validate that incoming leads meet certain criteria, such as having valid emails or phone numbers.

### 3. Opportunity Revenue Calculation
The custom logic dynamically calculates and updates opportunity revenue based on factors such as product prices and discounts.

### 4. Opportunity Stage Update
Automated triggers update the opportunity stages based on specific events or milestones.

## Setup Instructions

To set up and use this project in your Salesforce Org, follow these steps:

### Prerequisites
- Salesforce CLI (SFDX)
- A Salesforce Developer Org or Scratch Org
- Git installed on your system

### Steps

1. **Clone the repository** to your local machine:
   ```bash
   git clone https://github.com/surbhisingh16380/CommonSunAssignment.git
   cd CommonSunAssignment
   ```

2. **Authorize your Salesforce Org** by logging into your Salesforce account:
   ```bash
   sfdx auth:web:login -d -a CommonAssignProject
   ```

3. **Deploy the source code** to your org:
   ```bash
   sfdx force:source:push -u CommonAssignProject
   ```

4. **Create a system administrator user** (optional step for testing user-related functionality):
   ```bash
   sfdx force:user:create --set-alias "CommonSunUser" --email tarique@heymarket.com --profile "System Administrator"
   ```

5. **Generate a password for the user** (optional):
   ```bash
   sfdx force:user:password:generate -u CommonSunUser
   ```

## Usage

Once the code is deployed to your Salesforce Org, you can start using the enhanced features:

### Lead Assignment
New leads created in the system are automatically assigned to sales reps based on the predefined rules.

### Opportunity Revenue Calculation
For each opportunity, the system automatically calculates the expected revenue using the associated products and their prices.

### Opportunity Stage Updates
The stage of each opportunity is updated automatically when certain criteria are met (e.g., opportunity value or stage change).

## Testing

You can run unit tests to ensure that all the implemented features work as expected. The unit tests provide code coverage of more than 85%.

To run the tests with code coverage, execute:
```bash
sfdx force:apex:test:run --code-coverage --result-format human --target-org CommonAssignProject
```

To check the test results:
```bash
sfdx force:apex:test:report --test-run-id <test-run-id>
```

Ensure that all tests pass with a code coverage of 85% or higher.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.