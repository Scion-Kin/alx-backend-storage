-- This script lists all bands that contain the keyword 'Glam rock' in their style

SELECT
    band_name,
    CASE
        WHEN split IS NULL THEN 2022 - formed
        ELSE split - formed
    END AS lifespan

FROM metal_bands WHERE style = 'Glam rock' ORDER BY lifespan DESC;

