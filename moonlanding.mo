// Fritzson, Principles ..., Ch. 3


class MoonLanding


    class CelestialBody
        constant Real g = 6.672e-11;
        parameter Real radius;
        parameter String name;
        Real mass;
    end CelestialBody;


    class Rocket "rocket class"
        parameter String name;
        Real mass(start=1038.358);
        Real altitude(start= 59404);
        Real velocity(start= -2003);
        Real acceleration;
        Real thrust;
        // Thrust force on the rocket
        Real gravity;
        // Gravity forcefield
        parameter Real massLossRate=0.000277 ;
    equation
        (thrust-mass*gravity)/mass = acceleration;
        der(mass) = -massLossRate * abs(thrust);
        der(altitude) = velocity;
        der(velocity) = acceleration;
    end Rocket;

    parameter Real force1 = 36350;
    parameter Real force2 = 1308;
    parameter Real thrustEndTime = 210;
    parameter Real thrustDecreaseTime = 43.2;

    Rocket apollo(name="apollo12");
    CelestialBody moon(name= "moon", mass=7.382e22, radius=1.738e6);
    

equation
    apollo.thrust = if (time < thrustDecreaseTime) then force1
                    else if (time < thrustEndTime) then force2
                    else 0;
    apollo.gravity = moon.g * moon.mass / (apollo.altitude + moon.radius)^2;
end MoonLanding;