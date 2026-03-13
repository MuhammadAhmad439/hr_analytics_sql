   USE clg;
SELECT*FROM hr_analytics;


                      # ToTAL ATTRITION.....................
SELECT COUNT(*),Attrition
FROM hr_analytics
GROUP BY Attrition;


				#AVERAGE SALARY BY department...........
SELECT AVG(monthlyincome),department
FROM hr_analytics
GROUP BY department;


			           #department wise Analysis..............
                       
SELECT department,COUNT(*) AS total_empolyee,
SUM(CASE WHEN Attrition="Yes" THEN 1 ELSE 0 END) AS empolyee_left,
ROUND(SUM(CASE WHEN Attrition="Yes" THEN 1 ELSE 0 END)*100.0/COUNT(*),1) AS attrition_rate
FROM hr_analytics
GROUP BY department
ORDER BY attrition_rate DESC;



           #Salary slab analysis................
           
SELECT salaryslab,COUNT(*) AS empolyee_count , AVG(monthlyincome) AS avg_salary
FROM hr_analytics
GROUP BY salaryslab
ORDER BY avg_salary DESC;

                      # TOP 3 high performer/TOP monthlyincome.........
                      
SELECT*
FROM hr_analytics
ORDER BY monthlyincome DESC 
LIMIT 3;

        #Method 2..........  # TOP 3 high performer/TOP monthlyincome.........
        
SELECT monthlyincome,department
FROM hr_analytics e1
WHERE monthlyincome=(SELECT MAX(monthlyincome)
FROM hr_analytics e2
WHERE e1.department=e2.department
);

                 #Attrition Insights.......
               
 SELECT Agegroup, 
 SUM(CASE WHEN ATtrition="Yes" THEN 1 ELSE 0 END) AS left_count,
 COUNT(*) AS total_count,
 ROUND(SUM(CASE WHEN Attrition="Yes" THEN 1 ELSE 0 END)*100.0/COUNT(*),1) AS attrition_rate
 FROM hr_analytics
 GROUP BY Agegroup
 ORDER BY attrition_rate DESC;
 
                          #Empolyee satisfication Analysis............
                          
 SELECT department,jobrole,
 AVG(JobSatisfaction) AS avg_job_satisfaction,
       AVG(EnvironmentSatisfaction) AS avg_env_satisfaction
 FROM hr_analytics
 GROUP BY department,jobrole
 ORDER BY avg_job_satisfaction DESC;
 
 
