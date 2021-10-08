Please create a simple rails app to manage the 臺北市運動產業業者名單

[Seed data]

* tmsind.csv (source: https://data.gov.tw/dataset/144887)

[The requirements]

1. Be able to query the database and show the records by the following filters:

* Filter specifications:

    |                   | CompanyName1    | Tel             | Address1        | Email           | SportType              | SportType1            | CompanyNo       |
    |-------------------|-----------------|-----------------|-----------------|-----------------|------------------------|-----------------------|-----------------|
    | View              | Free text input | Free text input | Free text input | Free text input | Single select dropdown | Multi select dropdown | Free text input |
    | Search conditions | LIKE            | EQUALS          | LIKE            | EQUALS          | EQUALS                 | IN                    | EQUALS          |

* Expected sample query results:

    *Note: The ID value in your app should be the primiary key in your database, it's not necessary to make it identical with the ID value in the attached CSV file.*

    | ID | CompanyName1       | CompanyName2     | Tel          | Address1                      | Email                      | BusinessHours                  | Charges | SportType               | SportType1 | CompanyNo | LatLng                |
    |----|--------------------|------------------|--------------|-------------------------------|----------------------------|--------------------------------|---------|-------------------------|------------|-----------|-----------------------|
    | 3  | 喬菲立有限公司     | Curves石牌店     | 02 2820 0250 | 臺北市北投區裕民六路120號5樓  | Curvesma0107@curves.com.tw | 09:30:00-11:30:00 15:30:00-21: |         | 09 運動場館或設施營建業 | 健身房     | 25128270  | 25.114535,121.5154595 |
    | 4  | 佑英有限公司       | Curves西門漢中店 | 02 2361 2327 | 臺北市萬華區漢中街157號2樓    |                            | 11:30:00-13:00:00 13:00:00-15: |         | 09 運動場館或設施營建業 | 健身房     | 54155901  | 25.041502,121.5049843 |
    | 5  | 佳仕旺國際有限公司 | Curves信義永康店 | 02 3322 2610 | 臺北市大安區信義路2段222號2樓 | yongkang@curves.com.tw     | 11:00:00-13:00:00 15:30:00-21: |         | 09 運動場館或設施營建業 | 健身房     | 29054026  | 25.033409,121.5291783 |

2. Be able to show the selected record by clicking the ID, including the follwing attributes:
    * ID
    * CompanyName1
    * CompanyName2
    * Tel
    * Address1
    * Email
    * BusinessHours
    * Charges
    * SportType
    * SportType1
    * CompanyNo
    * LatLng

3. Be able to update the selected record by the ID, including the follwing attributes:

    * CompanyName1
    * CompanyName2
    * Tel
    * Address1
    * Email
    * BusinessHours
    * Charges
    * SportType
    * SportType1
    * CompanyNo
    * LatLng

4. Be able to delete the selected record by the ID

5. Be able to create a new record, including the follwing attributes:

    * CompanyName1
    * CompanyName2
    * Tel
    * Address1
    * Email
    * BusinessHours
    * Charges
    * SportType
    * SportType1
    * CompanyNo
    * LatLng

6. Please write testing code for the application
7. Please create a README.md and give the instructions of (1) The steps of setup for the app (2) How to run your tests