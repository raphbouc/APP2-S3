CREATE OR REPLACE FUNCTION procedure_reserv_update() RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF EXISTS (
            SELECT 1
            FROM reservation res
            WHERE res.id_locaux = NEW.id_locaux
                AND ((res.numcubicule = NEW.numcubicule) OR (res.numcubicule IS NULL AND NEW.numcubicule IS NULL))
                AND res.date_debut < NEW.date_fin
                AND res.date_fin > NEW.date_debut
                AND res.id_reservation <> NEW.id_reservation
                AND res.id_pavillon = NEW.id_pavillon
        )
        THEN
            RAISE EXCEPTION 'Conflit dans la reservation : L interval de temps choisi chevauche une reservation existante.';
        END IF;
        IF (NEW.date_fin - NEW.date_debut) > INTERVAL '4 hours' THEN
            RAISE EXCEPTION 'La durée de réservation doit être inférieure ou égale à 4 heures.';
        END IF;

        INSERT INTO log(id_log, description, date, id_locaux, numcubicule, id_pavillon, cip)
        VALUES(DEFAULT, 'Reservation creee', CURRENT_TIMESTAMP, new.id_locaux, new.numcubicule, new.id_pavillon, new.cip);
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        IF EXISTS (
            SELECT 1
            FROM reservation res
            WHERE res.id_locaux = NEW.id_locaux
              AND res.id_pavillon = NEW.id_pavillon
              AND res.date_debut < NEW.date_fin
              AND res.date_fin > NEW.date_debut
              AND res.id_reservation <> NEW.id_reservation
        )
        THEN
            RAISE EXCEPTION 'Conflit dans la reservation : L interval de temps choisi chevauche une reservation existante.';
            END IF;
            IF (NEW.date_fin - NEW.date_debut) > INTERVAL '4 hours' THEN
                RAISE EXCEPTION 'La durée de réservation doit être inférieure ou égale à 4 heures.';
            END IF;
        INSERT INTO log(id_log, description, date, id_locaux, numcubicule, id_pavillon, cip)
        VALUES(DEFAULT, 'Reservation updatee', CURRENT_TIMESTAMP, new.id_locaux, new.numcubicule, new.id_pavillon, new.cip);
--         UPDATE log
--         SET description = 'Update de la reservation', date = CURRENT_DATE
--         WHERE id_locaux = new.id_locaux AND id_pavillon = new.id_pavillon;

        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trigger_reservation_update ON reservation;
DROP TRIGGER IF EXISTS trigger_reservation_delete ON reservation;

CREATE OR REPLACE FUNCTION procedure_reservation_delete()
    RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO log(id_log,description, date, id_locaux, id_pavillon, cip)
VALUES(DEFAULT,'Reservation annule', CURRENT_TIMESTAMP, old.id_locaux, OLD.id_pavillon, old.cip);
    RETURN new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_reservation_update
    AFTER INSERT OR UPDATE ON reservation
    FOR EACH ROW
EXECUTE PROCEDURE procedure_reserv_update();

CREATE TRIGGER trigger_reservation_delete
    AFTER DELETE
    ON reservation
    FOR EACH ROW EXECUTE PROCEDURE procedure_reservation_delete();