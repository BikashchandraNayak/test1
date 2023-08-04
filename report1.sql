--3rd change 
--2nd change
/* Formatted on 2015-12-13 14:01:03 (QP5 v5.240.12305.39476) */
  SELECT sup.login, /*Report name: Printouts - Print stations - Users*/
         sup.first_name,
         sup.last_name,
         psn.print_station_name,
         CASE
            WHEN sup.default_print_station_name = psn.print_station_name
            THEN
               'YES'
            ELSE
               ' '
         END
            "DEFAULT_PRINT_STATION"
    FROM sljgs.ses_user_public sup
         JOIN sl.user_security_privilege usp
            ON usp.user_id = sup.user_id AND usp.privilege_id = 1278
         JOIN sl.print_station_name psn
            ON psn.print_station_name_id = usp.parameter_value
   WHERE default_location_id = 1444
ORDER BY sup.login, psn.print_station_name