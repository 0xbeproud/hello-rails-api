# README

```sql 
create schema hello_rails_api_local collate utf8mb4_unicode_520_ci;

create user 'test'@'%' identified by 'test123';
GRANT ALL PRIVILEGES ON hello_rails_api_local.* TO 'test'@'%' identified by 'test123';

```