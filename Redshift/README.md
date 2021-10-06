# Redshift Exporter

We’re excited to introduce Redshift Exporter, a simple tool to help exporting your Redshift Code
so it can be migrated to Snowflake.

## Version

Release 2019-03-24

## Usage

View to get the DDL for a table.  This will contain the distkey, sortkey, constraints, not null, defaults, etc.

Original Source: https://github.com/awslabs/amazon-redshift-utils/blob/master/src/AdminViews/v_generate_tbl_ddl.sql

         
**Notes**:   
* Default view ordering causes foreign keys to be created at the end.
* This is needed due to dependencies of the foreign key constraint and the tables it links.  
* Due to this one should not manually order the output if you are expecting to be able to replay the SQL directly from the VIEW query result. It is still possible to order if you filter out the FOREIGN KEYS and then apply them later.
* The following filters are useful:
```sql
    where ddl not like 'ALTER TABLE %'  -- do not return FOREIGN KEY CONSTRAINTS
```
```sql
    where ddl like 'ALTER TABLE %'      -- only get FOREIGN KEY CONSTRAINTS
```
```sql
    where tablename in ('t1', 't2')     -- only get DDL for specific tables
```
```sql
    where schemaname in ('s1', 's2')    -- only get DDL for specific schemas
```
         
 So for example if you want to order DDL on tablename and only want the tables 't1', 't2' and 't4' you can do so by using a query like:
```sql
    select ddl from (
        (
        select
            *
        from admin.v_generate_tbl_ddl
        where ddl not like 'ALTER TABLE %'
        order by tablename
        )
        UNION ALL
        (
        select
            *
        from admin.v_generate_tbl_ddl
        where ddl like 'ALTER TABLE %'
        order by tablename
        )
    ) where tablename in ('t1', 't2', 't4');
```

## Reporting issues and feedback

If you encounter any bugs with the tool please file an issue in the
[Issues](https://github.com/MobilizeNet/SnowConvertDDLExportScripts/issues) section of our GitHub repo.

## License

Redshift Exporter is licensed under the [MIT license](https://github.com/MobilizeNet/SnowConvertDDLExportScripts/blob/main/Redshift/LICENSE.txt).
