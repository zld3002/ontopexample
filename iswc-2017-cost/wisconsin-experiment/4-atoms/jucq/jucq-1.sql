SELECT * FROM (SELECT *
FROM (
SELECT DISTINCT qview1."unique2", qview1."evenonepercent", qview1."stringu1", qview1."stringu2", qview2."evenonepercent", qview2."stringu1", qview2."stringu2"
FROM
"public"."t1_1m" qview1,
"public"."t2_1m" qview2
WHERE
((qview1."onepercent" >= 0) AND (qview1."onepercent" < 20)) AND
qview1."evenonepercent" IS NOT NULL AND
qview1."stringu2" IS NOT NULL AND
qview1."stringu1" IS NOT NULL AND
qview1."unique2" IS NOT NULL AND
(qview1."unique2" = qview2."unique2") AND
((qview2."onepercent" >= 15) AND (qview2."onepercent" < 35)) AND
qview2."evenonepercent" IS NOT NULL AND
qview2."stringu2" IS NOT NULL AND
qview2."stringu1" IS NOT NULL
) SUB_QVIEW

) f_1,(SELECT *
FROM (
SELECT DISTINCT qview1."unique2", qview2."evenonepercent", qview2."stringu1", qview2."stringu2"
FROM
"public"."t1_1m" qview1,
"public"."t3_1m" qview2
WHERE
((qview1."onepercent" >= 0) AND (qview1."onepercent" < 20)) AND
qview1."evenonepercent" IS NOT NULL AND
qview1."stringu2" IS NOT NULL AND
qview1."stringu1" IS NOT NULL AND
qview1."unique2" IS NOT NULL AND
(qview1."unique2" = qview2."unique2") AND
((qview2."onepercent" >= 15) AND (qview2."onepercent" < 35)) AND
qview2."evenonepercent" IS NOT NULL AND
qview2."stringu2" IS NOT NULL AND
qview2."stringu1" IS NOT NULL
) SUB_QVIEW

) f_2,(SELECT *
FROM (
SELECT DISTINCT qview1."unique2", qview2."evenonepercent", qview2."stringu1", qview2."stringu2"
FROM
"public"."t1_1m" qview1,
"public"."t4_1m" qview2
WHERE
((qview1."onepercent" >= 0) AND (qview1."onepercent" < 20)) AND
qview1."evenonepercent" IS NOT NULL AND
qview1."stringu2" IS NOT NULL AND
qview1."stringu1" IS NOT NULL AND
qview1."unique2" IS NOT NULL AND
(qview1."unique2" = qview2."unique2") AND
((qview2."onepercent" >= 15) AND (qview2."onepercent" < 35)) AND
qview2."evenonepercent" IS NOT NULL AND
qview2."stringu2" IS NOT NULL AND
qview2."stringu1" IS NOT NULL
) SUB_QVIEW

) f_3
WHERE f_1."unique2" = f_2."unique2" AND f_1."unique2" = f_3."unique2" AND f_2."unique2" = f_3."unique2"
