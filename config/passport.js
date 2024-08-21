const JwtStrategy = require('passport-jwt').Strategy;
const ExtractJwt = require('passport-jwt').ExtractJwt; 
const User = require('../models/user')
const Keys = require('./keys')

// Configuración del middleware de Passport para JWT
module.exports = function(passport) {
     
    let opts = {};
    opts.jwtFromRequest = ExtractJwt.fromAuthHeaderWithScheme('jwt'); // Extrae el token del header de autorización
    opts.secretOrKey = Keys.secretOrKey // Clave secreta para verificar el token

    
    passport.use(new JwtStrategy(opts, (jwt_payload, done) => {
        
        User.findById(jwt_payload.id, (err, user) => {
            if (err) {
                return done(err, false); // Error al buscar el usuario
            }
            if (user) {
                return done(null, user); // Usuario encontrado
            }
            else {
                return done(null, false);  // Usuario no encontrado
            }
        })

    }))

}