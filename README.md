# Overtime App

## High level requirement: Company needs documentation that salaried employees did or did not get overtime each week.

So I perceived of having three different models:

- Post -> date:date rationale:text
x User -> devise
x AdminUser -> utilize Single Table Inheritance (STI), so its going to be inside the users table but its going to be of type AdminUser.
x Devise, Administrate gem, Bootstrap for basic styling, Twilio for SMS and for secure credentials .env gem to protect credentials from outside access. Then there is RSpec for testing and Capybara for integration testing.

## Features:

What the app needs to do:
- There has to be some type of approval workflow
- Need to be able to send SMS messages - because these are non-technical field workers so they will not be checking their emails on a regular basis, so we are going to have to send SMS messages which includes a link to essentially log time.
- Admin dashboard - Administrate gem utilized
- Email Summary to manager for approval
- Everything needs to be documented if there is no overtime because of labor laws. There will be 800 employees using this so even if they are salaried they need to know if they had overtime or not. They wanted documentation if ever audited by labor board

## UI:
- Bootstrap -> formatting

## Refactor TODOS:
- Refactor user association integration test in posts_spec
