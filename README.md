# CommonSun Salesforce CRM Enhancements

This repository contains Apex code and triggers to enhance the functionality of CommonSun Inc's Salesforce CRM. The project involves implementing custom Apex triggers, classes, and automation for lead assignment, opportunity revenue calculation, and opportunity stage updates.

## Table of Contents

- [Project Overview](#project-overview)
- [Key Features](#key-features)
- [Efficiency and Effectiveness](#efficiency-and-effectiveness)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Testing](#testing)
- [License](#license)

## Project Overview

This project streamlines and enhances Salesforce CRM for CommonSun Inc. The key enhancements focus on automating lead management and opportunity revenue calculations, which are critical in improving the overall sales process and business performance tracking.

## Key Features

1. **Lead Assignment Automation**: 
   - Automatically assigns leads based on predefined criteria, ensuring quicker response times.
   - Validates incoming leads based on criteria such as email, industry, and company size.

2. **Opportunity Revenue Calculation**: 
   - Ensures that opportunity revenue is calculated automatically when a related record is updated.
   - Uses custom Apex logic to dynamically calculate revenue based on factors such as product prices and discounts.

3. **Stage Update Automation**: 
   - Automates the progression of opportunity stages based on business criteria, streamlining the sales process.
   - Updates opportunity stages based on specific events or milestones.

## Efficiency and Effectiveness

These solutions help CommonSun Inc. in the following ways:

- **Efficiency**: Automation of manual tasks like lead assignment and revenue calculation reduces human error and saves time.
- **Data Accuracy**: Automatically calculated fields ensure that sales data remains consistent and accurate.
- **Improved Sales Workflow**: Automated stage progression keeps the sales pipeline moving without manual intervention, improving overall sales team productivity.

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