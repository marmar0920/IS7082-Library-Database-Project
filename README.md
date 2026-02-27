# IS7082-Library-Database-Project
---

## 1. Executive Summary
**Sponsor:** Oakwood Neighborhood Association  
**Users:** Library Volunteers and Community Members  

### Problem Statement
As the Oakwood "Little Free Library" has expanded to hundreds of titles, the manual "honor system" has become difficult to manage. The association lacks data on which books are currently on loan, which genres are most popular, and which members are active participants. This led to lost inventory and an inability to curate the collection effectively.

### Proposed Solution
The Community Library Tracker is a relational database designed to digitize the inventory and loan process. By categorizing books by genre and linking them to a membership directory, the system allows volunteers to track the status of every asset in real-time. This system ensures referential integrity, preventing books from being assigned to non-existent members, and provides SQL-driven insights into library usage patterns.

---

## 2. Database Design & Architecture

### Business Rules
* A **Member** can borrow many **Books**, but a Book is borrowed by only one Member at a time.
* Each **Book** must belong to exactly one **Genre**.
* A **Loan** record must track the check-out date and a specific due date.
* Members must provide a valid email to be registered in the system.

### Entity-Relationship Diagram (ERD)


### Relational Schema
* **Genres** (<u>GenreID</u>, GenreName)
* **Members** (<u>MemberID</u>, Name, Email)
* **Books** (<u>BookID</u>, Title, Author, *GenreID*)
* **Loans** (<u>LoanID</u>, *BookID*, *MemberID*, DateOut, DueDate)

---

## 3. Implementation Details
This project is hosted on **Google Cloud SQL** using a MySQL 8.0 instance. 

### Files in this Repository
* `schema.sql`: Contains the DDL (Data Definition Language) to create the database, tables, and constraints, along with sample data inserts.
* `queries.sql`: Contains 15 business-critical queries including multi-table JOINs and SQL functions.

### How to Run
1. Connect to your MySQL instance (e.g., via Google Cloud Shell).
2. Execute `source schema.sql` to build the environment.
3. Execute `source queries.sql` to view the generated reports.

---

## 4. Key Insights (SQL Examples)
The system currently tracks:
* **Inventory Distribution:** Categorization of books by genre.
* **Member Activity:** Identification of active borrowers and loan durations.
* **Overdue Tracking:** Calculation of days past due using `DATEDIFF` functions.


