pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    const EARTH_YEAR_IN_SECONDS: f64 = 31_557_600;

    pub fn age(self: Planet, seconds: usize) f64 {
        const s: f64 = @floatFromInt(seconds);
        return switch (self) {
            Planet.mercury => s / (0.2408467 * EARTH_YEAR_IN_SECONDS),
            Planet.venus => s / (0.61519726 * EARTH_YEAR_IN_SECONDS),
            Planet.earth => s / EARTH_YEAR_IN_SECONDS,
            Planet.mars => s / (1.8808158 * EARTH_YEAR_IN_SECONDS),
            Planet.jupiter => s / (11.862615 * EARTH_YEAR_IN_SECONDS),
            Planet.saturn => s / (29.447498 * EARTH_YEAR_IN_SECONDS),
            Planet.uranus => s / (84.016846 * EARTH_YEAR_IN_SECONDS),
            Planet.neptune => s / (164.79132 * EARTH_YEAR_IN_SECONDS),
        };
    }
};

