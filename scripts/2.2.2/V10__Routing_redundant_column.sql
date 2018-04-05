ALTER TABLE cable ADD routings character varying(255);


UPDATE cable SET routings = names.routing_names FROM (SELECT STRING_AGG(routing.name, ', ' order by routingrow.position) AS routing_names,routingrow.cable AS cable_id FROM routing JOIN routingrow ON routingrow.routing = routing.id GROUP BY (cable_id)) names WHERE cable.id = names.cable_id;


