--Ordens de Serviço em Aberto com Beneficiários (Todas as Distribuidoras):



SELECT V AS TECNICOS, L AS DATA, AI AS BENEFICIARIO, COUNT(E) AS EM_ABERTO, AE AS CIDADES
FROM (
  SELECT * FROM Distribuidora_A
  UNION ALL
  SELECT * FROM Distribuidora_B
  UNION ALL
  SELECT * FROM Distribuidora_C
)
WHERE E != 'Finalizada' AND E != '' AND E != 'Cancelada'
GROUP BY V, L, AI, AE
ORDER BY V, L, AE;


--Ordens de Serviço em Aberto por Técnico e Localidade:



SELECT C AS 'ORDENS DE SERVIÇO', V AS Instalador, L AS DATA, AI AS BENEFICIARIO, Z AS ENDEREÇO, AA AS COMPLEMENTO, AB AS NUMERO, AC AS 'BAIRRO/ZONA', AE AS CIDADES, COUNT(E) AS 'EM ABERTO'
FROM Distribuidora_X -- Substitua X pela letra da distribuidora (A, B ou C)
WHERE E != 'Finalizada' AND E != '' AND D != 'Cancelada' AND V = 'NOME DO INSTALADOR' -- Substitua pelo nome do instalador
GROUP BY C, V, L, Z, AA, AB, AC, AE, AI
ORDER BY AC, Z;

--Ordens de Serviço em Aberto por Técnico e Data:


SELECT C AS 'ORDENS DE SERVIÇO', V AS Instalador, L AS DATA, AI AS BENEFICIARIO, Z AS ENDEREÇO, AA AS COMPLEMENTO, AB AS NUMERO, AC AS 'BAIRRO/ZONA', AE AS CIDADES, COUNT(E) AS 'EM ABERTO'
FROM Distribuidora_X -- Substitua X pela letra da distribuidora (A, B ou C)
WHERE E != 'Finalizada' AND E != '' AND D != 'Cancelada' AND V = 'NOME DO INSTALADOR' -- Substitua pelo nome do instalador
GROUP BY C, V, L, Z, AA, AB, AC, AE, AI
ORDER BY L;


-- Open Work Orders with Beneficiaries (All Distributors)
SELECT V AS TECHNICIAN, L AS DATE, AI AS BENEFICIARY, COUNT(E) AS OPEN_ORDERS, AE AS CITY
FROM (
    SELECT * FROM Distributor_A
    UNION ALL
    SELECT * FROM Distributor_B
    UNION ALL
    SELECT * FROM Distributor_C
)
WHERE E != 'Finished' AND E != '' AND D != 'Canceled'
GROUP BY V, L, AI, AE
ORDER BY V, L, AE;


-- Open Work Orders by Technician and Location
SELECT C AS 'WORK ORDERS', V AS Installer, L AS DATE, AI AS BENEFICIARY, 
       Z AS ADDRESS, AA AS COMPLEMENT, AB AS NUMBER, AC AS 'NEIGHBORHOOD/ZONE', 
       AE AS CITY, COUNT(E) AS 'OPEN'
FROM Distributor_X -- Replace X with the distributor letter (A, B, or C)
WHERE E != 'Finished' AND E != '' AND D != 'Canceled' AND V = 'INSTALLER_NAME' -- Replace with the installer's name
GROUP BY C, V, L, Z, AA, AB, AC, AE, AI
ORDER BY AC, Z;


-- Open Work Orders by Technician and Date
SELECT C AS 'WORK ORDERS', V AS Installer, L AS DATE, AI AS BENEFICIARY, 
       Z AS ADDRESS, AA AS COMPLEMENT, AB AS NUMBER, AC AS 'NEIGHBORHOOD/ZONE', 
       AE AS CITY, COUNT(E) AS 'OPEN'
FROM Distributor_X -- Replace X with the distributor letter (A, B, or C)
WHERE E != 'Finished' AND E != '' AND D != 'Canceled' AND V = 'INSTALLER_NAME' -- Replace with the installer's name
GROUP BY C, V, L, Z, AA, AB, AC, AE, AI
ORDER BY L;
