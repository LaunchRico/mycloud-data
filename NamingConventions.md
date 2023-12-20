# Naming conventions

## General

* Ensure the name is unique and does not exist as a reserved keyword.
* Keep the length to a maximum of 30 bytes—in practice this is 30 characters unless you are using a multi-byte character set.
* Names must begin with a letter and may not end with an underscore.
* Only use letters, numbers and underscores in names.
* Avoid the use of multiple consecutive underscores—these can be hard to read.
* Use underscores where you would naturally include a space in the name (first name becomes first_name).
* Avoid abbreviations and if you have to use them make sure they are commonly understood.

```sql
SELECT first_name
  FROM staff;
```

## Tables

* Use a collective name or, less ideally, a plural form. For example (in order of preference) staff and employees.
* Do not prefix with tbl or any other such descriptive prefix or Hungarian notation.
* Never give a table the same name as one of its columns and vice versa.
* Avoid, where possible, concatenating two table names together to create the name of a relationship table. Rather than cars_mechanics prefer services.

## Columns

* Always use the singular name.
* Where possible avoid simply using id as the primary identifier for the table.
* Do not add a column with the same name as its table and vice versa.
* Always use lowercase except where it may make sense not to such as proper nouns.

## Aliasing or correlations

* Should relate in some way to the object or expression they are aliasing.
* As a rule of thumb the correlation name should be the first letter of each word in the object’s name.
* If there is already a correlation with the same name then append a number.
* Always include the AS keyword—makes it easier to read as it is explicit.
* For computed data (SUM() or AVG()) use the name you would give it were it a column defined in the schema.

```sql
SELECT first_name AS fn
  FROM staff AS s1
  JOIN students AS s2
    ON s2.mentor_id = s1.staff_num;
SELECT SUM(s.monitor_tally) AS monitor_total
  FROM staff AS s;
```

## Stored procedures

* The name must contain a verb.
* Do not prefix with sp_ or any other such descriptive prefix or Hungarian notation.

## Uniform suffixes

The following suffixes have a universal meaning ensuring the columns can be read and understood easily from SQL code. Use the correct suffix where appropriate.

* _id—a unique identifier such as a column that is a primary key.
* _status—flag value or some other status of any type such as publication_status.
* _total—the total or sum of a collection of values.
* _num—denotes the field contains any kind of number.
* _name—signifies a name such as first_name.
* _seq—contains a contiguous sequence of values.
* _date—denotes a column that contains the date of something.
* _tally—a count.
* _size—the size of something such as a file size or clothing.
* _addr—an address for the record could be physical or intangible such as ip_addr.
