// jinja template
class Landing
    extends MoonLanding(
        force1 = {{ force1 }},
        force2 = {{ force2 }},
        thrustEndTime = {{ thrustEndTime }},
        thrustDecreaseTime = {{ thrustDecreaseTime }}
    );
equation
end Landing;

