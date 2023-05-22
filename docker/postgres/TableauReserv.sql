CREATE OR REPLACE FUNCTION TABLEAU(debut timestamp, fin timestamp, categorie int)
    RETURNS TABLE
            (
                id_locaux varchar(32),
                id_pavillon varchar(32),
                heure timestamp,
                cip varchar(32),
                id_reservation varchar(32),
                description varchar(64)
            )
AS $$
WITH horaire AS (
    SELECT
        lf.id_locaux,
        lf.id_pavillon,
        lookup.heure + debut::date AS heure,
        reservation.cip,
        reservation.id_reservation,
        CASE
            WHEN reservation.id_locaux IS NULL THEN 'Aucune reservation'
            ELSE reservation.description
            END AS description
    FROM
        (
            SELECT id_locaux, id_pavillon
            FROM LOCAL
            WHERE id_fonction = categorie
        ) AS lf
            CROSS JOIN
        (
            SELECT '00:00:00'::time AS heure UNION ALL
            SELECT '00:15:00'::time AS heure UNION ALL
            SELECT'00:30:00'::time AS heure UNION ALL
            SELECT'00:45:00'::time AS heure UNION ALL
            SELECT'01:00:00'::time AS heure UNION ALL
            SELECT'01:15:00'::time AS heure UNION ALL
            SELECT'01:30:00'::time AS heure UNION ALL
            SELECT'01:45:00'::time AS heure UNION ALL
            SELECT'02:00:00'::time AS heure UNION ALL
            SELECT'02:15:00'::time AS heure UNION ALL
            SELECT'02:30:00'::time AS heure UNION ALL
            SELECT'02:45:00'::time AS heure UNION ALL
            SELECT'03:00:00'::time AS heure UNION ALL
            SELECT'03:15:00'::time AS heure UNION ALL
            SELECT'03:30:00'::time AS heure UNION ALL
            SELECT'03:45:00'::time AS heure UNION ALL
            SELECT'04:00:00'::time AS heure UNION ALL
            SELECT'04:15:00'::time AS heure UNION ALL
            SELECT'04:30:00'::time AS heure UNION ALL
            SELECT'04:45:00'::time AS heure UNION ALL
            SELECT'05:00:00'::time AS heure UNION ALL
            SELECT'05:15:00'::time AS heure UNION ALL
            SELECT'05:30:00'::time AS heure UNION ALL
            SELECT'05:45:00'::time AS heure UNION ALL
            SELECT'06:00:00'::time AS heure UNION ALL
            SELECT'06:15:00'::time AS heure UNION ALL
            SELECT'06:30:00'::time AS heure UNION ALL
            SELECT'06:45:00'::time AS heure UNION ALL
            SELECT'07:00:00'::time AS heure UNION ALL
            SELECT'07:15:00'::time AS heure UNION ALL
            SELECT'07:30:00'::time AS heure UNION ALL
            SELECT'07:45:00'::time AS heure UNION ALL
            SELECT'08:00:00'::time AS heure UNION ALL
            SELECT'08:15:00'::time AS heure UNION ALL
            SELECT'08:30:00'::time AS heure UNION ALL
            SELECT'08:45:00'::time AS heure UNION ALL
            SELECT'09:00:00'::time AS heure UNION ALL
            SELECT'09:15:00'::time AS heure UNION ALL
            SELECT'09:30:00'::time AS heure UNION ALL
            SELECT'09:45:00'::time AS heure UNION ALL
            SELECT'10:00:00'::time AS heure UNION ALL
            SELECT'10:15:00'::time AS heure UNION ALL
            SELECT'10:30:00'::time AS heure UNION ALL
            SELECT'10:45:00'::time AS heure UNION ALL
            SELECT'11:00:00'::time AS heure UNION ALL
            SELECT'11:15:00'::time AS heure UNION ALL
            SELECT'11:30:00'::time AS heure UNION ALL
            SELECT'11:45:00'::time AS heure UNION ALL
            SELECT'12:00:00'::time AS heure UNION ALL
            SELECT'12:15:00'::time AS heure UNION ALL
            SELECT'12:30:00'::time AS heure UNION ALL
            SELECT'12:45:00'::time AS heure UNION ALL
            SELECT'13:00:00'::time AS heure UNION ALL
            SELECT'13:15:00'::time AS heure UNION ALL
            SELECT'13:30:00'::time AS heure UNION ALL
            SELECT'13:45:00'::time AS heure UNION ALL
            SELECT'14:00:00'::time AS heure UNION ALL
            SELECT'14:15:00'::time AS heure UNION ALL
            SELECT'14:30:00'::time AS heure UNION ALL
            SELECT'14:45:00'::time AS heure UNION ALL
            SELECT'15:00:00'::time AS heure UNION ALL
            SELECT'15:15:00'::time AS heure UNION ALL
            SELECT'15:30:00'::time AS heure UNION ALL
            SELECT'15:45:00'::time AS heure UNION ALL
            SELECT'16:00:00'::time AS heure UNION ALL
            SELECT'16:15:00'::time AS heure UNION ALL
            SELECT'16:30:00'::time AS heure UNION ALL
            SELECT'16:45:00'::time AS heure UNION ALL
            SELECT'17:00:00'::time AS heure UNION ALL
            SELECT'17:15:00'::time AS heure UNION ALL
            SELECT'17:30:00'::time AS heure UNION ALL
            SELECT'17:45:00'::time AS heure UNION ALL
            SELECT'18:00:00'::time AS heure UNION ALL
            SELECT'18:15:00'::time AS heure UNION ALL
            SELECT'18:30:00'::time AS heure UNION ALL
            SELECT'18:45:00'::time AS heure UNION ALL
            SELECT'19:00:00'::time AS heure UNION ALL
            SELECT'19:15:00'::time AS heure UNION ALL
            SELECT'19:30:00'::time AS heure UNION ALL
            SELECT'19:45:00'::time AS heure UNION ALL
            SELECT'20:00:00'::time AS heure UNION ALL
            SELECT'20:15:00'::time AS heure UNION ALL
            SELECT'20:30:00'::time AS heure UNION ALL
            SELECT'20:45:00'::time AS heure UNION ALL
            SELECT'21:00:00'::time AS heure UNION ALL
            SELECT'21:15:00'::time AS heure UNION ALL
            SELECT'21:30:00'::time AS heure UNION ALL
            SELECT'21:45:00'::time AS heure UNION ALL
            SELECT'22:00:00'::time AS heure UNION ALL
            SELECT'22:15:00'::time AS heure UNION ALL
            SELECT'22:30:00'::time AS heure UNION ALL
            SELECT'22:45:00'::time AS heure UNION ALL
            SELECT'23:00:00'::time AS heure UNION ALL
            SELECT'23:15:00'::time AS heure UNION ALL
            SELECT'23:30:00'::time AS heure UNION ALL
            SELECT'23:45:00'::time AS heure
        ) AS lookup
            LEFT JOIN reservation ON
                    lf.id_locaux = reservation.id_locaux AND
                    lf.id_pavillon = reservation.id_pavillon AND
                    lookup.heure + debut::date >= reservation.date_debut AND
                    lookup.heure + debut::date < reservation.date_fin



    WHERE
            lookup.heure >= debut::time AND
            lookup.heure <= fin::time
    ORDER BY
        lookup.heure, lf.id_locaux
)
SELECT * FROM horaire;
$$ LANGUAGE SQL;


SELECT * FROM TABLEAU('2021-09-28 00:00:00','2021-09-28 23:45:00', 110)